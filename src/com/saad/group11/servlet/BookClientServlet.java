package com.saad.group11.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saad.group11.bean.BookList;
import com.saad.group11.bean.Client;
import com.saad.group11.bean.Page;
import com.saad.group11.bean.StorePersonal;
import com.saad.group11.service.BookListService;
import com.saad.group11.service.BookService;
import com.saad.group11.service.ClientService;
import com.saad.group11.service.impl.BookListServiceImpl;
import com.saad.group11.service.impl.BookServiceImpl;
import com.saad.group11.service.impl.ClientServiceImpl;

public class BookClientServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private BookService bookService = new BookServiceImpl();
	private BookListService bookListService = new BookListServiceImpl();
	ClientService clientService = new ClientServiceImpl();

	/*
	 * 获取“分页后的”book
	 * 
	 * 
	 */
	protected void getBooksInPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//取值
		String pageNo = request.getParameter("pageNo");
		//调用
		Page<StorePersonal> books = bookService.getBooksInPage(pageNo);
		for (StorePersonal book : books.getList()) {
			System.out.println("book!!:" + book);
		}

		//设置域
		request.setAttribute("books", books);

		//跳转
		String targetUrl = "/pages/client/book_client.jsp";
		//		System.out.println(targetUrl);

		RequestDispatcher requestDispatcher = request.getRequestDispatcher(targetUrl);
		requestDispatcher.forward(request, response);
	}


	/*
	 * 获取“分页后的”、“带价格区间的”book
	 * 
	 * 
	 */
	protected void getBooksByPrice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.取值
		String pageNo = request.getParameter("pageNo");
		String min_price = request.getParameter("min_price");
		String max_price = request.getParameter("max_price");


		//2.调用
		Page<StorePersonal> books = bookService.getBooksInPageByPrice(pageNo, min_price, max_price);
		//		List<BookList> list = bookListService.getAllBookLists();

		//设置域
		//		request.setAttribute("books", list);
		request.setAttribute("books", books);

		//跳转
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/client/book_client.jsp");
		requestDispatcher.forward(request, response);
	}


	protected void getBooksForManager(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.取值

		//2.调用service
		List<StorePersonal> allBooks = bookService.getAllBooks();


		//3.放到域中
		request.setAttribute("books", allBooks);

		//3.转发
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/manager/book_manager.jsp");
		requestDispatcher.forward(request, response);
	}


	/**
	 * 
	 * 
	 */
	protected void getBooksForClientInPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.取值
		HttpSession session = request.getSession();
		String pageNo = request.getParameter("pageNo");
		Client client = (Client)session.getAttribute("client");
		String c_id = client.getC_id();

		//test
		System.out.println("BookClientServlet pageNo:" + pageNo);

		Page<StorePersonal> allBooks = new Page<StorePersonal>();

		if(client!=null) {
			if(!c_id.equals("admin")) {
				//2.调用service
				allBooks = bookService.getBooksForClientInPage(pageNo, client.getC_id());
			}else if(c_id.equals("admin")) {
				allBooks = bookService.getAllBooksInPage(pageNo);
			}

			//3.放到域中
			request.setAttribute("books", allBooks);
		}
		//		System.out.println("getPageNo:"+allBooks.getPageNo());
		//		System.out.println("getTotalRecord:"+allBooks.getTotalRecord());
		//		
		//		for (StorePersonal book : allBooks.getList()) {
		//			System.out.println(book);
		//		}

		//3.转发
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/manager/book_manager.jsp");
		requestDispatcher.forward(request, response);
	}


	/**
	 * 
	 * 
	 * 
	 * 
	 * 
	 */
	protected void deleteBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.取值
		String p_id = request.getParameter("p_id");

		//2.调用service
		//		bookService



		//3.跳转
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/manager/book_manager.jsp");
	}



	protected void detailSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String stype = request.getParameter("stype");
		String main_search =  request.getParameter("main_search");
		System.out.println(stype);
		System.out.println(main_search);
		List<BookList> sList = bookListService.detailSearch(stype, main_search);
		System.out.println(sList);
		request.setAttribute("searchBookList",sList);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/client/searchPage.jsp");
		requestDispatcher.forward(request, response);
	}


	protected void getAllUnsetBooks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<StorePersonal>  storepersonal= bookService.getAllUnsetBooks();
		for(int i=0;i<storepersonal.size();i++) {
			storepersonal.get(i).setClient(clientService.getClientById(storepersonal.get(i).getC_id()));
		}
		for(int i=0;i<storepersonal.size();i++) {
			storepersonal.get(i).setBookList(bookListService.getBookListByISBN(storepersonal.get(i).getISBN()));
		}
		System.out.println(storepersonal);
		request.setAttribute("checkItem", storepersonal);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/manager/checkBook.jsp");
		requestDispatcher.forward(request, response);
	}





	protected void changeBookState(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String confirm = request.getParameter("confirm");
		String p_id =request.getParameter("p_id");
		if(confirm.equals("yes")) {
			bookService.changeBookState(p_id,"待售");
		}else {
			bookService.changeBookState(p_id,"审核未通过");
		}
		getAllUnsetBooks(request,response);	
	}

	protected void getBuyBooks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] book = request.getParameterValues("choiceBook");
		System.out.println(book);
		if(book!=null) {
			List<StorePersonal>  storepersonal= new ArrayList<StorePersonal>();
			for(int i=0;i<book.length;i++) {
				storepersonal.add(bookService.getBookById(book[i]));
			}
			for(int i=0;i<storepersonal.size();i++) {
				storepersonal.get(i).setBookList(bookListService.getBookListByISBN(storepersonal.get(i).getISBN()));
			}
			System.out.println(storepersonal);
			request.setAttribute("buy_goods", storepersonal);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/order/sumBook.jsp");
			requestDispatcher.forward(request, response);
		}

	}


	protected void xiajia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String c_id = request.getParameter("c_id");
		List<StorePersonal> list = bookService.getStorePersonalbyC_id(c_id);
		for(int i=0;i<list.size();i++) {
			list.get(i).setBookList(bookListService.getBookListByISBN(list.get(i).getISBN()));
		}
		request.setAttribute("manager",list);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/manager/manager_personal_book.jsp");
		requestDispatcher.forward(request, response);
	}



	protected void deleteStorePersonal(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String p_id = request.getParameter("p_id");
		System.out.println("??"+p_id);
		HttpSession session = request.getSession();
		Client client = (Client)session.getAttribute("client");
		bookService.deleteStorePersonal(p_id);
		List<StorePersonal> list=bookService.getStorePersonalbyC_id(client.getC_id());
		for(int i=0;i<list.size();i++) {
			list.get(i).setBookList(bookListService.getBookListByISBN(list.get(i).getISBN()));
		}
		request.setAttribute("manager",list);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/manager/manager_personal_book.jsp");
		requestDispatcher.forward(request, response);
	}


	protected void changeState(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String p_id = request.getParameter("p_id");
		String price = request.getParameter("p_price");
		String des = request.getParameter("p_des");
		String degree = request.getParameter("p_degree");
		System.out.println(p_id+price+des+degree+"??");
		HttpSession session = request.getSession();
		Client client = (Client)session.getAttribute("client");
		bookService.chageState(p_id,price,des,degree);
		List<StorePersonal> list=bookService.getStorePersonalbyC_id(client.getC_id());
		for(int i=0;i<list.size();i++) {
			list.get(i).setBookList(bookListService.getBookListByISBN(list.get(i).getISBN()));
		}
		request.setAttribute("manager",list);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/manager/manager_personal_book.jsp");
		requestDispatcher.forward(request, response);

	}	










}

