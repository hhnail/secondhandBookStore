package com.saad.group11.dao;

import java.util.List;

import com.saad.group11.bean.BookList;
import com.saad.group11.bean.Page;

public interface BookListDao {
	
	/**
	 * 查询所有的图书
	 * sql:select * from booklist
	 */
	public List<BookList> getAllBookLists();
	
	
	/**
	 * 获取分页的书目信息
	 * 
	 * @param page
	 * @return
	 */
	public Page<BookList> getBookListsInPage(Page<BookList> page);
	
	
	
	/**
	 * 根据价格 获取分页的书目信息
	 * sql:select * from booklist where 1=1 and price 
	 * 
	 * @param page
	 * @param max
	 * @param min
	 * @return
	 */

	
	
	/**
	 * 添加BookList书目信息
	 * × sql:insert into booklist('ISBN','b_name','author','publisher','b_date') values(ISBN,b_name,author,publisher,b_date,img_path);
	 * sql:insert into booklist(`ISBN`,`b_name`,`author`,`publisher`,`b_date`) values('978-1-1','test','test','test','2020-12-08')

	 * sql:insert into booklist(`ISBN`,`b_name`,`author`,`publisher`,`b_date`) values(?,?,?,?,?,?);
	 * sql：insert into booklist('ISBN','b_name','author','publisher','b_date') values('978-1-1','test','test','test','2020-12-08','static/img/default.jpg')
	 */
	public void addBookList(BookList bookList);
	
	
	
	/**
	 * 根据ISBN删除书目信息
	 * @param ISBN
	 * 
	 * sql:delete from booklist where `ISBN` = ?;
	 */
	public void deleteBookListByISBN(String ISBN);
	
	
	
	/**
	 * 根据ISBN编号查询书籍
	 * 
	 * @return
	 */
	public BookList getBookListByISBN(String ISBN);
	
	
	/**
	 * 1.1
	 * 根据ISBN编号更新书目信息
	 * 
	 * 			1.先通过ISBN获取书目
	 * 			2.更新对应书目信息
	 * 
	 * sql:update booklist set ISBN=?,b_name=?,author=?,publisher=?,b_date=? where `ISBN` = ?;
	 * 
	 * 
	 * 1.2
	 * 根据ISBN修改库存和销量
	 * 
	 */
	public void updateBookList(BookList bookList, String oldISBN);
	public void updateBookList(int stock, int sale, String oldISBN);
	
	
	public  List<BookList>  detailSearch(String stype,String main_search);
	
	
	
	
}
