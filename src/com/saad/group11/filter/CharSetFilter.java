package com.saad.group11.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CharSetFilter extends HttpFilter {

	@Override
	public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//从xml文件中获取CharSetFilter的<param-name>code的value
		String code = this.getFilterConfig().getInitParameter("code");
		
		request.setCharacterEncoding(code);
		response.setContentType("text/html;charset=UTF-8");
		
//		HttpSession session = request.getSession();
//		Client client = (Client)session.getAttribute("cilent");
//		System.out.println("client:"+client);
//		
//		if(client == null) {
//			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/user/login.jsp");
//			requestDispatcher.forward(request, response);
//		}
		
		//放行
		chain.doFilter(request, response);
		
	}


}
