package com.saad.group11.service;

import java.util.List;

import com.saad.group11.bean.ReturnMessage;

public interface ReturnMessageService {

	public List<ReturnMessage> getReturnMessagesByClientId(String cId);

	public void addReturnMessage(ReturnMessage message); 

	public ReturnMessage getRorderlineById(String olid);

	public void updateReturnMessage(ReturnMessage message, String oldr_id);

	public void deleteReturnMessage(String r_id);

	ReturnMessage getById(String r_id);

}
