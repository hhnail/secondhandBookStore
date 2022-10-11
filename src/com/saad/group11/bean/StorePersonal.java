package com.saad.group11.bean;

import java.io.Serializable;

import com.saad.group11.service.BookService;
import com.saad.group11.service.impl.BookServiceImpl;

public class StorePersonal implements Serializable{
	private static final long serialVersionUID = 1L;
	//成员变量
	private String p_id;//每一本书都有唯一的编号
	private double price;
	private double degree;//图书新旧程度
	private String des;//商品描述
	private String state;//状态
	private int stock;
	
	private String ISBN;
	private String c_id;
	
	private Client client;//每本书都只属于某一个客户
	private BookList bookList;

	//含参构造器
	public StorePersonal(String p_id, double price, double degree, String des) {
		super();
		this.p_id = p_id;
		this.price = price;
		this.degree = degree;
		this.des = des;
	}
	public StorePersonal(String p_id, double price, double degree, String des, Client client, BookList bookList) {
		super();
		this.p_id = p_id;
		this.price = price;
		this.degree = degree;
		this.des = des;
		this.client = client;
		this.bookList = bookList;
	}
	public StorePersonal() {//无参构造器
		super();
	}
	
	//get,set
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getDegree() {
		return degree;
	}
	public void setDegree(double degree) {
		this.degree = degree;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	public BookList getBookList() {
		return bookList;
	}
	public void setBookList(BookList bookList) {
		this.bookList = bookList;
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
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	
	/**
	 * 获取该书目的库存stock
	 * 
	 */
	public int getStock() {
		BookService bookService = new BookServiceImpl();
		return bookService.getStock(ISBN);
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	@Override
	public String toString() {
		return "StorePersonal [p_id=" + p_id + ", price=" + price + ", degree=" + degree + ", des=" + des + ", state="
				+ state + ", stock=" + stock + ", ISBN=" + ISBN + ", c_id=" + c_id + "]";
	}
	
	
	
}
