package com.saad.group11.bean;

import java.io.Serializable;
import java.util.Date;

import com.alibaba.druid.pool.vendor.SybaseExceptionSorter;

public class Need implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String n_id;//主码
	private Double max_price;//可接受的最高价格
	private Date deadline;
	private Double min_credit;//要求卖方最低信用
	private String description;//对商品的详细要求描述
	private Integer amount;//需要的数量
	private String state;//需求审核情况
	
	//所属书目及ISBN
	private BookList bookList;	
	private String ISBN;
	
	//所属客户及客户编号
	private Client client;	
	private String c_id;
	
	public Need(Double max_price, Date deadline2, Double min_credit, String description, Integer amount) {
		super();
		this.n_id = System.currentTimeMillis()+"";
		this.max_price = max_price;
		this.deadline = deadline2;
		this.min_credit = min_credit;
		this.description = description;
		this.amount = amount;
	}


	public Need() {
		super();
	}
	
	
	public String getN_id() {
		return n_id;
	}
	public void setN_id(String n_id) {
		this.n_id = n_id;
	}
	public Double getMax_price() {
		return max_price;
	}
	public void setMax_price(Double max_price) {
		this.max_price = max_price;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	public Double getMin_credit() {
		return min_credit;
	}
	public void setMin_credit(Double min_credit) {
		this.min_credit = min_credit;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public BookList getBookList() {
		return bookList;
	}
	public void setBookList(BookList bookList) {
		this.bookList = bookList;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	
	
	@Override
	public String toString() {
		return "Need [max_price=" + max_price + ", deadline=" + deadline + ", min_credit=" + min_credit
				+ ", description=" + description + ", amount=" + amount + ", state=" + state + ", ISBN=" + ISBN
				+ ", c_id=" + c_id + "]";
	}
}
