package com.saad.group11.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saad.group11.bean.Client;
import com.saad.group11.service.ClientService;
import com.saad.group11.service.impl.ClientServiceImpl;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginServlet() {
        super();
    }

	/**
	 * 表示层
	 * 登录
	 * 		1.取得账号和密码
	 * 		2.调用dao登录接口
	 * 		3.判断，跳转（成功或失败）
	 *
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		ClientDao clientDao = new ClientDaoImpl();
		/*
		 * 该步为表示层直接调用数据访问层
		 * 三层架构应该是“表示层--业务逻辑层（service）--数据访问层（dao）
		 */
		ClientService clientservice = new ClientServiceImpl();
		String c_id = request.getParameter("c_id");
		System.out.println("c_id:"+c_id);
		String password = request.getParameter("password");
		System.out.println("password:"+password);
		Client client = clientservice.getClient(new Client(c_id, password));
		System.out.println("client:"+client);
		if(client == null) {
			//登录失败，转发到失败界面
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			
			//错误信息提示
			String errMessage = "账号密码输入有误，请重新输入！";
			System.out.println(errMessage);
			request.setAttribute("msg", errMessage);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/user/login.jsp");
			requestDispatcher.forward(request, response);
		}else {
			//登录成功，重定向到成功界面
			//request.getContextPath() 获取??路径
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
