package com.ace.license.model;

import java.util.Map;

public interface LicenseDAO {
  public int addLicense(Map paramMap);
  
  public int delLicense(int paramInt);
  
  public int checkLicense(int paramInt);
  
  public Integer checkCEO(int paramInt);
  
  public int stopLicense(int com_idx);
  
  
  
  public int getTotalUserNum();
  public int getThisMonthIncome();
  public int getLastMonthIncome();
  public int get2MonthAgoIncome();
  public int get3MonthAgoIncome();
  public int get4MonthAgoIncome();
  public int get5MonthAgoIncome();
}
