package com.saad.group11.dao.impl;

import java.util.List;

import com.saad.group11.bean.ReturnMessage;
import com.saad.group11.dao.BaseDao;
import com.saad.group11.dao.ReturnMessageDao;

public class ReturnMessageDaoImpl extends BaseDao<ReturnMessage> implements ReturnMessageDao {

	ReturnMessageDao returnMessageDao = new ReturnMessageDaoImpl();

	@Override
	public ReturnMessage getRorderlineById(String olid) {
		String sql ="select * from returnmessage where `ol_id` = ?";
		return this.getBean(sql,olid);
	}

	
	@Override
	public void updateReturnMessage(ReturnMessage message, String oldr_id) {
		String sql = "update returnmessage set r_id =?, r_time = ?, reason = ?, state = ? where `r_id` = ?";
		this.update(sql,message.getR_id(), message.getR_time(), message.getReason(), message.getState(),oldr_id);

	}

	@Override
	public void deleteReturnMessage(String r_id) {
		String sql = "delete from ruturnmessage where `r_id` = ?";
		this.update(sql, r_id);

	}

	@Override
	public List<ReturnMessage> getReturnMessagesByClientId(String clientId) {
		String sql = "select * from returnmessage r inner join orderline ol on r.ol_id = ol.ol_id"
				+ " inner join order o on o.o_id = ol.o_id where o.c_id = ?";
		return this.getBeanList(sql,clientId);
	}

	@Override
	public void addReturnMessage(ReturnMessage message) {
		String sql = "insert into ruturnmessage(`r_id`,`r_time`,`reason`,`state`) values(?,?,?,?)";
		System.out.println(message.getR_id());
		this.update(sql,message.getR_id(), message.getR_time(), message.getReason(), message.getState());
	}

	@Override
	public ReturnMessage getById(String r_id) {
		String sql ="select * from returnmessage where `r_id` = ?";
		return this.getBean(sql,r_id);
	}
}
