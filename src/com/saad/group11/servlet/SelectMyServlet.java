package com.saad.group11.servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saad.group11.bean.Client;
import com.saad.group11.service.ClientService;
import com.saad.group11.service.impl.ClientServiceImpl;

public class SelectMyServlet {
	private static final long serialVersionUID = 1L;
	ClientService clientservice = new ClientServiceImpl();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    	String c_id =(String)request.getSession().getAttribute("c_id");
    	Client obj = clientservice.getClientById(c_id);
    	System.out.println(obj);
    	
//		System.out.println("c_id:"+c_id);
//		String password = request.getParameter("password");
//		System.out.println("password:"+password);
//		String c_name = request.getParameter("c_name");
//		System.out.println("c_name:"+c_name);
//		String gender = request.getParameter("gender");
//		System.out.println("gender:"+gender);
//		String address = request.getParameter("address");
//		System.out.println("address:"+address);
//		String credit = request.getParameter("credit");
//		System.out.println("credit:"+credit);
//		Client client = clientservice.selMyClient(new Client());
//		request.setAttribute("client",client);
//		request.getRequestDispatcher("/update_client.jsp").forward(request, response);
		//Client client =clientservice.getClient(client);    	
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }


}