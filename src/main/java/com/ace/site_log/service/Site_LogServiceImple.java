package com.ace.site_log.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.ace.site_log.model.Site_LogDAO;

public class Site_LogServiceImple implements Site_LogService {

	@Autowired
	private Site_LogDAO site_logDao;

	public Site_LogDAO getSite_logDao() {
		return site_logDao;
	}

	public void setSite_logDao(Site_LogDAO site_logDao) {
		this.site_logDao = site_logDao;
	}

	@Override
	public int countCompanyNews_Log() {
		int count = site_logDao.countCompanyNews_Log();
		return count;
	}

	@Override
	public int countCompanyEvent_Log() {
		int count = site_logDao.countCompanyEvent_Log();
		return count;
	}

	@Override
	public int countDocument_Log() {
		int count = site_logDao.countDocument_Log();
		return count;
	}

	@Override
	public int countSchedule_Log() {
		int count = site_logDao.countSchedule_Log();
		return count;
	}

	@Override
	public int countHR_Log() {
		int count = site_logDao.countHR_Log();
		return count;
	}

	@Override
	public int countMail_Log() {
		int count = site_logDao.countMail_Log();
		return count;
	}

	@Override
	public int countCompanyManage_Log() {
		int count = site_logDao.countCompanyManage_Log();
		return count;
	}

	@Override
	public void updateCompanyNews_Log() {
		site_logDao.updateCompanyNews_Log();

	}

	@Override
	public void updateCompanyEvent_Log() {
		site_logDao.updateCompanyEvent_Log();

	}

	@Override
	public void updateDocument_Log() {
		site_logDao.countDocument_Log();

	}

	@Override
	public void updateSchedule_Log() {
		site_logDao.updateSchedule_Log();

	}

	@Override
	public void updateHR_Log() {
		site_logDao.updateHR_Log();

	}

	@Override
	public void updateMail_Log() {
		site_logDao.updateMail_Log();

	}

	@Override
	public void updateManage_Log() {
		site_logDao.updateManage_Log();

	}
}
