package com.saad.group11.service;

import java.util.List;

import com.saad.group11.bean.BookList;
import com.saad.group11.bean.Page;

public interface BookListService {
	
	/**
	 * 
	 * 
	 */
	public List<BookList> getAllBookLists();
	
	public void addBookList(BookList bookList);
	
	public void deleteBookListByISBN(String ISBN);
	
	/**
	 * 根据ISBN编号查询书目
	 * 
	 */
	public BookList getBookListByISBN(String ISBN);
	
	/**
	 * 根据ISBN编号更新书目信息
	 * 
	 * 
	 * @param bookList
	 */
	public void updateBookList(BookList bookList,String oldISBN);
	
	
	/**
	 * 分页查询书目信息
	 * 
	 * @param pageNo 
	 * 这里参数变成了页码，
	 * 因为servlet也只用得到pageNo，
	 * 让他简洁一点
	 * 
	 * @return
	 */
	public Page<BookList> getBookListsInPage(String pageNo);
	
	public List<BookList> detailSearch(String stype,String main_search);

	public BookList getBookOwnFinal(BookList list, String ISBN);

	public BookList getBookDetail(BookList list, String ISBN);
}
