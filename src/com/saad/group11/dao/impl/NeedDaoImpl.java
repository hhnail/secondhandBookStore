package com.saad.group11.dao.impl;

import java.util.List;

import com.saad.group11.bean.Need;
import com.saad.group11.dao.BaseDao;
import com.saad.group11.dao.NeedDao;

public class NeedDaoImpl extends BaseDao<Need>implements NeedDao {

	@Override
	public List<Need> getAllNeeds() {
		String sql = "select * from need";
		return this.getBeanList(sql);
	}
	@Override
	public List<Need> getNeedsByState(String state) {
		String sql = "select * from need where state = '审核通过'";
		this.getBeanList(sql);
		return null;
	}

	@Override
	public void addNeed(Need need) {
		String sql = "insert into `need`(n_id,max_price,deadline,min_credit,description,amount,ISBN,c_id) values(?,?,?,?,?,?,?,?)";
		
		//test1
		String ISBN = need.getBookList().getISBN();
		System.out.println("ISBN:" + ISBN);
		this.update(sql,need.getN_id(),need.getMax_price(),need.getDeadline(), need.getMin_credit(), need.getDescription(), need.getAmount(),need.getBookList().getISBN(),need.getClient().getC_id());
	}
	
	@Override
	public List<Need> getAllUnsetNeeds() {
		String sql = "select * from need where state='待审核'";
		return this.getBeanList(sql);
	}
	
	@Override
	public void changeState(String n_id,String confirm) {
		String sql = "update need set state='"+confirm+"'  where n_id='"+n_id+"'; ";
		System.out.println(sql);
		this.update(sql);
	}

	

}
