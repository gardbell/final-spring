package com.ace.company.service;

import java.util.*;

import com.ace.company.model.CompanyDTO;

public interface CompanyService {
	public List<CompanyDTO> comFind(String com_name);
	public int comJoin(CompanyDTO dto);
	public boolean comCheck(String com_name);
	public CompanyDTO getComInfo(int com_idx);
	public int withdraw(int com_idx);
	public int rank(Map map);
	public int nextval();
}
