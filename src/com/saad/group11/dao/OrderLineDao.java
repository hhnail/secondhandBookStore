package com.saad.group11.dao;

import java.util.List;

import com.saad.group11.bean.OrderLine;
import com.saad.group11.bean.Page;

public interface OrderLineDao {


	/**
	 * 生成订单行
	 * 
	 * 
	 * 
	 */
	public void addOrderLine(OrderLine orderLine) ;



	/**
	 * 查询所有的订单行
	 * sql:select * from orderline
	 * 
	 * 
	 */
	public List<OrderLine> getAllOrderLines();
	
	/**
	 * 根据订单行id查询订单行
	 * 
	 * 
	 */
	public List<OrderLine> getOrderLinesById(String ol_id);
	/**
	 * 获取分页的订单行信息
	 * 
	 * 
	 * 
	 * @param page
	 * @return
	 */
	public Page<OrderLine> getOrderLinesInPage(Page<OrderLine> Page);



	/**
	 * 删除
	 * 
	 * 
	 */

	public void deleteOrderLineById(String Ol_id);

	/**
	 * 更新
	 * 
	 * 
	 */
	public void updateOrderLineById(String Ol_id);
	
	
	/**
	 * 根据订单号查询订单细则
	 * 
	 * sql：
	 * 
	 * 
	 */
	public List<OrderLine> getOrderDetail(String o_id);

}
