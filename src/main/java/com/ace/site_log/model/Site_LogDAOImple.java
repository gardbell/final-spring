package com.ace.site_log.model;

import org.mybatis.spring.SqlSessionTemplate;

public class Site_LogDAOImple implements Site_LogDAO {
	private SqlSessionTemplate sqlmap;

	public Site_LogDAOImple(SqlSessionTemplate sqlmap) {
		super();
		this.sqlmap = sqlmap;
	}

	@Override
	public int countCompanyNews_Log() {
		int count = sqlmap.selectOne("selectCompanyNews_Log");
		return count;
	}

	@Override
	public int countCompanyEvent_Log() {
		int count = sqlmap.selectOne("selectCompanyEvent_Log");
		return count;
	}

	@Override
	public int countDocument_Log() {
		int count = sqlmap.selectOne("selectDocument_Log");
		return count;
	}

	@Override
	public int countSchedule_Log() {
		int count = sqlmap.selectOne("selectSchedule_Log");
		return count;
	}

	@Override
	public int countHR_Log() {
		int count = sqlmap.selectOne("selectHR_Log");
		return count;
	}

	@Override
	public int countMail_Log() {
		int count = sqlmap.selectOne("selectMail_Log");
		return count;
	}

	@Override
	public int countCompanyManage_Log() {
		int count = sqlmap.selectOne("selectManage_Log");
		return count;
	}

	@Override
	public void updateCompanyNews_Log() {
		sqlmap.update("updateCompanyNews_Log");

	}

	@Override
	public void updateCompanyEvent_Log() {
		sqlmap.update("updateCompanyEvent_Log");

	}
	@Override
	public void updateDocument_Log() {
		sqlmap.update("updateDocument_Log");
		
	}
	@Override
	public void updateSchedule_Log() {
		sqlmap.update("updateSchedule_Log");
		
	}
	@Override
	public void updateHR_Log() {
		sqlmap.update("updateHR_Log");
		
	}
	@Override
	public void updateMail_Log() {
		sqlmap.update("updateMail_Log");
		
	}
	@Override
	public void updateManage_Log() {
		sqlmap.update("updateManage_Log");
		
	}
}
