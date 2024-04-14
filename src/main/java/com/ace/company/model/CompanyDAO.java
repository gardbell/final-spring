package com.ace.company.model;

import java.util.*;

public interface CompanyDAO {
	public List<CompanyDTO> comFind(String com_name);
	public int comJoin(CompanyDTO dto);
	public boolean comCheck(String com_name);
	public CompanyDTO getComInfo(int com_idx);
	public int withdraw(int com_idx);
	public int rank(Map map);
	public int nextval();
}
