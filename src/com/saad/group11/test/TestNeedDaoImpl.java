package com.saad.group11.test;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;

import com.saad.group11.bean.Need;
import com.saad.group11.dao.NeedDao;
import com.saad.group11.dao.impl.NeedDaoImpl;

class TestNeedDaoImpl {

	NeedDao needDao = new NeedDaoImpl();
	@Test
	void testGetAllNeeds() {
		List<Need> allNeeds = needDao.getAllNeeds();
		for (Need need : allNeeds) {
			System.out.println(need);
		}
	}

}
