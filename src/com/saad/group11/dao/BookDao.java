package com.saad.group11.dao;

import java.util.List;

import com.saad.group11.bean.Page;
import com.saad.group11.bean.StorePersonal;

public interface BookDao {
	
	/**
	 * 查询所有的图书
	 * sql:select * from booklist
	 */
	public List<StorePersonal> getAllBooks();
	
	
	/**
	 * 根据id编号查询书籍
	 * 
	 * @return
	 */
	public StorePersonal getBookById(String bookId);
	
	/**
	 * 根据ISBN号，获取改书在整个系统中的库存
	 * sql: select count(1) from storepersonal where b_id=?
	 * @return 
	 * 
	 */
	public int getStock(String ISBN);
	
	
	

	/**
	 * 获取分页的书目信息
	 * 
	 */
	public Page<StorePersonal> getBooksInPage(Page<StorePersonal> page);
	
	
	/**
	 * 带价格区间的分页查询
	 * 根据价格 获取分页的书目信息
	 * sql:
	 * select * 
	 * from booklist,storepersonal 
	 * where booklist.ISBN = storepersonal.ISBN 
	 * and 
	 * price between ? and ?
	 * limit ?,?
	 * 
	 */
	public Page<StorePersonal> getBooksInPageByPrice(Page<StorePersonal> page, double max_price,double min_price);
	
	
	
	/**
	 * 添加BookList书目信息
	 * × sql:insert into booklist('ISBN','b_name','author','publisher','b_date') values(ISBN,b_name,author,publisher,b_date,img_path);
	 * sql:insert into booklist(`ISBN`,`b_name`,`author`,`publisher`,`b_date`) values('978-1-1','test','test','test','2020-12-08')

	 * sql:insert into booklist(`ISBN`,`b_name`,`author`,`publisher`,`b_date`) values(?,?,?,?,?,?);
	 * sql：insert into booklist('ISBN','b_name','author','publisher','b_date') values('978-1-1','test','test','test','2020-12-08','static/img/default.jpg')
	 */
	public void addBook(StorePersonal book);
	
	
	
	/**
	 * 根据ISBN删除书目信息
	 * @param ISBN
	 * 
	 * sql:delete from booklist where `ISBN` = ?;
	 */
	public void deleteBookByISBN(String ISBN);
	
	
	
	
	
	/**
	 * 根据ISBN编号更新书目信息
	 * 
	 * 			1.先通过ISBN获取书
	 * 			2.更新对应书的状态
	 * 
	 * sql:update storepersonal set state=? where `ISBN` = ?;
	 * 
	 */
	public void setBookState(StorePersonal book, String state, String ISBN);
	
	
	/**
	 * 
	 * 
	 * 
	 * 
	 */
	void addstorePersonalDao(StorePersonal storePersonal);
	
	

	
	/**
	 * 根据c_id获取客户个人的书
	 * 
	 */
	public Page<StorePersonal> getBooksForClientInPage(Page<StorePersonal> page, String c_id);


	public List<StorePersonal> getBookDetail(String ISBN);


	List<StorePersonal> getAllUnsetBooks();


	void changeBookState(String p_id, String state);


	List<StorePersonal> getStorePersonalbyC_id(String c_id);


	void deleteStorePersonal(String p_id);


	void chageState(String p_id, String price, String des, String degree);
	
	
	
}
