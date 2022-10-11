package com.saad.group11.bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class CartItem implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private List<StorePersonal> book;
	private double price;//单购物项项总价
	private int count;//数量
	
	public CartItem() {
		super();
	}
	public CartItem(StorePersonal book) {
		super();
		List<StorePersonal> itemList = new ArrayList<StorePersonal>();
		itemList.add(book);
		this.book = itemList;
		this.price = book.getPrice();
		this.count = 1;
	}
	
	public CartItem(List<StorePersonal> book) {
		super();
		this.book = book;
		this.price = this.getPrice();

	}
	public List<StorePersonal> getBook() {
		return book;
	}
	public void setBook(List<StorePersonal> book) {
		this.book = book;
	}
	
	/**
	 * 获取某购物车项的总价
	 * 
	 * 
	 * 
	 */
//	BigDecimal singlePrice = new BigDecimal(price+"");
	public double getPrice() {
		BigDecimal dPrice = new BigDecimal("0.0");
		for (StorePersonal item : book) {
			BigDecimal singlePrice = new BigDecimal(item.getPrice()+"");
			dPrice = dPrice.add(singlePrice);
		}
		return dPrice.doubleValue();
	}
	
	public void setPrice(double price) {
		this.price = price;
	}
	
	
	public int getCount() {
		return book.size();
	}
	
	public void setCount(int count) {
		this.count = count;
	}
	
	public boolean isExistByISBN(String ISBN) {
		boolean flag = false;
		StorePersonal book = this.book.get(0);
		String itemISBN = book.getBookList().getISBN();
		if(ISBN.equals(itemISBN)) {
			flag = true;
		}
		return flag;
	}
	
	public String getISBN() {
		StorePersonal book = this.book.get(0);
		return book.getBookList().getISBN();
	}
	public String getB_name() {
		StorePersonal book = this.book.get(0);
		return book.getBookList().getB_name();
	}
	public String getImg_path() {
		StorePersonal book = this.book.get(0);
		return book.getBookList().getImg_path();
	}
	
	

	@Override
	public String toString() {
		return "CarItem [book=" + book + ", price=" + price + "]";
	}

}
