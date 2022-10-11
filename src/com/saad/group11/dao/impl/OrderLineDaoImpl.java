package com.saad.group11.dao.impl;

import java.util.List;

import com.saad.group11.bean.OrderLine;
import com.saad.group11.bean.Page;
import com.saad.group11.dao.BaseDao;
import com.saad.group11.dao.OrderLineDao;

public class OrderLineDaoImpl extends BaseDao<OrderLine> implements OrderLineDao  {

	
	/**
	 * 增加订单行
	 * 
	 * 
	 * 
	 */
	@Override
	public void addOrderLine(OrderLine orderLine) {
		String sql= "INSERT INTO `orderline` VALUES (?,?,?,?,?)";
		this.update(sql, orderLine.getOl_id(), orderLine.getPrice(),orderLine.getState(),orderLine.getO_id(),orderLine.getP_id());
	}
	
	
	
	/**
	 * 获取所有订单行
	 * 
	 * 
	 */
	@Override
	public List<OrderLine> getAllOrderLines() {
		String sql = "select * from orderline";
		return this.getBeanList(sql);
	}

	@Override
	public Page<OrderLine> getOrderLinesInPage(Page<OrderLine> Page) {
		String sql = "select count(ol_id) from orderline" ;
		Object tempTotalRecord = this.getSingeValue(sql);

		int totalRecord = Integer.parseInt(tempTotalRecord + "");

		//从dao中获取后赋值setTotalRecord
		Page.setTotalRecord(totalRecord);

		sql = "select *  from orderline "
				+ "where 1=1 "
				+ "limit ?,?"; 
		List<OrderLine> list=this.getBeanList(sql, (Page.getPageNo()-1)*Page.PAGE_SIZE,Page.PAGE_SIZE);

		Page.setList(list);
		return Page;
	}

	

	/**删除订单行
	 * 
	 * 
	 * 
	 */
	@Override
	public void deleteOrderLineById(String Ol_id) {
		String sql = "delete from orderline where 'ol_id' = ? ";
		Object ol_id = null;
		this.update(sql, ol_id);
	}


	/**
	 * 
	 * 
	 */
	@Override
	public List<OrderLine> getOrderLinesById(String ol_id) {	
		String sql = "select * from orderline where 'ol_id' = ?";
		return this.getBeanList(sql, ol_id);
	}


	/**
	 * 
	 * 
	 */
	@Override
	public void updateOrderLineById(String ol_id) {
		String sql = "update orderline set ol_id= ?, price= ?,state= ?";
		this.update(sql);

	}
	
	
	
	/**
	 * 获取订单细则
	 * 
	 * 
	 * 
	 */
	@Override
	public List<OrderLine> getOrderDetail(String o_id) {
		String sql = "select * "
				+ "from orderline,storepersonal "
				+ "where orderline.p_id = storepersonal.p_id "
				+ "and o_id = ?;";
		return this.getBeanList(sql, o_id);
	}

}
