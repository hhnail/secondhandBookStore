package com.saad.group11.dao;

import java.util.List;

import com.saad.group11.bean.Order;
import com.saad.group11.bean.OrderLine;
import com.saad.group11.bean.Page;

public interface OrderDao {

	/**
	 * 添加order
	 * sql：insert into `order` values(?,?,?,?,?,?)
	 * 表名要用飘号`引起来
	 * 
	 */
	void insertOrder(Order order);//interface的方法默认是public


	/*
	 * 查询所有的订单
	 * sql:select * from client;
	 */
	public List<Order> getAllOrders();

	/**
	 * 获取分页的订单信息
	 * 
	 * @param page
	 * @return
	 */
	public Page<Order> getOrdersInPage(Page<Order> page);

	
	/**
	 * 根据订单编号删除订单信息
	 * @param o_id
	 * 
	 * sql:delete from order where `o_id` = ?;
	 */
	public void deleteOrderBId(String o_id);

	
	/**
	 * 根据订单编号o_id查询书籍
	 * 
	 * @return
	 */
	public Order getorderById(String o_id);

	
	/**
	 * 根据o_id订单编号更新订单信息
	 * 
	 * 			1.先通过o_id获取订单
	 * 			2.更新对应订单信息
	 * 
	 * sql:update booklist set ISBN=?,b_name=?,author=?,publisher=?,b_date=? where `ISBN` = ?;
	 * 
	 */
	public void updateOrder(Order orders, String oldo_id);


	/**
	 * 用户查看个人历史订单
	 * 
	 */
	List<Order> getClientOrders(String c_id);
	

}
