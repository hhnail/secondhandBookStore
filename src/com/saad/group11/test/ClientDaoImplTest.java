package com.saad.group11.test;

import org.junit.jupiter.api.Test;

import com.saad.group11.bean.Client;
import com.saad.group11.dao.ClientDao;
import com.saad.group11.dao.impl.ClientDaoImpl;

class ClientDaoImplTest {

	private ClientDao clientDao = new ClientDaoImpl();
	/**
	 * 这个方法是调用ClientDao继承父类BaseDao的查询方法
	 * 如果写sql的时候参数不全，他就不会查询得到全部的信息
	 */
	@Test
	void testCheckClientId() {
		Client client = new Client("test01", null, null, null, null);
		Client client2 = new Client("test011", null, null, null, null);
		boolean yOn = clientDao.checkClientId(client.getC_id());
		boolean yOn2 = clientDao.checkClientId(client2.getC_id());
		System.out.println(yOn);
		System.out.println(yOn2);
	}
	
	@Test
	void testGetClient() {
//		Client client = clientDao.getClient(new Client("test01", "test01", "test01", "test01", new Double(10.0)));
		Client client = clientDao.getClient(new Client("test", "test", null, null, null));
		/*
		 * 这里创建用户的时候其实只是为了满足getClient的形参要求，
		 * 查询是根据c_id和password，
		 * 那么传的时候自然给他c_id和password即可
		 * */
		System.out.println(client);
		
		/*
		 * 如果查询到符合要求的，说明该用户注册了
		 * 如果为null，说明该用户未注册/输入错误
		 * */
	}
	
	@Test
	void testGetClientById() {
		Client client = clientDao.getClientById("test");
		System.out.println(client);
	}

}
