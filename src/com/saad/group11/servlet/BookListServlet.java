package com.saad.group11.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.saad.group11.bean.BookList;
import com.saad.group11.bean.Client;
import com.saad.group11.bean.Page;
import com.saad.group11.bean.StorePersonal;
import com.saad.group11.service.BookListService;
import com.saad.group11.service.BookService;
import com.saad.group11.service.impl.BookListServiceImpl;
import com.saad.group11.service.impl.BookServiceImpl;

public class BookListServlet extends BaseServlet implements Servlet {
	private static final long serialVersionUID = 1L;


	private BookListService bookListService = new BookListServiceImpl();
	private BookService bookService = new BookServiceImpl();
	
	/**
	 * 查询所有书目的信息
	 * 
	 * 
	 * 
	 * 
	 */
	protected void getAllBookLists(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//取值
		//调用service中的响应方法
		List<BookList> allBookLists = bookListService.getAllBookLists();

/*
 * 测试
		for (BookList bookList : allBookLists) {
			System.out.println(bookList);
			break;
		}
*/

		//将allBookLists存放到域中
		System.out.println("here01");
		request.setAttribute("allBookLists", allBookLists);

		//跳转，book_manager.jsp
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/manager/book_manager.jsp");
		requestDispatcher.forward(request, response);
		System.out.println("here01");

	}
	
	
	
	/**
	 * 分页查询书目信息
	 * 
	 * 
	 * 
	 * 
	 * 
	 */
	protected void getBookListsInPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//取值
		String pageNo = request.getParameter("pageNo");
		
		//调用service
		Page<BookList> bookListsInPage = bookListService.getBookListsInPage(pageNo);
		
		//放到域中
		request.setAttribute("bookListsInPage", bookListsInPage);
		
		//跳转
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/manager/bookList_manager.jsp");
		requestDispatcher.forward(request, response);
	}


	
	
	/**
	 * 删除书目
	 * 
	 * 
	 * 
	 * 
	 * 
	 */
	protected void deleteBookListByISBN(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//取值
		String ISBN = request.getParameter("ISBN");

		System.out.println(ISBN);
		//调用
		bookListService.deleteBookListByISBN(ISBN);

		//跳转
		response.sendRedirect(request.getContextPath() + "/BookListServlet?method=getBookListsInPage");
	}



	/**
	 * 
	 * 根据ISBN编号获取书目
	 * 这一步是和update结合使用的
	 * 
	 * 
	 * 
	 * 
	 * 
	 */
	protected void getBookListByISBN(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//取值
		String ISBN = request.getParameter("ISBN");

		//调用Service方法
		BookList bookList = bookListService.getBookListByISBN(ISBN);

		/*
		 * 据说，如果报错的话
		 * 要在这里打印信息，来找错
		 * 
		 */

		//将bookList存放到域中
		request.setAttribute("bookList", bookList);

		//跳转
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/manager/bookList_update.jsp");
		requestDispatcher.forward(request, response);
	}

	
	/**
	 * 添加书目
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 */
	protected void addBookList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//取值
		String ISBN = request.getParameter("ISBN");
		String b_name = request.getParameter("b_name");
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		String b_date = request.getParameter("b_date");

		//调用service中的响应方法
		BookList bookList = new BookList(ISBN,b_name,author,publisher,b_date);
		bookListService.addBookList(bookList);

		
		response.sendRedirect(request.getContextPath() + "/BookListServlet?method=getAllBookLists");
		System.out.println("addBookList done!");
		//跳转，book_manager.jsp
				/*
				 * 他只是跳转了，没有数据没有更新，所以在这之前需要重新查询一次
				 * 调用上面的方法就可以了，不用复制代码
				 * getAllBookLists(request, response);
				 * 
				 * 但是不能直接跳转/pages/manager/book_manager.jsp，
				 * 因为我们使用的request域
				 * 要跳转后再查询getAllBookLists(request, response);
				 * 这个时候request已经失效了【hw：应该是这样吧...】
				 * 
				 * 下面是第二种写法
				 * 就是相当于又点击了“图书管理”按钮，即又查询了一次图书信息
				 * 注意是要传getAllBookLists给他
				 * 
				 * 而且要加/，
				 * request.getContextPath()
				 * http://localhost:8080/design_SecondhandBookStore
				 */ 
	}
	
	/**
	 * 整合前：更新书目信息
	 * 整合后：更新书目信息 + 新增书目信息
	 * 
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void updateBookList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//取值
		String oldISBN = request.getParameter("oldISBN");
		
		String ISBN = request.getParameter("ISBN");
		String b_name = request.getParameter("b_name");
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		String b_date = request.getParameter("b_date");
		
		//封装成对象
		BookList bookList = new BookList(ISBN, b_name, author, publisher, b_date);
		System.out.println("修改后的书目信息：" + bookList);
		
		
		/*
		 * 判断ISBN是否为空，执行相应的方法
		 * 
		 * 为空执行add
		 * 非空执行update
		 * 
		 * 调用service
		 */
		if(oldISBN == null || "".equals(oldISBN)) {
			//调用addBookList
			System.out.println("test addBookList!");
			bookListService.addBookList(bookList);
		}else {
			//调用updateBookList
			System.out.println("test updateBookList!");
			bookListService.updateBookList(bookList,oldISBN);
		}

		/*
		BookList bookList = bookListService.getBookListByISBN(ISBN);
		System.out.println(bookList.getISBN() + "--" + bookList.getB_name());

		 * 
		 * 这么写就是在套娃，是错的
		 * 因为这样就相当于，没有接受更新的信息，而是用ISBN获取了数据库里的书目，然后又把他传回去了
		 * 
		 * 应该在这里获取修改后的信息，包装成BookList传给update
		 * 
		 */

		//跳转。 这里update了书目，所以也需要再调用一次 “书目查询” ；
		response.sendRedirect(request.getContextPath() + "/BookListServlet?method=getBookListsInPage");
	}
	
	
	protected void ajaxPutawayISBN(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ISBN = request.getParameter("isbn");
		System.out.println(ISBN);
		BookList booklist=bookListService.getBookListByISBN(ISBN);
		PrintWriter out=response.getWriter();
		if(booklist==null) {
			out.print(false);
		}else {
			out.print(booklist.getImg_path());
		}
	}
	
	
	/**
	 * 
	 * 
	 */
	protected void putaway(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		HttpSession session = request.getSession();
		SmartUpload uper = new SmartUpload();
		uper.initialize(this.getServletConfig(), request, response);
		try {
			uper.upload();
		} catch (SmartUploadException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		Client client = (Client)session.getAttribute("client");
		String ISBN = uper.getRequest().getParameter("ISBN");
		double price =Double.parseDouble(uper.getRequest().getParameter("price"));
		double degree =Double.parseDouble(uper.getRequest().getParameter("degree"));
		String des =uper.getRequest().getParameter("des");
		String b_name = uper.getRequest().getParameter("b_name");
		String author = uper.getRequest().getParameter("author");
		String publisher = uper.getRequest().getParameter("publisher");
		String b_date = uper.getRequest().getParameter("b_date");
		BookList bookList;
		System.out.println(b_name);
		//String b_name="text";
		if(!b_name.equals("")) {
			
			Files fs = uper.getFiles();
			File f=fs.getFile(0);
			System.out.println(f.getFileName());
			String imgPath ="static/img/"+f.getFileName();
			try {
				int amount=uper.save("static/img");
				System.out.println(amount);
			} catch (SmartUploadException e) {
				// TODO 自动生成的 catch 块
				System.out.println("error");
				e.printStackTrace();
			}
			bookList = new BookList(ISBN,b_name,author,publisher,b_date,imgPath);
			bookListService.addBookList(bookList);
		}else {
			bookList=bookListService.getBookListByISBN(ISBN);
		}
		StorePersonal storePersonal=new StorePersonal(" ",price,degree,des);
		storePersonal.setBookList(bookList);
		storePersonal.setClient(client);
		
		bookService.addStorePersonal(storePersonal);
		response.sendRedirect(request.getContextPath() + "/BookClientServlet?method=xiajia&c_id="+client.getC_id());
	}
	
	
	protected void showDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String ISBN = request.getParameter("ISBN");
		System.out.println(ISBN);
		BookList List=bookListService.getBookListByISBN(ISBN);
//		BookList List_Own=bookListService.getBookOwn(List,ISBN);
		BookList List_detail=bookListService.getBookDetail(List,ISBN);
		BookList List_Own=bookListService.getBookOwnFinal(List,ISBN);
	    System.out.println(List);
	    System.out.println(List.getClients());
	    System.out.println("yyy"+List.getBooks());
	    System.out.println("www"+List.getBooks().get(0).getClient());
	    request.setAttribute("detailBookList",List);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/user/detailPage.jsp");
		requestDispatcher.forward(request, response);
//		request.setAttribute("searchBookList",sList);
//		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/user/searchPage.jsp");
//		requestDispatcher.forward(request, response);
	}
	
	
	/**
	 * 2021.01.14 整合
	 * 
	 * 
	 */
	protected void mDeleteBookListByISBN(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] ISBNList = request.getParameterValues("m_delete");
		System.out.println("?"+ISBNList);
		for(int i=0;i<ISBNList.length;i++) {
			String ISBN=ISBNList[i];
			System.out.println(""+ISBN);
			bookListService.deleteBookListByISBN(ISBN);
		}
		response.sendRedirect(request.getContextPath() + "/BookListServlet?method=getBookListsInPage");
	}
	
}
