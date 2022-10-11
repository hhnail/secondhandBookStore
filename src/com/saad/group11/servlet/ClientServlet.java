package com.saad.group11.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saad.group11.bean.Client;
import com.saad.group11.service.ClientService;
import com.saad.group11.service.impl.ClientServiceImpl;

/*
 * 继承BaseServlet，那么每个Servlet实现自己的业务逻辑
 * 然后继承BaseServlet的doGet()doPost()，
 * 传给这个servlet，jsp通过get/post提交，对应servlet执行doGet()和doPost()方法
 */
public class ClientServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	ClientService clientService = new ClientServiceImpl();

	/**
	 * 登录
	 * 
	 * 
	 * 
	 */
	protected void logined(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String c_id = request.getParameter("c_id");
		String password = request.getParameter("password");
		Client client = clientService.getClient(new Client(c_id, password));

		System.out.println("c_id:"+c_id);
		System.out.println("password:" + password);
		System.out.println("client:"+client);
		if(client == null) {
			//登录失败，转发到失败界面，并错误信息提示
			String errMessage = "账号密码输入有误，请重新输入！";
			System.out.println(errMessage);
			request.setAttribute("msg", errMessage);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/user/login.jsp");
			requestDispatcher.forward(request, response);
		}else {
			//登录成功，重定向到成功界面
			//request.getContextPath() 获取??路径
			//			request.setAttribute("client", client);
			/*
			 * request可能会有bug，client是用来后面获取用户名之类的
			 * 好多页面都有用到，不能保证都是一个request（当前请求中有效）
			 */
			session.setAttribute("client", client);
			Object clientInSession = session.getAttribute("client");
			System.out.println("clientInSession:" + clientInSession);
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}
	}


	/**
	 * 注册
	 * 
	 * 
	 * 
	 */
	protected void registed(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String c_id = request.getParameter("c_id");//获取账号
		String password = request.getParameter("password");//获取密码
		String address = request.getParameter("address");//获取地址
		//		String gender = request.getParameter("gender");
		//		System.out.println("c_id:" + c_id);
		//		System.out.println("password:" + password);
		//		System.out.println("address：" + address);

		//创建获取session对象
		HttpSession session = request.getSession();

		//获取验证码
		String code = request.getParameter("code");

		//获取session域中的验证码
		Object codeInSession = session.getAttribute("KAPTCHA_SESSION_KEY");

		//判断验证码是否正确
		if(codeInSession!=null && codeInSession.toString().equals(code)) {
			//验证码正确
			boolean yOn = clientService.checkClientId(c_id);//true则已经存在
			if("".equals(c_id)){//这个可以后期用JavaScript处理
				//				System.out.println("注册信息有误！");
				//注册失败，转发到失败界面,错误信息提示
				String errMessage = "账号密码不得为空！";
				request.setAttribute("msg", errMessage);
				request.setAttribute("c_id", c_id);//注册失败，将原先的部分信息补全
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/user/regist.jsp");
				requestDispatcher.forward(request, response);
			}else if(yOn) {
				//注册失败，转发到失败界面
				//错误信息提示
				String errMessage = "该手机号码已经被注册，请重新输入！";
				//				System.out.println(errMessage);
				request.setAttribute("msg", errMessage);

				//注册失败，将原先的部分信息补全
				request.setAttribute("c_id", c_id);
				//				request.setAttribute("address", address);
				/*
				 * 其实可以不用设置，因为forward(request, response)中有request对象
				 */

				RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/user/regist.jsp");
				requestDispatcher.forward(request, response);
			}else if(!yOn) {
				//用户不存在（可注册）,保存客户信息
				String rightMessage = "注册成功，请登录！";
				//				System.out.println(rightMessage);
				request.setAttribute("msg", rightMessage);
				clientService.saveClient(new Client(c_id,password,"null","Unknown",address));
				//重定向到登录页面（注册成功后，让他登录）
				response.sendRedirect(request.getContextPath() + "/pages/user/login.jsp");
			}
		}else {
			//验证码错误
			String errMessage = "验证码输入错误！";
			//			System.out.println(rightMessage);
			request.setAttribute("msg", errMessage);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/user/regist.jsp");
			requestDispatcher.forward(request, response);
		}
	}



	/**
	 * 注销
	 * 
	 * 
	 */
	protected void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("===========================test logout 【in ClientServlet】");
		/*
		 * 基于session有两种解决办法
		 * 1.移除client的信息 2.使session失效
		 * 用1比较好，因为session中可能还有其他信息，项目需要使用
		 */

		//将client从session域中移除
		HttpSession session = request.getSession();
		session.removeAttribute("client");
		/*
		 * 如果注销不了，可能是打错了
		 * remove的对象名称必须和上面login的设置的名称相同
		 */

		//跳转到首页--重定向
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		/*
		 * 需要携带request对象的使用转发
		 * 
		 * 不需要的时候用重定向
		 */
	}




	protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//		HttpSession session = request.getSession();
		//		ClientDao clientDao = new ClientDaoImpl();
		/*
		 * 该步为表示层直接调用数据访问层
		 * 三层架构应该是“表示层--业务逻辑层（service）--数据访问层（dao）
		 */
		String c_id = request.getParameter("c_id");
		//		System.out.println("c_id:"+c_id);
		String password = request.getParameter("password");
		//		System.out.println("password:" + password);
		Client client = clientService.getClient(new Client(c_id, password));
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		System.out.println(client);
		if(client == null) {
			//登录失败，转发到失败界面
			//错误信息提示
			String errMessage = "账号密码输入有误，请重新输入！";
			System.out.println(errMessage);
			//			request.setAttribute("msg", errMessage);
			out.print("false");
			//RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/user/login.jsp");
			//requestDispatcher.forward(request, response);
		}else {
			HttpSession session = request.getSession();
			//			request.setAttribute("client", client);
			session.setAttribute("client", client);
			//			System.out.println(sessionScope.client.c_id);

			System.out.println("ClientServlet client:"+client);
			response.sendRedirect(request.getContextPath() + "/index.jsp");


		}
	}


	protected void regist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String c_id = request.getParameter("c_id");
		System.out.println("c_id:" + c_id);
		String password = request.getParameter("password");
		System.out.println("password:" + password);
		String c_name = request.getParameter("c_name");
		System.out.println("c_name"+c_name);
		String address = request.getParameter("address");
		System.out.println("address：" + address);
		String gender = request.getParameter("gender");
		System.out.println("gender"+gender);
		String ins = request.getParameter("insert");
		System.out.println("ins"+ins);
		boolean yOn = clientService.checkClientId(c_id);//true则已经存在
		System.out.println(yOn);
		if(yOn) {
			//注册失败，转发到失败界面
			//错误信息提示
			PrintWriter out=response.getWriter();
			out.print(false);
		}else{
			if(ins!=null) {
				clientService.saveClient(new Client(c_id,password,c_name,gender,address));
			}else{
				response.sendRedirect(request.getContextPath() + "/pages/user/login.jsp");
			}

		}
	}


	/**
	 * 单纯是一个校验
	 * 
	 * 如果
	 * 
	 * 
	 * 
	 * 
	 */
	protected void check(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Client client = (Client)session.getAttribute("client");
		String type = request.getParameter("type");


		//test
		System.out.println("putAway client:"+client);
		System.out.println("type："+type);

		String url = "";
		if(client==null) {
			request.getRequestDispatcher("/pages/user/login.jsp").forward(request, response);
		}else {
			if("put_away".equals(type)) {
				url="/pages/user/putaway.jsp";
				
			}else if("need_upload".equals(type)) {
				url="/pages/need/need_upload.jsp";
				
			}else if("need_manager".equals(type)) {
				url="/pages/need/need_manager.jsp";
				
			}else if("manager".equals(type)){
				String c_id = client.getC_id();
				url="BookClientServlet?method=xiajia&c_id="+c_id;
//				url="/pages/manager/manager_personal_book.jsp";
			}else if("personalMsg".equals(type)) {
				url="/pages/client/update_client.jsp";
				
			}else if("getClientOrders".equals(type)) {
				url="/OrderServlet?method=getClientOrders";
			}
			else {
				url="/index.jsp";
			}
		}
//		response.sendRedirect(request.getContextPath() + url);
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	protected void selectClient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Client obj =(Client)request.getSession().getAttribute("client");
		System.out.println("seleClient lll");
		System.out.println(obj);
	}
	
	
	/**
	 * 更新用户个人信息
	 * 
	 * 
	 * 
	 */
	protected void updateMyClient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.取值
		HttpSession session = request.getSession();//判断有没有登陆
		Client client = (Client)session.getAttribute("client");
		String c_name = request.getParameter("c_name");
		String address = request.getParameter("address");
		String gender = request.getParameter("gender");
		String password = request.getParameter("password");
		
		//test1
//		System.out.println("c_name:"+c_name);
//		System.out.println("gender:"+gender);
//		System.out.println("address:"+address);
		
		//2.调用
//		public Client(String c_id, String password, String c_name, String gender, String address) {

		Client newClient = clientService.updateMyClient(new Client(client.getC_id(),password,c_name,gender,address));
		
		//test2
//		System.out.println("updateMyClient client:" + newClient);
		
		//3.放到域中
		session.setAttribute("client", newClient);//登陆了之后在session中增加client变量，如果有值则页面能判断用户已经登陆，如果没有值，则会返回登录界面
		
		//4.跳转
		response.sendRedirect(request.getContextPath() + "/pages/client/update_client.jsp");
		
	}

}
