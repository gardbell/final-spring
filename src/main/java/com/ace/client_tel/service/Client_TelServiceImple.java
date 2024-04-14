package com.ace.client_tel.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ace.client_tel.model.Client_TelDAO;
import com.ace.client_tel.model.Client_TelDTO;

public class Client_TelServiceImple implements Client_TelService {
	private Client_TelDAO client_telDao;
	
	
	public Client_TelDAO getClient_telDao() {
		return client_telDao;
	}
	public void setClient_telDao(Client_TelDAO client_telDao) {
		this.client_telDao = client_telDao;
	}
	@Override
	public int insertTel(Client_TelDTO dto) {
		int a = client_telDao.insertTel(dto);
		return a;
	}
	@Override
	public List<Client_TelDTO> telList(int com_idx,int cp,int ls) {
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		Map map = new HashMap();
		map.put("com_idx", com_idx);
		map.put("start", start);
		map.put("end", end);
		
		List<Client_TelDTO> list = client_telDao.telList(map);
		return list;
	}
	@Override
	public Client_TelDTO rewriteTel(int client_tel_idx) {
		Client_TelDTO dto = client_telDao.rewriteTel(client_tel_idx);
		return dto;
	}
	@Override
	public int rewriteTelOk(Client_TelDTO dto) {
		int a = client_telDao.rewriteTelOk(dto);
		return a;
	}
	@Override
	public int getTelTotalCnt(int com_idx) {
		int a = client_telDao.getTelTotalCnt(com_idx);
		return a;
	}
	
	@Override
	public int delTel(int client_tel_idx) {
		int a = client_telDao.delTel(client_tel_idx);
		return a;
	}
}
