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
import com.saad.group11.z_discard.Gender;

/**
 * Servlet implementation class RegistServlet
 */
public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public RegistServlet() {
		super();
	}
	/*
	 * 注册
	 * 		1.取值
	 * 		2.校验账号是否存在
	 * 			不存在，调用saveClient(),保存客户信息
	 * 			存在，跳转回注册页面
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		/*
		 * 将请求（request）和响应（response）的编码设置为utf-8，避免中文乱码
		 */
		//注册
		ClientService clientService = new ClientServiceImpl();
		String c_id = request.getParameter("c_id");
		System.out.println("c_id:" + c_id);
		String password = request.getParameter("password");
		System.out.println("password:" + password);
		//			String c_name = request.getParameter("c_name");
		//			System.out.println(c_name);
		//			String gender = request.getParameterValues("gender")[0];
		//			System.out.println(gender);
		String address = request.getParameter("address");
		System.out.println("address：" + address);
		//		String gender = request.getParameter("gender");
		/*
		 * "male".equals(genderStr)?Gender.Male:Gender.Female;
		 * 不只有男女，所以不能三元运算符。只能if...else咯
		 */

		/*
		String genderStr = request.getParameter("gender");
		Enum<Gender> gender = null;//将接收到的String类型转化为Gender枚举类
		if("male".equals(genderStr)) {
			gender = Gender.Male;
		}else if("female".equals(genderStr)) {
			gender = Gender.Female;
		}else {
			gender = Gender.Unknown;
		}
		 */
		boolean yOn = clientService.checkClientId(c_id);//true则已经存在
		//后期js处理，这个可以去掉
		if("".equals(c_id)){
			System.out.println("注册信息有误！");
		}else if(yOn) {
			//注册失败，转发到失败界面

			//设置编码
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");

			//错误信息提示
			String errMessage = "该手机号码已经被注册，请重新输入！";
			System.out.println(errMessage);
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
			System.out.println(rightMessage);
			request.setAttribute("msg", rightMessage);
			clientService.saveClient(new Client(c_id,password,"null","Unknown",address));
			//重定向到登录页面（注册成功后，让他登录）
			response.sendRedirect(request.getContextPath() + "/pages/user/login.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
