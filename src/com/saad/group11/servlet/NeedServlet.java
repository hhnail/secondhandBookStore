package com.saad.group11.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
import com.saad.group11.bean.Need;
import com.saad.group11.bean.StorePersonal;
import com.saad.group11.service.BookListService;
import com.saad.group11.service.NeedService;
import com.saad.group11.service.impl.BookListServiceImpl;
import com.saad.group11.service.impl.NeedServiceImpl;

/**
 * Servlet implementation class NeedServlet
 */
public class NeedServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	private BookListService bookListService = new BookListServiceImpl();
	private NeedService needService = new NeedServiceImpl();



	protected void getAllNeeds(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//取值
		List<Need> allNeeds = needService.getAllNeeds();
		System.out.println(allNeeds);

		//设置到域中
		request.setAttribute("allNeeds", allNeeds);


		//跳转
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/need/need.jsp");
		requestDispatcher.forward(request, response);


	}


	protected void upNeed(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.取值
		HttpSession session = request.getSession();
		SmartUpload uper = new SmartUpload();
		uper.initialize(this.getServletConfig(), request, response);
		try {
			uper.upload();
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
		Client client = (Client)session.getAttribute("client");
		String ISBN = uper.getRequest().getParameter("ISBN");
		double max_price =Double.parseDouble(uper.getRequest().getParameter("max_price"));
		double min_credit =Double.parseDouble(uper.getRequest().getParameter("min_credit"));
		String des =uper.getRequest().getParameter("des");
		Integer count = Integer.parseInt(uper.getRequest().getParameter("count"));
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
		Date deadline = new Date();
		try {
			deadline = sdf.parse(uper.getRequest().getParameter("deadline"));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}

		//test1
		System.out.println("NeedServlet deadline："+deadline);

		String b_name = uper.getRequest().getParameter("b_name");
		String author = uper.getRequest().getParameter("author");
		String publisher = uper.getRequest().getParameter("publisher");
		String b_date = uper.getRequest().getParameter("b_date");
		BookList bookList;
		System.out.println(b_name);
		//String b_name="text";
		if(!b_name.equals("")) {
			Files fs = uper.getFiles();
			File f = fs.getFile(0);
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
			bookList = bookListService.getBookListByISBN(ISBN);
		}
		Need need = new Need((Double)max_price,deadline,(Double)min_credit,des,(Integer)count);
		need.setClient(client);
		need.setBookList(bookList);

		needService.addNeed(need);

		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}



	/**
	 * 2021.01.14
	 * 
	 */
	protected void getAllUnsetNeeds(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("getAllUnsetNeeds");
		List<Need> allNeeds = needService.getAllUnsetNeeds();
		for(int i=0;i<allNeeds.size();i++) {
			allNeeds.get(i).setBookList(bookListService.getBookListByISBN(allNeeds.get(i).getISBN()));
		}
		System.out.println(allNeeds);
		request.setAttribute("allNeeds", allNeeds);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/need/checkNeed.jsp");
		requestDispatcher.forward(request, response);
	}
	
	
	protected void changeState(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String confirm = request.getParameter("confirm");
		String n_id =request.getParameter("n_id");
		if(confirm.equals("yes")) {
			needService.changeState(n_id,"审核通过");
		}else {
			needService.changeState(n_id,"审核未通过");
		}
		getAllUnsetNeeds(request,response);	
	}
}

