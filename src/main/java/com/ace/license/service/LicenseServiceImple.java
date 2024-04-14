package com.ace.license.service;

import com.ace.license.model.LicenseDAO;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;

public class LicenseServiceImple implements LicenseService {
  @Autowired
  private LicenseDAO licenseDao;
  
  public LicenseServiceImple(LicenseDAO licenseDao) {
    this.licenseDao = licenseDao;
  }
  
  public int addLicense(Map map) {
    int result = this.licenseDao.addLicense(map);
    map.get("");
    return result;
  }
  
  public int delLicense(int com_idx) {
    int result = this.licenseDao.delLicense(com_idx);
    return result;
  }
  
  public int checkLicense(int com_idx) {
    int result = this.licenseDao.checkLicense(com_idx);
    return result;
  }
  
  public Integer checkCEO(int com_idx) {
    Integer ceoidx = this.licenseDao.checkCEO(com_idx);
    return ceoidx;
  }
  
  @Override
	public int stopLicense(int com_idx) {
	  	int result=licenseDao.stopLicense(com_idx);
		return result;
	}
  
  
  
  
  @Override
	public int getTotalUserNum() {
		int count=licenseDao.getTotalUserNum();
		return count;
	}
	@Override
	public int getThisMonthIncome() {
		int totalprice=licenseDao.getThisMonthIncome();
		return totalprice;
	}
	@Override
	public int getLastMonthIncome() {
		int totalprice=licenseDao.getLastMonthIncome();
		return totalprice;
	}
	@Override
	public int get2MonthAgoIncome() {
		int totalprice=licenseDao.get2MonthAgoIncome();
		return totalprice;
	}
	@Override
	public int get3MonthAgoIncome() {
		int totalprice=licenseDao.get3MonthAgoIncome();
		return totalprice;
	}
	@Override
	public int get4MonthAgoIncome() {
		int totalprice=licenseDao.get4MonthAgoIncome();
		return totalprice;
	}
	@Override
	public int get5MonthAgoIncome() {
		int totalprice=licenseDao.get5MonthAgoIncome();
		return totalprice;
	}
}
