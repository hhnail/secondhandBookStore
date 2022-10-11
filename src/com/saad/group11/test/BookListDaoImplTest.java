package com.saad.group11.test;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;

import com.saad.group11.bean.BookList;
import com.saad.group11.bean.Page;
import com.saad.group11.dao.BookListDao;
import com.saad.group11.dao.impl.BookListDaoImpl;


class BookListDaoImplTest {
	BookListDao bookListDao = new BookListDaoImpl();
	private Page<BookList> bookListsInPage;
	@Test
	void testGetAllBookLists() {
		System.out.println("testGetAllBookLists");
		List<BookList> allBookLists = bookListDao.getAllBookLists();
		for (BookList bookList : allBookLists) {
			System.out.println(bookList);
			
		}
		System.out.println("testGetAllBookLists");
	}
	
	
	/*
	 * 憨批！！ 改了半天，这里你传个锤子BookList？？？？！！！
	 */
	@Test
	void testAddBookList() {
//		void testAddBookList(BookList bookList) {
		System.out.println("testAddBookList");
		bookListDao.addBookList(new BookList("test","test","test","test","2020-12-09"));
		System.out.println("testAddBookList");
	}
	
	
	@Test
	void testGetBookListsInPage() {
		Page<BookList> tempPage = new Page<BookList>();
		//测试，先默认在第一页。 			以后可以通过前端传过来
		tempPage.setPageNo(1);
		Page<BookList> page2 = bookListDao.getBookListsInPage(tempPage);
		System.out.println(page2.getPageNo() + "/" + page2.getTotalPageNo());
		System.out.println("总记录数" + page2.getTotalRecord());
		
		//遍历集合
		for (BookList bookList : page2.getList()) {
			System.out.println(bookList);
		}
		
	}
	
}
