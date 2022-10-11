package com.saad.group11.service.impl;

import java.util.List;

import com.saad.group11.bean.ReturnMessage;
import com.saad.group11.dao.ReturnMessageDao;
import com.saad.group11.dao.impl.ReturnMessageDaoImpl;
import com.saad.group11.service.ReturnMessageService;

public class ReturnMessageServiceImpl implements ReturnMessageService {

	ReturnMessageDao returnMessageDao = new ReturnMessageDaoImpl();
	
	@Override
	public ReturnMessage getRorderlineById(String olid) {
		// TODO 自动生成的方法存根
		return returnMessageDao.getRorderlineById(olid);
	}

	@Override
	public void updateReturnMessage(ReturnMessage message, String oldr_id) {
		// TODO 自动生成的方法存根
		returnMessageDao.updateReturnMessage(message, oldr_id);
	}

	@Override
	public void deleteReturnMessage(String r_id) {
		returnMessageDao.deleteReturnMessage(r_id);
			
	}

	@Override
	public List<ReturnMessage> getReturnMessagesByClientId(String cId) {
		// TODO 自动生成的方法存根
		return returnMessageDao.getReturnMessagesByClientId(cId);
	}

	@Override
	public void addReturnMessage(ReturnMessage message) {
		// TODO 自动生成的方法存根
		
	}
	
	@Override
	public ReturnMessage getById(String r_id) {
		return returnMessageDao.getById(r_id);
	}

}
