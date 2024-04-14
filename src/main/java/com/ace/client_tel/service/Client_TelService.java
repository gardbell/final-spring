package com.ace.client_tel.service;

import java.util.*;

import com.ace.client_tel.model.Client_TelDTO;

public interface Client_TelService {
	public int insertTel(Client_TelDTO dto);
	public List<Client_TelDTO> telList(int com_idx,int cp,int ls);
	public Client_TelDTO rewriteTel(int client_tel_idx);
	public int rewriteTelOk(Client_TelDTO dto);
	public int getTelTotalCnt(int com_idx);
	public int delTel(int client_tel_idx);
}
