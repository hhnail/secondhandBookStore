package com.saad.group11.dao.impl;

import java.util.List;

import com.saad.group11.bean.BookList;
import com.saad.group11.bean.Page;
import com.saad.group11.dao.BaseDao;
import com.saad.group11.dao.BookListDao;

public class BookListDaoImpl extends BaseDao<BookList> implements BookListDao {

	@Override
	public List<BookList> getAllBookLists() {
		String sql = "select * from booklist";
		return this.getBeanList(sql);
	}
	

	@Override
	public Page<BookList> getBookListsInPage(Page<BookList> page) {
		//page:pageNo PAGE_SIZE totalPageNo
		//dao:totalRecord
		String sql = "select count(ISBN) from booklist";//性能比count(*)高，也可以写count(1)
		Object tempTotalRecord = this.getSingeValue(sql);
		/*
		 * +""  好家伙，真巧 
		 * +""  拼接的方式 比 toString的性能高
		 */
		int totalRecord = Integer.parseInt(tempTotalRecord + "");
		
		//从dao中获取后赋值setTotalRecord
		page.setTotalRecord(totalRecord);
//		System.out.println("TotalRecord:" + page.getTotalRecord());
//		System.out.println("TotalPageNO:" + page.getTotalPageNO());
		
		//dao:getBookListInPage
		sql = "select * "
				+ "from booklist "
				+ "where 1=1 "
				+ "LIMIT ?,?";
//		System.out.println(sql);
				
		//从dao中获取对应的page（里面有书目集合）
		List<BookList> list = this.getBeanList(sql, (page.getPageNo()-1)*Page.PAGE_SIZE , Page.PAGE_SIZE);
		
		//将list存放到page中
		page.setList(list);
		
		//目前为止
//		pageNo;			//当前页面 					service传参
//		totalPageNO;	//总页数=总记录数/每页显示的数量		计算得到
//		totalRecord;	//总记录数						从数据库获取
//		PAGE_SIZE = 4;	//每页显示的数量					静态常量 不用传
//		private List<T> list;						从数据库获取
		
		return page;
	}

	
	
//	public void addBookList(BookList bookList) {
//		String sql = "insert into booklist(`ISBN`,`b_name`,`author`,`publisher`,`b_date`) values(?,?,?,?,?)";
//		System.out.println(bookList.getISBN());
//		this.update(sql, bookList.getISBN(),bookList.getB_name(),bookList.getAuthor(),bookList.getPublisher(),bookList.getB_date());
//	}
	@Override
	public void addBookList(BookList bookList) {
		String sql = "insert into booklist(`ISBN`,`b_name`,`author`,`publisher`,`b_date`,`img_path`) values(?,?,?,?,?,?)";
		System.out.println(bookList.getISBN());
		this.update(sql, bookList.getISBN(),bookList.getB_name(),bookList.getAuthor(),bookList.getPublisher(),bookList.getB_date(),bookList.getImg_path());
	}


	@Override
	public void deleteBookListByISBN(String ISBN) {
		String sql = "delete from booklist where `ISBN` = ?";
		this.update(sql, ISBN);
	}

	@Override
	public BookList getBookListByISBN(String ISBN) {
		String sql = "select * from booklist where `ISBN` = ?";
		return this.getBean(sql, ISBN);
	}

	
	@Override
	public void updateBookList(BookList bookList, String oldISBN) {
		String sql = "update booklist set ISBN=?, b_name = ?, author = ?, publisher = ?, b_date = ? where `ISBN` = ?";
		this.update(sql,bookList.getISBN(), bookList.getB_name(), bookList.getAuthor(), bookList.getPublisher(),bookList.getB_date(), oldISBN);
	}
	@Override
	public void updateBookList(int stock, int sale, String ISBN) {
		String sql = "update booklist set stock = ?, sale = ? where `ISBN` = ?";
		this.update(sql,stock, sale, ISBN);
	}
	
	@Override
	public  List<BookList>  detailSearch(String stype,String main_search){
		String sql="select * from booklist where "+stype+" like '%"+main_search+"%' and ISBN in (select ISBN from storepersonal where state='待售')";
		System.out.println("???"+sql);
		return this.getBeanList(sql);
	}


	
}
