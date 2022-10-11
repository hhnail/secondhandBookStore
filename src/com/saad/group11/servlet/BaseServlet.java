package com.saad.group11.servlet;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//jsp通过get方式提交，则执行这个方法
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*将请求（request）和响应（response）的编码设置为utf-8，避免中文乱码
		 * emmmm..不知道为啥，还是会出现中文乱码
		 * 【hw】 要把这玩意弄到最前面，不然还是会乱码。原因：...？
		 * 
		 * 
		 * 2021.01.09 可以去掉这两行设置字符集的代码了
		 * 用Fliter统一处理
		 * eg：  中餐馆     外国顾客      译员
		 *     servlet             filter
		 */
		String method =  request.getParameter("method");
		System.out.println("BaseServlet method:" + method);
		try {
			Method realMethod = this.getClass().getDeclaredMethod(method, HttpServletRequest.class,HttpServletResponse.class);
			realMethod.invoke(this, request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
