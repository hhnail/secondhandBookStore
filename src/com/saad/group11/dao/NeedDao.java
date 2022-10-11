package com.saad.group11.dao;

import java.util.List;

import com.saad.group11.bean.Need;

public interface NeedDao {
	/**
	 * 获取所有的“需求” 
	 * 给管理员看的
	 * 
	 * sql:select * from needs
	 * @return
	 */
	public List<Need> getAllNeeds();
	
	/**
	 * 根据“需求”的状态获取需求
	 * @param state
	 * @return
	 */
	public List<Need> getNeedsByState(String state);

	void addNeed(Need need);

	void changeState(String n_id, String confirm);

	List<Need> getAllUnsetNeeds();
}
