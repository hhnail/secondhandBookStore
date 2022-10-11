package com.saad.group11.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saad.group11.bean.BookList;
import com.saad.group11.bean.Page;
import com.saad.group11.service.BookListService;
import com.saad.group11.service.impl.BookListServiceImpl;

/**
 * BookListClientServlet
 * @author 77994
 *
 */
public class BookListClientServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	private BookListService bookListService = new BookListServiceImpl();
	
	protected void getBookListsInPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//取值
		String pageNo = request.getParameter("pageNo");
		//调用
		Page<BookList> bookListsInPage = bookListService.getBookListsInPage(pageNo);
		
		//设置域
		request.setAttribute("bookListsInPage", bookListsInPage);
		
		//跳转
		String targetUrl = "/pages/client/book_client.jsp";
//		System.out.println(targetUrl);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(targetUrl);
		requestDispatcher.forward(request, response);
		
	}
}
