package com.saad.group11.service.impl;

import java.util.List;

import com.saad.group11.bean.BookList;
import com.saad.group11.bean.Client;
import com.saad.group11.bean.Page;
import com.saad.group11.bean.StorePersonal;
import com.saad.group11.dao.BookDao;
import com.saad.group11.dao.BookListDao;
import com.saad.group11.dao.ClientDao;
import com.saad.group11.dao.impl.BookDaoImpl;
import com.saad.group11.dao.impl.BookListDaoImpl;
import com.saad.group11.dao.impl.ClientDaoImpl;
import com.saad.group11.service.BookListService;

public class BookListServiceImpl implements BookListService {
	BookListDao bookListDao = new BookListDaoImpl();
	BookDao bookDao = new BookDaoImpl();
	ClientDao clientDao =  new ClientDaoImpl();

	/**
	 * 查询所有书目信息
	 */
	@Override
	public List<BookList> getAllBookLists() {
		List<BookList> allBookLists = bookListDao.getAllBookLists();
		return allBookLists;
	}
	
	@Override
	public Page<BookList> getBookListsInPage(String pageNo) {
		Page<BookList> page = new Page<BookList>();
		int defaultPageNo = 1;
		try {
			defaultPageNo = Integer.parseInt(pageNo);
		} catch (NumberFormatException e) {
			/*第一次到这个页面，他是没有传pageNo的，那null传进来就会报错了
			 * 
			 * 一旦报错了，那defaultPageNo就还是1，就实现默认第一页的功能啦
			 * 
			 * 这里用if...else...做逻辑判断也可以
			 */
//			e.printStackTrace();
		}
		page.setPageNo(defaultPageNo);//目前为止，page只有一个“当前页面”属性
		return bookListDao.getBookListsInPage(page);
	}

	
	/**
	 * 添加书目
	 */
	@Override
	public void addBookList(BookList bookList) {
		bookListDao.addBookList(bookList);		
	}

	
	/**
	 * 根据ISBN编号删除书目信息
	 */
	@Override
	public void deleteBookListByISBN(String ISBN) {
		bookListDao.deleteBookListByISBN(ISBN);		
		
	}


	@Override
	public BookList getBookListByISBN(String ISBN) {
		return bookListDao.getBookListByISBN(ISBN);	
	}


	@Override
	public void updateBookList(BookList bookList, String oldISBN) {
		bookListDao.updateBookList(bookList, oldISBN);
	}
	
	@Override
	public List<BookList> detailSearch(String stype,String main_search) {
		return bookListDao.detailSearch(stype, main_search);
		
	}
	
	
	@Override
	public BookList  getBookDetail(BookList list,String ISBN) {
//		   List<StorePersonal> personal=list.getBooks();
//		   for(int i=0;i<personal.size();i++) {
//			   clientDao.getBookDetail(personal.get(i));
//		   }
		   
		   list.setBooks(bookDao.getBookDetail(ISBN));
		   return list;
	}
	
	
	@Override
	public BookList  getBookOwnFinal(BookList list,String ISBN) {
		 List<StorePersonal> personal=list.getBooks();
		   for(int i=0;i<personal.size();i++) {
			   Client client=clientDao.getBookOwnFinal(personal.get(i));
			   personal.get(i).setClient(client);
		   }
		return list;
	}
		

}
