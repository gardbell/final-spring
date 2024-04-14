package com.ace.work.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class WorkDAOImple implements WorkDAO {
	
	private SqlSessionTemplate sqlmap;
	
	public WorkDAOImple(SqlSessionTemplate sqlmap) {
		super();
		this.sqlmap = sqlmap;
	}
	
	@Override
	public int workWrite(WorkDTO wDto) {
		int count = sqlmap.insert("workWrite", wDto);
		return count;
	}
	
	@Override
	public List<WorkDTO> workList(int idx) {
		
		List<WorkDTO> list=sqlmap.selectList("workList",idx);
		return list;
	}
	
	@Override
	public int workPromotion(int idx) {
		int count = sqlmap.update("workPromotion",idx);
		return count;
	}
	

}
