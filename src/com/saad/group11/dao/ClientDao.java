package com.saad.group11.dao;

import com.saad.group11.bean.Client;
import com.saad.group11.bean.StorePersonal;

public interface ClientDao {
	/**
	 * 数据访问层
	 * 
	 * 登录
	 * sql:select * from client where c_name=? and password=?;
	 * */
	Client getClient(Client client);
	
	Client getClientById(String c_id);
	
	/**
	 * 用户想要注册时
	 * 检查用户名是否存在
	 * 	为true则以存在，为false则不存在，可注册
	 * 
	 * sql：select * from client where `c_id` = ?;
	 * */
	boolean checkClientId(String c_id);
	
	/**
	 * 将user信息保存到数据库
	 * @param client
	 * sql：insert into client values(?,?,?,?,?);
	 * 
	 * 
	 */
	/**
	 * 为什么这里返回值类型用void，上面checkClientId用boolean呢。
	 * 因为checkClientId时是用户的行为可能出错
	 * 而如果用户注册时信息符合要求（JS），只要代码没错，那么保存就不应该错了。
	 * 如果错了，是代码的问题，而不是让客户去处理问题（通过boolean）
	 */
	void saveClient(Client client);

	Client getBookOwnFinal(StorePersonal eachbook);
	
	
	Client selMyClient(Client client);
	void updateMyClient(Client client);
}
