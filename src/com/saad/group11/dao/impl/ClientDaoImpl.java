package com.saad.group11.dao.impl;

import java.util.List;

import com.saad.group11.bean.Client;
import com.saad.group11.bean.StorePersonal;
import com.saad.group11.dao.BaseDao;
import com.saad.group11.dao.ClientDao;

public class ClientDaoImpl extends BaseDao<Client> implements ClientDao{

	/**
	 *	数据访问层
	 *
	 */
	@Override
	public Client getClient(Client client) {
		String sql = "select * from client where `c_id`=? and `password`=?";
		Client clientTemp = this.getBean(sql, client.getC_id(),client.getPassword());
		return clientTemp;
	}
	
	/**
	 * 根据用户c_id获取用户
	 * @param c_id
	 * @return
	 */
	@Override
	public Client getClientById(String c_id) {
		String sql = "select * from client where `c_id`=?";
		Client client = this.getBean(sql, c_id);
		return client;
	}

	@Override
	public boolean checkClientId(String c_id) {
		String sql = "select * from client where `c_id`=?";
		Client clientTemp = this.getBean(sql, c_id);
		return clientTemp != null;
		/*
		 * 上面这行代码的逻辑与下面的if...else...相同。这就是差距吗？
		if(clientTemp == null) {
			return false;
		}else {
			return true;
		}
		*/
	}


	@Override
	public void saveClient(Client client) {
//		String sql = "insert into client values(?,?,?,?,?,?)";
//		String sql = "insert into client('c_id','password','c_name') values(?,?,?);";
		/*
		Enum<Gender> gender = client.getGender();
		String strGender = "";
		if(gender == Gender.Male) {
			strGender = "Male";
		}else if(gender == Gender.Female) {
			strGender = "Female";
		}else {
			strGender = "Unknown";
		}
		*/
		String sql = "insert into client(c_id,password,c_name,gender,address,credit) values(?,?,?,?,?,10.0)";
//		System.out.println(sql);
		this.update(sql, client.getC_id(),
				client.getPassword(),
				client.getC_name(),
				client.getGender(),
//				strGender,
				client.getAddress()
		);
		
	}
	
	
	@Override
	public Client  getBookOwnFinal(StorePersonal eachbook) {
		String sql="select * from client where client.c_id=(select c_id from storepersonal where p_id="+eachbook.getP_id()+");";
//		System.out.println(sql);
//		System.out.println("oooo"+this.getBean(sql));
		
		List<Client> bean = this.getBeanList(sql);
//				Client bean = this.getBean(sql);
		System.out.println("ClientDao getBookOwnFinal:" + bean);
		
//		return bean.get(0);
		
		return this.getBean(sql);
		
		
	}
	
	
	@Override
	public Client selMyClient(Client client) {
		String sql = "select * from client where `c_id`=? and `password`=?";
		Client clientTemp = this.getBean(sql, client.getC_id(),client.getPassword(),client.getC_name(),client.getAddress(),client.getGender(),client.getCredit());
		return clientTemp;
	}

	@Override
	public void updateMyClient(Client client) {
		String sql = "update client set password = ?, c_name = ?,  gender = ?, address = ?  where c_id = ?";
//		System.out.println("Dao gender:"+client.getGender());
		int res = this.update(sql,client.getPassword(),client.getC_name(),client.getGender(),client.getAddress(),client.getC_id());
//		System.out.println("res:" + res);
	}
	
}
