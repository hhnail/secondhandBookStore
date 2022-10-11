package com.saad.group11.service;

import java.util.List;

import com.saad.group11.bean.Cart;
import com.saad.group11.bean.Client;
import com.saad.group11.bean.Order;
import com.saad.group11.bean.OrderLine;
import com.saad.group11.bean.Page;

public interface OrderService {
	
	Page<Order> getOrdersInPage(String pageNo);
	
	
	List<Order> getAllOrders();
	
	
	List<OrderLine> getOrderDetail(String o_id);


	List<Order> getClientOrders(String c_id);


	OrderLine getOrderLineByOlId(String ol_id);

	/**
	 * 结账
	 * 		1.生成订单
	 * 		2.生成订单详情
	 * 		3.更改库存和销量
	 * 		4.清空购物车
	 * 
	 * @return 返回订单号
	 */
	String createOrder(Cart cart, Client client, String poster, String phone, String post_address);
}
