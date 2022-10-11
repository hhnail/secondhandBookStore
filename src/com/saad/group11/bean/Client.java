package com.saad.group11.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Client implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String c_id;
	private String password;
	private String c_name;
//	private Enum<Gender> gender;
	private String gender;
	private String address;//客户地址（用于后续物流功能）
	private Double credit;//客户信用（用于规范客户行为，并为顾客购书提供信息）
	//private List<BookList> bookList;//客户应该没有书目，只有具体的某一个本书，而具体的每一个书才有“书目”
	private List<StorePersonal> books;//拥有的书（一个客户拥有*本书）
	private List<Order> orders;
	private List<Need> needs;
	
	//构造器
	//用于登录的构造器
	public Client(String c_id, String password) {
		super();
		this.c_id = c_id;
		this.password = password;
	}
	public Client(String c_id, String password, String c_name, String gender, String address) {
		super();
		this.c_id = c_id;
		this.password = password;
		this.c_name = c_name;
		this.gender = gender;
		this.address = address;
		this.credit = 10.0;
		this.books = new ArrayList<StorePersonal>();
		this.orders = new ArrayList<Order>();
		this.needs = new ArrayList<Need>();
	}
	public Client(String c_id, String password, String c_name, String address) {
		super();
		this.c_id = c_id;
		this.password = password;
		this.c_name = c_name;
//		this.gender = Gender.Unknown;
		this.gender = "Unknown";
		this.address = address;
		this.credit = 10.0;
		this.books = new ArrayList<StorePersonal>();
		this.orders = new ArrayList<Order>();
		this.needs = new ArrayList<Need>();
	}


	public Client() {
		super();
	}
	

	//get,set
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Double getCredit() {
		return credit;
	}
	public void setCredit(Double credit) {
		this.credit = credit;
	}
	public List<StorePersonal> getBooks() {
		return books;
	}
	public void setBooks(List<StorePersonal> books) {
		this.books = books;
	}
	public List<Order> getOrders() {
		return orders;
	}
	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}
	public List<Need> getNeeds() {
		return needs;
	}
	public void setNeeds(List<Need> needs) {
		this.needs = needs;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	/*
	public Enum<Gender> getGender() {
		return gender;
	}
	public void setGender(Enum<Gender> gender) {
		this.gender = gender;
	}
	*/
	//toString
	@Override
	public String toString() {
		return "Client [c_id=" + c_id + ", password=" + password + ", c_name=" + c_name + ", address=" + address
				+ ", credit=" + credit + "]";
	}
	
}
