package com.saad.group11.dao;

import java.util.List;

import com.saad.group11.bean.ReturnMessage;

public interface ReturnMessageDao {

	public List<ReturnMessage> getReturnMessagesByClientId(String clientId);

	public void addReturnMessage(ReturnMessage message); 

	public ReturnMessage getRorderlineById(String olid);

	public void updateReturnMessage(ReturnMessage message, String oldr_id);

	public void deleteReturnMessage(String r_id);

	public ReturnMessage getById(String r_id);
}