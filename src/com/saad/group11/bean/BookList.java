package com.saad.group11.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class BookList implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String ISBN;
	private String b_name;
	private String author;//作者
	private String publisher;//出版社
	private String b_date;//出版时间
	private String img_path;//图片所在路径
	
	private List<Client> clients;//顾客集合（因为一类书有多个客户）
	private List<StorePersonal> books;
	
	//构造器
	public BookList(String iSBN, String b_name, String author, String publisher, String b_date) {
		super();
		this.ISBN = iSBN;
		this.b_name = b_name;
		this.author = author;
		this.publisher = publisher;
		this.b_date = b_date;
		this.img_path = "static/img/default.jpg";
		this.clients = new ArrayList<Client>();
		this.books = new ArrayList<StorePersonal>();
	}
	
	public BookList(String iSBN, String b_name, String author,String publisher, String b_date, String img_path) {
		super();
		this.ISBN = iSBN;
		this.b_name = b_name;
		this.author = author;
		this.publisher = publisher;
		this.b_date = b_date;
		this.img_path = img_path;
		this.clients = new ArrayList<Client>();
		this.books = new ArrayList<StorePersonal>();
	}
	
	public BookList() {
		super();
	}
	
	

	//get,set
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	public List<Client> getClients() {
		return clients;
	}
	public void setClients(List<Client> clients) {
		this.clients = clients;
	}
	
	public List<StorePersonal> getBooks() {
		return books;
	}
	public void setBooks(List<StorePersonal> books) {
		this.books = books;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	@Override
	public String toString() {
		return "BookList [ISBN=" + ISBN + ", b_name=" + b_name + ", author=" + author + ", publisher=" + publisher
				+ ", b_date=" + b_date + ", img_path=" + img_path + "]";
	}

	
}
