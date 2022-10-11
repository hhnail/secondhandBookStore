package com.saad.group11.bean;

import java.io.Serializable;
import java.util.List;

public class Page<T> implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int pageNo;						//当前页面										用户
	private int totalPageNo;				//总页数=总记录数/每页显示的数量						内部算法
	private int totalRecord;				//总记录数										dao，sql:select count(ISBN) from booklist
	public static final int PAGE_SIZE = 4;	//每页显示的数量									静态常量
	private List<T> list;					//当前页的数据集合  PAGE_SIZE个结果，s封装为结果集		dao，sql:select * from booklist LIMIT (pageNo-1)*PAGE_SIZE,PAGE_SIZE;
	public Page(int pageNo, int totalPageNo, int totalRecord, List<T> list) {
		super();
		this.pageNo = pageNo;
//		this.pageNo = 1;
		this.totalPageNo = totalPageNo;
		this.totalRecord = totalRecord;
		this.list = list;
	}
	public Page() {
		super();
//		this.pageNo = 1;
	}
	public int getPageNo() {
		if(pageNo < 1) {
			//输入跳转页面小于1，则跳转到第1页
			return 1;
		}
		if(pageNo > getTotalPageNo()) {
			//输入跳转页面小于1，则跳转到最后1页
			/*
			 * 要调用getTotalPageNo()，
			 * 而不能直接和totalPageNo比较，
			 * 不然没有数据。。
			 * 不太清楚为啥，再学学类初始化吧？
			 */
			return getTotalPageNo();
		}
//		System.out.println("pageNo 【in Page】："+pageNo);
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	/**
	 * 计算总页数
	 * 然后获取总页数
	 * 
	 * @return
	 */
	public int getTotalPageNo() {
		return totalRecord % PAGE_SIZE==0 ? (totalRecord/PAGE_SIZE) : (totalRecord/PAGE_SIZE)+1;
	}
	public void setTotalPageNo(int totalPageNo) {
		this.totalPageNo = totalPageNo;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	
	
	@Override
	public String toString() {
		return "Page [pageNo=" + pageNo + ", totalPageNO=" + totalPageNo + ", totalRecord=" + totalRecord + "]";
	}
	
}
