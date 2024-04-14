package com.ace.license.model;

import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;

public class LicenseDAOImple implements LicenseDAO {
	private SqlSessionTemplate sqlMap;

	public LicenseDAOImple(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	public int addLicense(Map map) {
		int result = this.sqlMap.insert("addLicense", map);
		return result;
	}

	public int delLicense(int com_idx) {
		int result = this.sqlMap.delete("delLicense", Integer.valueOf(com_idx));
		return result;
	}

	public int checkLicense(int com_idx) {
		int result = ((Integer) this.sqlMap.selectOne("checkLicense", Integer.valueOf(com_idx))).intValue();
		return result;
	}

	public Integer checkCEO(int com_idx) {
		Integer ceoidx = (Integer) this.sqlMap.selectOne("checkCEO", Integer.valueOf(com_idx));
		return ceoidx;
	}
	
	@Override
	public int stopLicense(int com_idx) {
		int result=sqlMap.update("stopLicense", com_idx);
		return result;
	}
	
	
	
	
	
	
	@Override
	public int getTotalUserNum() {
		int count = sqlMap.selectOne("totalUserNum");
		return count;
	}

	@Override
	public int getThisMonthIncome() {
		
		int income = 0;
		if (sqlMap.selectOne("thisMonthIncome") == null || sqlMap.selectOne("thisMonthIncome") == "0") {
			income = 0;
		} else {
			income = sqlMap.selectOne("thisMonthIncome");
		}
		return income;
	}

	@Override
	public int getLastMonthIncome() {
		int income = 0;
		if (sqlMap.selectOne("lastMonthIncome") == null || sqlMap.selectOne("lastMonthIncome") == "0") {
			income = 0;
		} else {
			income = sqlMap.selectOne("lastMonthIncome");
		}
		return income;
	}
	@Override
	public int get2MonthAgoIncome() {
		int income = 0;
		if (sqlMap.selectOne("2MonthAgoIncome") == null || sqlMap.selectOne("2MonthAgoIncome") == "0") {
			income = 0;
		} else {
			income = sqlMap.selectOne("2MonthAgoIncome");
		}
		return income;
	}
	@Override
	public int get3MonthAgoIncome() {
		int income = 0;
		if (sqlMap.selectOne("3MonthAgoIncome") == null || sqlMap.selectOne("3MonthAgoIncome") == "0") {
			income = 0;
		} else {
			income = sqlMap.selectOne("3MonthAgoIncome");
		}
		return income;
	}
	@Override
	public int get4MonthAgoIncome() {
		int income = 0;
		if (sqlMap.selectOne("4MonthAgoIncome") == null || sqlMap.selectOne("4MonthAgoIncome") == "0") {
			income = 0;
		} else {
			income = sqlMap.selectOne("4MonthAgoIncome");
		}
		return income;
	}
	@Override
	public int get5MonthAgoIncome() {
		int income = 0;
		if (sqlMap.selectOne("5MonthAgoIncome") == null || sqlMap.selectOne("5MonthAgoIncome") == "0") {
			income = 0;
		} else {
			income = sqlMap.selectOne("5MonthAgoIncome");
		}
		return income;
	}
}
