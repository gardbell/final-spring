package com.ace.client_tel.model;

import java.util.*;

public interface Client_TelDAO {
	public int insertTel(Client_TelDTO dto);
	public List<Client_TelDTO> telList(Map map);
	public Client_TelDTO rewriteTel(int client_tel_idx);
	public int rewriteTelOk(Client_TelDTO dto);
	public int getTelTotalCnt(int com_idx);
	public int delTel(int client_tel_idx);
}
