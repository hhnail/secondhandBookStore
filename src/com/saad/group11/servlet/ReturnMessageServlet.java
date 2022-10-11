package com.saad.group11.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saad.group11.bean.OrderLine;
import com.saad.group11.bean.ReturnMessage;
import com.saad.group11.service.OrderService;
import com.saad.group11.service.ReturnMessageService;
import com.saad.group11.service.impl.OrderServiceImpl;
import com.saad.group11.service.impl.ReturnMessageServiceImpl;
import com.saad.group11.z_discard.ReturnMessageEnum;

public class ReturnMessageServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private ReturnMessageService returnMessageService = new ReturnMessageServiceImpl();
	private OrderService orderService = new OrderServiceImpl();
	
	/**
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 */
	protected void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//取值
		String ol_id = request.getParameter("ol_id");
		String reason = request.getParameter("reason");
		String state = request.getParameter("state");

		//根据olId获取orderline
		OrderLine orderLine = orderService.getOrderLineByOlId(ol_id);


		ReturnMessage returnMessage = new ReturnMessage();
		returnMessage.setOrderLine(orderLine);
		//		returnMessage.setR_time(LocalDate.now());
		returnMessage.setR_time(new Date());
		returnMessage.setReason(reason);
		returnMessage.setState("未处理");

		//调用Service方法
		returnMessageService.addReturnMessage(returnMessage);

		//跳转
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/manager/returnMessage.jsp");
		requestDispatcher.forward(request, response);
	}

	/**
	 * 
	 * 
	 * 
	 * 
	 * 
	 */
	protected void getRorderlineById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//取值
		String olid = request.getParameter("ol_id");
		
		//test
		System.out.println("getRorderlineById olid:" + olid);

		//调用Service方法
//		ReturnMessage returnMessage = returnMessageService.getRorderlineById(olid);

		//存放到域中
//		request.setAttribute("returnMessage", returnMessage);

		//跳转
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/order/addreturnmessage.jsp");
		requestDispatcher.forward(request, response);
	}

	/**根据用户id获取退货信息
	 * 
	 * 
	 * 
	 */
	protected void getReturnMessageByClientId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//取值
		String cId = request.getParameter("c_id");
		

		//调用Service方法
//		List<ReturnMessage> returnMessages = returnMessageService.getReturnMessagesByClientId(cId);

		//存放到域中
//		request.setAttribute("returnMessages", returnMessages);

		//跳转
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/manager/returnMessage.jsp");
		requestDispatcher.forward(request, response);
	}


	/**
	 * 
	 * 
	 * 
	 * 
	 * 
	 */
	protected void deleteReturnMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//取值
		String r_id = request.getParameter("r_id");

		//调用
		returnMessageService.deleteReturnMessage(r_id);

		//跳转
		response.sendRedirect(request.getContextPath() + "/RServlet?method=get   ");
	}


	protected void updateReturnMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//取值
		String oldr_id = request.getParameter("oldr_id");
		//获取退货信息
		ReturnMessage old = returnMessageService.getById(oldr_id);
		if(ReturnMessageEnum.Wait.equals(old.getState()) || ReturnMessageEnum.Disagree.equals(old.getState())) {
			String reason = request.getParameter("reason");

			//封装成对象
			ReturnMessage returnmessage = new ReturnMessage ();
			//				returnmessage.setR_time(LocalDate.now());
			returnmessage.setR_time(new Date());
			returnmessage.setReason(reason);
			System.out.println("修改后的退货信息：" + returnmessage);

			returnMessageService.updateReturnMessage(returnmessage, oldr_id);
		}
		//跳转
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/manager/returnMessage.jsp");
		requestDispatcher.forward(request, response);

	}
	
	protected void createReturnMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1
		String ol_id = request.getParameter("ol_id");
		
		System.out.println("ol_id:" + ol_id);
		
		//3.
		request.getRequestDispatcher("pages/order/addreturnmessage.jsp");
		
	}
		
	


}