package com.saad.group11.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saad.group11.bean.Cart;
import com.saad.group11.bean.Client;
import com.saad.group11.bean.Order;
import com.saad.group11.bean.OrderLine;
import com.saad.group11.bean.Page;
import com.saad.group11.bean.StorePersonal;
import com.saad.group11.service.BookService;
import com.saad.group11.service.OrderService;
import com.saad.group11.service.impl.BookServiceImpl;
import com.saad.group11.service.impl.OrderServiceImpl;

public class OrderServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	private OrderService orderService = new OrderServiceImpl();
	private BookService bookService = new BookServiceImpl();

	/**
	 * 通过购物车生成订单、订单行，并返回订单号
	 * 
	 * 
	 */
	protected void checkOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//取值
		HttpSession session = request.getSession();
		Cart cart = (Cart)session.getAttribute("cart");
		Client client = (Client)session.getAttribute("client");

		System.out.println("cart:" + cart);
		System.out.println("client:" + client);

		//请求service
//		String o_id = orderService.createOrder(cart, client);

		//存放到session域中
//		session.setAttribute("o_id", o_id);

		//跳转
		response.sendRedirect(request.getContextPath() + "/pages/cart/checkout.jsp");
	}


	/**
	 * 查看所有的订单
	 * 供管理员使用
	 * 
	 * 
	 */
	protected void getAllOrders(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.取值
		String pageNo = request.getParameter("pageNo");
		List<Order> orderList = orderService.getAllOrders();

		//test1
		//		for (Order order : orderList) {
		//			System.out.println(order);
		//			System.out.println("========================");
		//			List<OrderLine> orderLineList = order.getOrderLines();
		//			for (OrderLine orderLine : orderLineList) {
		//				System.out.println(orderLine);
		//			}
		//		}

		//2.放到域中
		request.setAttribute("orders", orderList);

		//3..跳转
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/manager/order_manager.jsp");
		requestDispatcher.forward(request, response);
	}


	/**
	 * 查看个人历史订单
	 * 供用户使用
	 * 
	 * 
	 */
	protected void getClientOrders(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.取值
		//		String pageNo = request.getParameter("pageNo");
		HttpSession session = request.getSession();
		String o_id = request.getParameter("o_id");
		Client client = (Client)session.getAttribute("client");
		String c_id = client.getC_id();
		
		
		//test1
		System.out.println("getClientOrders c_id:" + c_id);
		

		//2.调用service
		List<Order> orderList = orderService.getClientOrders(c_id);
		//3.放到域中
		request.setAttribute("orders", orderList);

		//3..跳转
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/manager/order_manager.jsp");
		requestDispatcher.forward(request, response);
	}
	/**
	 * 从商品详情页“购买”下单
	 * 
	 * 
	 */
	protected void createOrderOnDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.取值
		//1.1客户信息
		HttpSession session = request.getSession();
		Client client = (Client)session.getAttribute("client");
		//test1
		System.out.println("createOrderOnDetail client:" + client);

		//1.2订单信息
		String[] bookId = request.getParameterValues("choiceBook");
		
		//test2
		System.out.println("String[] bookId:" + bookId);
		String poster = request.getParameter("poster");
		String phone = request.getParameter("phone");
		String post_address = request.getParameter("post_address");
		
		Cart orderToCart = new Cart();
		for (int i = 0; i < bookId.length; i++) {
			//test
			System.out.println("new Cart bookId:" + bookId[i]);

			StorePersonal bookById = bookService.getBookById(bookId[i]);
			orderToCart.addBookToCart(bookById);
		}

		//请求service
		String o_id = orderService.createOrder(orderToCart, client,poster,phone,post_address);
		//存放到session域中
		session.setAttribute("o_id", o_id);
		session.removeAttribute("cart");
		
		//跳转
		response.sendRedirect(request.getContextPath() + "/pages/cart/checkout.jsp");

	}


	/**
	 * 查看订单详情
	 * 
	 * 
	 */
	protected void getOrderDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.取值
		String orderId = request.getParameter("o_id");
		
		//test1
		System.out.println(orderId);

		//2.调用
		List<OrderLine> orderDetail = orderService.getOrderDetail(orderId);
		
		//test2
		for (OrderLine orderLine : orderDetail) {
			System.out.println("getOrderDetail test2 orderLine"+orderLine);
		}
		
		//3.放到域中
		request.setAttribute("orderDetail", orderDetail);
		
		int orderIdForClient = 1;
		request.setAttribute("orderIdForClient", orderIdForClient);

		//4.跳转
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/manager/order_detail_manager.jsp");
		requestDispatcher.forward(request, response);
	}

}
