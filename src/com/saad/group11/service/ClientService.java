package com.saad.group11.service;

import com.saad.group11.bean.Client;

public interface ClientService {
	/*
	 * 业务逻辑层
	 * 
	 * 登录
	 * */
	Client getClient(Client client);

	//写成蓝色的，鼠标移动到上面，可以展示蓝色部分的内容（对应信息）
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
	void saveClient(Client client);


	Client getClientById(String c_id);
	Client selMyClient(Client client);
	Client updateMyClient(Client client);
}

