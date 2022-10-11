package com.saad.group11.service.impl;

import com.saad.group11.bean.Client;
import com.saad.group11.dao.ClientDao;
import com.saad.group11.dao.impl.ClientDaoImpl;
import com.saad.group11.service.ClientService;

public class ClientServiceImpl implements ClientService {
	private ClientDao clientDao = new ClientDaoImpl();

	@Override
	public Client getClient(Client client) {
		Client clientTemp = clientDao.getClient(client);
		return clientTemp;
	}


	@Override
	public boolean checkClientId(String c_id) {
		return clientDao.checkClientId(c_id);
	}


	public void register(Client client) {
		Client clientTemp = clientDao.getClient(client);
		if(clientTemp!=null) {

		}else {
			saveClient(client);
		}
	}

	@Override
	public void saveClient(Client client) {
		clientDao.saveClient(client);
	}

	
	
	@Override
	public Client selMyClient(Client client) {
		Client clientTemp = clientDao.selMyClient(client);
		return clientTemp;
	}


	@Override
	public Client getClientById(String c_id) {
		// TODO 自动生成的方法存根
		Client clientTemp = clientDao.getClientById(c_id);
		return clientTemp;
	}

	@Override
	public Client updateMyClient(Client client) {
		clientDao.updateMyClient(client);
		Client newClient = clientDao.getClientById(client.getC_id());
		System.out.println("ClientServiceImpl updateMyClient client:" + newClient);
		return newClient;
	}

}
