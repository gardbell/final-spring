package com.ace.company.service;

import java.util.*;

import com.ace.company.model.CompanyDAO;
import com.ace.company.model.CompanyDTO;

public class CompanyServiceImple implements CompanyService {
	private CompanyDAO companyDao;
		
	public CompanyDAO getCompanyDao() {
		return companyDao;
	}
	public void setCompanyDao(CompanyDAO companyDao) {
		this.companyDao = companyDao;
	}
	
	public List<CompanyDTO> comFind(String com_name){
		com_name.toLowerCase();
		List<CompanyDTO> list = companyDao.comFind(com_name);
		return list;
	}
	public int comJoin(CompanyDTO dto) {
		int comJoin = companyDao.comJoin(dto);
		return comJoin;
	}
	
	public boolean comCheck(String com_name) {
		boolean result = companyDao.comCheck(com_name);
		return result;
	}
	
	public CompanyDTO getComInfo(int com_idx) {
		CompanyDTO cdto = companyDao.getComInfo(com_idx);
		return cdto;
	}
	@Override
	public int withdraw(int com_idx) {
		int a = companyDao.withdraw(com_idx);
		return a;
	}
	@Override
	public int rank(Map map) {
		int a = companyDao.rank(map);
		return a;
	}
	@Override
	public int nextval() {
		int a = companyDao.nextval();
		return a;
	}
}
