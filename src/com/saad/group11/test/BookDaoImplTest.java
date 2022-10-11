package com.saad.group11.test;

import org.junit.jupiter.api.Test;

import com.saad.group11.bean.Page;
import com.saad.group11.bean.StorePersonal;
import com.saad.group11.dao.BookDao;
import com.saad.group11.dao.impl.BookDaoImpl;

class BookDaoImplTest {

	BookDao bookDao = new BookDaoImpl();
	
	private Page<StorePersonal> tempPage;
	private Page<StorePersonal> booksInPage;
	@Test
	void testGetBooksInPage() {
		tempPage = new Page<StorePersonal>();
		tempPage.setPageNo(1);
		System.out.println("testGetBooksInPage");
		Page<StorePersonal> page2 = bookDao.getBooksInPage(tempPage);
		System.out.println(page2.getPageNo() + "/" + page2.getTotalPageNo());
		System.out.println("总记录数:" + page2.getTotalRecord());
		
		//遍历集合
		for (StorePersonal book : page2.getList()) {
			System.out.println(book.getClient());
			System.out.println(book.getBookList());
		}
		System.out.println("testGetBooksInPage");
	}
	
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
	}
	
	
	@Test
	void testGetBookById() {
		String bookId = "1";
		StorePersonal book = bookDao.getBookById(bookId);
		System.out.println(book);
	}

	@Test
	void testGetStock() {
		String isbn = "978-1-1";
		int stock = bookDao.getStock(isbn);
		System.out.println(stock);
	}
	
	
	@Test
	void testGetBooksForClientInPage(){
		tempPage = new Page<StorePersonal>();
		tempPage.setPageNo(1);
		Page<StorePersonal> page2 = bookDao.getBooksForClientInPage(tempPage, "001");
		System.out.println(page2.getList().get(0));
		
		//遍历集合
		System.out.println("testGetBooksInPage");
	}
	
}
