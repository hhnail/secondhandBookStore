package com.saad.group11.service.impl;

import java.util.List;

import com.saad.group11.bean.Need;
import com.saad.group11.service.NeedService;
import com.saad.group11.dao.NeedDao;
import com.saad.group11.dao.impl.NeedDaoImpl;

public class NeedServiceImpl implements NeedService{

	private NeedDao needDao = new NeedDaoImpl();
	
	@Override
	public List<Need> getAllNeeds() {
		return needDao.getAllNeeds();
	}
	
	@Override
	public List<Need> getNeedsByState(String state) {
		return null;
	}
	
	@Override
	public void addNeed(Need need) {
		needDao.addNeed(need);
	}
	
	@Override
	public List<Need> getAllUnsetNeeds(){
		return needDao.getAllUnsetNeeds();
	}
	
	
	@Override
	public void changeState(String n_id,String confirm) {
		needDao.changeState(n_id,confirm);
	}

}
