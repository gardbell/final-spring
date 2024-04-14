package com.ace.site_log.model;

public interface Site_LogDAO {
	public int countCompanyNews_Log();
	public int countCompanyEvent_Log();
	public int countDocument_Log();
	public int countSchedule_Log();
	public int countHR_Log();
	public int countMail_Log();
	public int countCompanyManage_Log();
	
	public void updateCompanyNews_Log();
	public void updateCompanyEvent_Log();
	public void updateDocument_Log();
	public void updateSchedule_Log();
	public void updateHR_Log();
	public void updateMail_Log();
	public void updateManage_Log();
}
