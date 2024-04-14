package com.ace.client_tel.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class Client_TelDAOImple implements Client_TelDAO {
	
	private SqlSessionTemplate sqlmap;
	
	public Client_TelDAOImple(SqlSessionTemplate sqlmap) {
		super();
		this.sqlmap = sqlmap;
	}
	
	public int insertTel(Client_TelDTO dto) {
		int count = sqlmap.insert("insertTel", dto);
		return count;
	}
	
	public List<Client_TelDTO> telList(Map map){
		List<Client_TelDTO> list = sqlmap.selectList("telList", map);
		return list;
	}
	public Client_TelDTO rewriteTel(int client_tel_idx) {
		Client_TelDTO dto = sqlmap.selectOne("rewriteTel", client_tel_idx);
		return dto;
	}
	public int rewriteTelOk(Client_TelDTO dto) {
		int count = sqlmap.insert("rewriteTelOk", dto);
		return count;
	}
	@Override
	public int getTelTotalCnt(int com_idx) {
		int count = sqlmap.selectOne("telTotalCnt",com_idx);
		return count;
	}
	@Override
	public int delTel(int client_tel_idx) {
		int a = sqlmap.delete("delTel", client_tel_idx);
		return a;
	}
}
