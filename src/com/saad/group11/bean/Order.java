package com.saad.group11.bean;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.saad.group11.util.JDBCUtils;

public class Order implements Serializable{
	private static final long serialVersionUID = 1L;//序列化 session

	private String o_id;
	private Date o_time;
	private int count;
	private double price_total;//总价格
	private String o_state;//状态
	
	private String c_id;
	private Client client;//所属客户（一个订单只能属于一个客户）

	private List<OrderLine> orderLines;//所含订单行（一个订单有“1~*”条订单）
	
	private String poster;
	private String phone;
	private String post_address;

	/**
	 * createOrder
	 * 		1.生成订单
	 * 		2.生成订单详情
	 * 		3.更改库存和销量
	 * 		4.清空购物车
	 */

	//构造器

	public Order() {
		super();
	}
	public Order(String o_id, Date ol_time, int count, double price_total, String o_state, String c_id) {
		super();
		this.o_id = o_id;
		this.o_time = ol_time;
		this.count = count;
		this.price_total = price_total;
		this.o_state = o_state;
		this.c_id = c_id;
		this.orderLines = new ArrayList<OrderLine>();
	}
	


	public Order(String o_id, Date o_time, int count, double price_total, String o_state, String c_id,
		 String poster, String phone, String post_address) {
		super();
		this.o_id = o_id;
		this.o_time = o_time;
		this.count = count;
		this.price_total = price_total;
		this.o_state = o_state;
		this.c_id = c_id;
		this.orderLines = new ArrayList<OrderLine>();
		this.poster = poster;
		this.phone = phone;
		this.post_address = post_address;
	}
	//get,set
	public String getO_id() {
		return o_id;
	}
	public void setO_id(String o_id) {
		this.o_id = o_id;
	}
	public double getPrice_total() {
		return price_total;
	}
	public void setPrice_total(double price_total) {
		this.price_total = price_total;
	}

	
	
	/**
	 * 底层BaseDao无法获取Date类型的时间
	 * 这里用PreparedStatement自己赋值
	 * 
	 * 
	 */
	public Date getO_time() {
		return this.o_time;
	}
	public void setO_time(Date o_time) {
		// 获取连接
		Connection connection = JDBCUtils.getConnection();
		String sql = "select o_time from `order` where o_id = ?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, this.getO_id());
			ResultSet res = preparedStatement.executeQuery();
			while(res.next()) {
//				System.out.println("Order res:" + res.getObject(1));
				this.o_time = ((java.util.Date)res.getObject(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtils.releaseConnection(connection);
		}
	}
	
	
	/**
	 * 用于前端jsp页面展示的时间
	 * 
	 */
	public String getTimeForJsp() {
		SimpleDateFormat dataformatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return dataformatter.format(this.getO_time());
	}
	
	public List<OrderLine> getOrderLines() {
		return orderLines;
	}
	public void setOrderLines(List<OrderLine> orderLines) {
		this.orderLines = orderLines;
	}
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getO_state() {
		return o_state;
	}
	public void setO_state(String o_state) {
		this.o_state = o_state;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPost_address() {
		return post_address;
	}
	public void setPost_address(String post_address) {
		this.post_address = post_address;
	}
	@Override
	public String toString() {
		return "Order [o_id=" + o_id + ", o_time=" + o_time + ", count=" + count + ", price_total=" + price_total
				+ ", o_state=" + o_state + ", c_id=" + c_id + "]";
	}



}
