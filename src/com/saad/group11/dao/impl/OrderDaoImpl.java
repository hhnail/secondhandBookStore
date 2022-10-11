package com.saad.group11.dao.impl;

import java.util.List;

import com.saad.group11.bean.Client;
import com.saad.group11.bean.Order;
import com.saad.group11.bean.OrderLine;
import com.saad.group11.bean.Page;
import com.saad.group11.dao.BaseDao;
import com.saad.group11.dao.ClientDao;
import com.saad.group11.dao.OrderDao;
import com.saad.group11.dao.OrderLineDao;

public class OrderDaoImpl extends BaseDao<Order> implements OrderDao {

	OrderLineDao orderLineDao = new OrderLineDaoImpl();
	ClientDao clientDao = new ClientDaoImpl();

	@Override
	public void insertOrder(Order order) {
		String sql = "insert into `order` values(?,?,?,?,?,?,?,?,?)";
		this.update(sql, order.getO_id(),order.getO_time(),order.getCount(),order.getPrice_total(),order.getO_state(),order.getC_id(),order.getPost_address(),order.getPoster(),order.getPhone());
	}

	@Override
	public void deleteOrderBId(String o_id) {

	}

	@Override
	public Order getorderById(String o_id) {

		return null;
	}

	@Override
	public void updateOrder(Order orders, String oldo_id) {

	}

	@Override
	public Page<Order> getOrdersInPage(Page<Order> page) {
		String sql = "select count(1) from orderline,client,order where order.c_id=client.c_id and order.o_id=orderline.o_id;";
		Object tempTotalRecord = this.getSingeValue(sql);
		int totalRecord= Integer.parseInt(tempTotalRecord + "");
		page.setTotalRecord(totalRecord);
		System.out.println("test1总页数" + page.getTotalPageNo());
		sql = "select * "
				+ "from orderline,client,order"
				+ "where  order.c_id=client.c_id and order.o_id=orderline.o_id"
				+ " LIMIT ?,?";
		List<Order> list = this.getBeanList(sql);

		//为每一个order set client和orderline
		//		for (Order order : list) {
		//			OrderLine orderline = orderLineDao.getOrderLinesById(order.getO_id());
		//			Client client = clientDao.getClientById(order.getClient().getC_id());
		//			order.setOrderLines((List<OrderLine>) orderline);
		//			order.setClient(client);	    	  
		//		}

		//将最后完整的list set 到 page中
		page.setList(list);
		System.out.println(page.getTotalPageNo());
		return page;

	}



	/**
	 * 管理员查看所有的订单
	 * 
	 */
	@Override
	public List<Order> getAllOrders() {
		//1.获取order表内信息
		String sql = "select * "
				+ "from `order` "
				+ "where 1=1;";
		List<Order> list = this.getBeanList(sql);
		//2.为每一个order set client
		for (Order order : list) {
			//2.1为order set client
			Client client = clientDao.getClientById(order.getC_id());
			order.setClient(client);    
			order.getO_time();

			//2.2为order set orderline

		}
		return list;
	}


	/**
	 * 用户查看个人历史订单
	 * 
	 * 
	 */
	@Override
	public List<Order> getClientOrders(String c_id){
		//1.获取order表内信息
		String sql = "select * "
				+ "from `order` "
				+ "where c_id=? "
				+ "order by o_time desc";
		List<Order> list = this.getBeanList(sql,c_id);
		return list;
	}
}
