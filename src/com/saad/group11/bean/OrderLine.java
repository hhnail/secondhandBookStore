package com.saad.group11.bean;

import java.io.Serializable;
import java.util.Date;

public class OrderLine implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String ol_id;//订单行编号 唯一标识 
	private double price;//包装类Double可能拿不到数据库数据
	private String state;
	private ReturnMessage returnMessage;//退回信息（订单行与退货记录为一对一关系）
	
	private String o_id;
	private Order order;//所属订单（一个订单行只属于一个订单）
	
	private String p_id;
	private StorePersonal storePensonal;//该订单行对应的商品
	
	
	//构造器
	public OrderLine() {
		super();
	}
	public OrderLine(String ol_id, double price, String state, String o_id,
			String p_id) {
		super();
		this.ol_id = ol_id;
		this.price = price;
		this.state = state;
		this.o_id = o_id;
		this.p_id = p_id;
	}


	//get,set
	public String getOl_id() {
		return ol_id;
	}
	public void setOl_id(String ol_id) {
		this.ol_id = ol_id;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public ReturnMessage getReturnMessage() {
		return returnMessage;
	}
	public void setReturnMessage(ReturnMessage returnMessage) {
		this.returnMessage = returnMessage;
	}
	public StorePersonal getStorePensonal() {
		return storePensonal;
	}
	public void setStorePensonal(StorePersonal storePensonal) {
		this.storePensonal = storePensonal;
	}
	public String getO_id() {
		return o_id;
	}
	public void setO_id(String o_id) {
		this.o_id = o_id;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	
	@Override
	public String toString() {
		return "OrderLine [ol_id=" + ol_id + ", price=" + price + ", state=" + state + ", returnMessage="
				+ returnMessage + ", o_id=" + o_id + ", p_id=" + p_id + "]";
	}
	
	
	
	
}
