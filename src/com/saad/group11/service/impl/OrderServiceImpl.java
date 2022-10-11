package com.saad.group11.service.impl;

import java.util.Date;
import java.util.List;

import com.saad.group11.bean.Cart;
import com.saad.group11.bean.CartItem;
import com.saad.group11.bean.Client;
import com.saad.group11.bean.Order;
import com.saad.group11.bean.OrderLine;
import com.saad.group11.bean.Page;
import com.saad.group11.bean.StorePersonal;
import com.saad.group11.dao.BookDao;
import com.saad.group11.dao.BookListDao;
import com.saad.group11.dao.ClientDao;
import com.saad.group11.dao.OrderDao;
import com.saad.group11.dao.OrderLineDao;
import com.saad.group11.dao.impl.BookDaoImpl;
import com.saad.group11.dao.impl.BookListDaoImpl;
import com.saad.group11.dao.impl.ClientDaoImpl;
import com.saad.group11.dao.impl.OrderDaoImpl;
import com.saad.group11.dao.impl.OrderLineDaoImpl;
import com.saad.group11.service.BookService;
import com.saad.group11.service.OrderService;

public class OrderServiceImpl implements OrderService {

	private OrderDao orderDao = new OrderDaoImpl();
	private OrderLineDao orderLineDao = new OrderLineDaoImpl();
	private BookListDao bookListDao = new BookListDaoImpl();
	private BookDao bookDao= new BookDaoImpl();
	private ClientDao clientDao = new ClientDaoImpl();
	private BookService bookService  = new BookServiceImpl();


	/**
	 * 结账
	 * 		1.生成订单
	 * 		2.生成订单详情
	 * 		3.更改库存和销量
	 * 		4.清空购物车
	 * 
	 * @return 返回订单号
	 */
	@Override
	public String createOrder(Cart cart, Client client,String poster,String phone,String post_address) {

		//1.生成订单
		//1.1 获取下单用户的id
		String c_id = client.getC_id();
		//1.2 生成订单id = 时间戳 + c_ids
		String o_id = System.currentTimeMillis() + "" +  c_id;
		Order order = new Order(o_id, new Date(),cart.getTotalCount(),cart.getTotalPrice(), "交易中", c_id, poster, phone, post_address);

		orderDao.insertOrder(order);

		//2.生成订单详情
		//2.1 获取所有的购物项
		List<CartItem> cartItems = cart.getCartItems();
		//2.2 遍历购物项生成订单详情
		for (CartItem cartItem : cartItems) {
			//2.2.1获取所需信息
			List<StorePersonal> itemBooks = cartItem.getBook();
			for (StorePersonal book : itemBooks) {
				String p_id = book.getP_id();
				String ISBN = book.getBookList().getISBN();
				//				String ISBN = book.getBookList().getISBN();
				//				BookList bookList = bookListDao.getBookListByISBN(ISBN);

				//2.2.2将书的状态设置为“已售”
				bookDao.setBookState(book, "已售", ISBN);

				//2.2.3生成订单
				OrderLine orderLine = new OrderLine(null, cartItem.getPrice(), "交易中", o_id, p_id);
				orderLineDao.addOrderLine(orderLine);
			}



			//更新库存及销量
			//			int stock = book.getStock() - cartItem.getCount();
			//			int saled = bookList.getSale();//原来的销量
			//			int sale = saled + cartItem.getCount();
			//			bookListDao.updateBookList(stock, sale, ISBN);
		}

		//4.清空购物车
		cart.emptyCart();

		//5.返回订单号
		return o_id;
	}


	/**
	 * 
	 * 
	 */
	@Override
	public Page<Order> getOrdersInPage(String pageNo) {
		Page<Order> page = new Page<Order>();
		int defaultPageNo = 1;
		try {
			defaultPageNo = Integer.parseInt(pageNo);
		} catch (NumberFormatException e) {
		}
		page.setPageNo(defaultPageNo);//目前为止，page只有一个“当前页面”属性
		return orderDao.getOrdersInPage(page);		
	}


	@Override
	public List<Order> getAllOrders() {
		return orderDao.getAllOrders();
	}


	/**
	 * 
	 * 
	 */
	@Override
	public List<OrderLine> getOrderDetail(String o_id) {
		List<OrderLine> orderDetail = orderLineDao.getOrderDetail(o_id);
		for (OrderLine orderLine : orderDetail) {
			orderLine.setStorePensonal( bookService.getBookById(orderLine.getP_id()));
			System.out.println(orderLine.getStorePensonal().getBookList().getB_name());
		}
		return orderDetail;
	}

	@Override
	public List<Order> getClientOrders(String c_id) {
		List<Order> clientOrders = orderDao.getClientOrders(c_id);
		//2.为每一个order set client
		for (Order order : clientOrders) {
			//2.1为order set client
			Client client = clientDao.getClientById(c_id);
			order.setClient(client);    
//			order.getO_time();
			
			//2.2为order set orderline
			List<OrderLine> orderDetail = orderLineDao.getOrderDetail(order.getO_id());
			order.setOrderLines(orderDetail);
		}
		return clientOrders;
	}


	@Override
	public OrderLine getOrderLineByOlId(String ol_id) {
		return null;
	}

}
