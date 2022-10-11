package com.saad.group11.test;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import com.saad.group11.bean.Page;
import com.saad.group11.bean.StorePersonal;
import com.saad.group11.dao.BookDao;
import com.saad.group11.dao.impl.BookDaoImpl;

import com.saad.group11.service.BookService;
import com.saad.group11.service.impl.BookServiceImpl;

class TestBookServiceImpl {
	private BookDao bookDao = new BookDaoImpl();
	private BookService bookService = new BookServiceImpl();
	private Page<StorePersonal> tempPage;
	private Page<StorePersonal> booksInPage;
	
	@Test
	void testGetBooksInPageByPrice() {
		tempPage = new Page<StorePersonal>();
		tempPage.setPageNo(1);
		System.out.println("=== testGetBooksInPageByPrice");
		booksInPage = bookDao.getBooksInPageByPrice(tempPage, 0.0,10.0);
		System.out.println(booksInPage.getPageNo() + "/" + booksInPage.getTotalPageNo());
		System.out.println("总记录数:" + booksInPage.getTotalRecord());
		
		//遍历集合
		for (StorePersonal book : booksInPage.getList()) {
			System.out.println(book.getClient());
			System.out.println(book.getBookList());
		}
		
		System.out.println("=== test over!");
//		bookService.getBooksInPageByPrice(pageNo, min, max);
	}

}
