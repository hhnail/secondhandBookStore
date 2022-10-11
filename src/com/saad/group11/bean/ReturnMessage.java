package com.saad.group11.bean;

import java.io.Serializable;
import java.util.Date;

import com.saad.group11.z_discard.ReturnMessageEnum;

public class ReturnMessage implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String r_id;
	private Date r_time;
	private String reason;
	private String state;//退货申请的状态（只能“等待处理，同意，拒绝”其中一种状态）
	private String ol_id;
	private OrderLine orderLine;
	
	//构造器
	public ReturnMessage() {
		super();
	}

	//get,set
	public String getR_id() {
		return r_id;
	}

	public void setR_id(String r_id) {
		this.r_id = r_id;
	}

	public Date getR_time() {
		return r_time;
	}

	public void setR_time(Date r_time) {
		this.r_time = r_time;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public OrderLine getOrderLine() {
		return orderLine;
	}

	public void setOrderLine(OrderLine orderLine) {
		this.orderLine = orderLine;
	}

	public String getOl_id() {
		return ol_id;
	}

	public void setOl_id(String ol_id) {
		this.ol_id = ol_id;
	}
	
	
	
	
	
}
