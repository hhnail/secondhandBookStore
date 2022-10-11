package com.saad.group11.service;

import java.util.List;

import com.saad.group11.bean.Page;
import com.saad.group11.bean.StorePersonal;

public interface BookService {
	/**
	 * 查询所有的书
	 * 
	 * 
	 */
	public List<StorePersonal> getAllBooks();
	
	/**
	 * 查询分页后所有的书
	 * 
	 * 
	 */
	public Page<StorePersonal> getAllBooksInPage(String pageNo);
	
	/**
	 * 查询用户个人的分页后的书
	 * 
	 * 
	 */
	public Page<StorePersonal> getAllBooksInPage(String pageNo, String c_id);
	
	
	
	/**
	 * 根据id查询书目
	 * 
	 * @return
	 */
	public StorePersonal getBookById(String bookId);
	

	/**
	 * 根据ISBN号，获取改书在整个系统中的库存
	 * 
	 */
	public int getStock(String ISBN);
	
	/**
	 * 分页查询book信息
	 * 
	 * @param pageNo 
	 * 这里参数变成了页码，
	 * 因为servlet也只用得到pageNo，
	 * 简洁一点
	 * 
	 * @return
	 */
	public Page<StorePersonal> getBooksInPage(String pageNo);
	
	
	
	
	/**
	 * 带价格区间的查询、分页后的book信息
	 * 
	 */
	public Page<StorePersonal> getBooksInPageByPrice(String pageNo, String min, String max);
	
	
	
	
	/**
	 * 
	 * 
	 * 
	 * @param bookList
	 */
	public void addBook(StorePersonal bookList);
	
	
	
	
	
	/**
	 * 
	 * 
	 * 
	 * @param ISBN
	 */
	public void deleteBookByISBN(String ISBN);
	
	
	
	
	
	/**
	 * 根据ISBN编号更新书目信息
	 * 
	 * 
	 * @param bookList
	 */
	public void updateBook(StorePersonal book,String oldISBN);
	
	
	/**
	 * 根@Override
	据ISBN设置书的state
	 * 
	 */
	public void setBookState(StorePersonal book, String state, String ISBN);
	
	
	/**
	 * 
	 * 
	 * 
	 * 
	 * 
	 */
	void addStorePersonal(StorePersonal storePersonal);
	
	
	/**
	 * 
	 * 
	 * 
	 */
	public Page<StorePersonal> getBooksForClientInPage(String pageNo, String c_id);

	List<StorePersonal> getAllUnsetBooks();

	void changeBookState(String p_id, String state);

	List<StorePersonal> getStorePersonalbyC_id(String c_id);

	void deleteStorePersonal(String p_id);

	void chageState(String p_id, String price, String des, String degree);


}
