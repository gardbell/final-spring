package com.ace.work.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.ace.work.model.WorkDAO;
import com.ace.work.model.WorkDTO;

public class WorkServiceImple implements WorkService {
	
	private WorkDAO WorkDao;
	
	private SqlSessionTemplate sqlmap;
	
	
	public WorkDAO getWorkDao() {
		return WorkDao;
	}


	public void setWorkDao(WorkDAO workDao) {
		WorkDao = workDao;
	}


	@Override
	public int workWrite(WorkDTO wDto) {
		int count = WorkDao.workWrite(wDto);
		return count;
	}
	
	@Override
	public List<WorkDTO> workList(int idx) {
		List<WorkDTO> workList = WorkDao.workList(idx);
		return workList;
	}
	
	@Override
	public int workPromotion(int idx) {
		int count = WorkDao.workPromotion(idx);
		return count;
	}
	
}
