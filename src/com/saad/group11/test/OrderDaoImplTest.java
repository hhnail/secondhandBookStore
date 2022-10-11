package com.saad.group11.test;

import java.util.Date;
import java.util.List;

import org.junit.jupiter.api.Test;

import com.saad.group11.bean.Order;
import com.saad.group11.bean.OrderLine;
import com.saad.group11.dao.OrderDao;
import com.saad.group11.dao.OrderLineDao;
import com.saad.group11.dao.impl.OrderDaoImpl;
import com.saad.group11.dao.impl.OrderLineDaoImpl;

class OrderDaoImplTest {

	private OrderDao orderDao = new OrderDaoImpl();
	private OrderLineDao orderLineDao = new OrderLineDaoImpl();
	
	
	
	@Test
	void testInsertOrder() {
		Order order = new Order("change", new Date(), 2, 10.0, "交易中", "001");
		System.out.println(order);
		orderDao.insertOrder(order);
		
		
		OrderLine orderLine = new OrderLine(null, 10.0, "交易中", "change", "978-1-1");
		orderLineDao.addOrderLine(orderLine);
	}
	
	@Test
	void testGetAllOrders() {
		List<Order> orderList = orderDao.getAllOrders();
		for (Order order : orderList) {
			System.out.println(order);
		}
	}
	
	
	@Test
	void testGetOrderDetail() {
		String orderId = "1610326118197test";
		List<OrderLine> orderLine = orderLineDao.getOrderDetail(orderId);
		for (OrderLine orderLine2 : orderLine) {
			System.out.println(orderLine2);
		}
	}
	

}
