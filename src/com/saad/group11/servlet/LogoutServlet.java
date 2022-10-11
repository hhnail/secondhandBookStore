package com.saad.group11.servlet;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public LogoutServlet() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getSession() != null) {
			request.getSession().removeAttribute("client");
			String errMessage = "注销成功";
			System.out.println(errMessage);
			request.setAttribute("msg", errMessage);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/user/index.jsp");
		}
		else {
			String errMessage = "注销失败，该账户已经注销过，请刷新网页重新登陆！！";
			request.setAttribute("msg", errMessage);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/user/login.jsp");
			requestDispatcher.forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}