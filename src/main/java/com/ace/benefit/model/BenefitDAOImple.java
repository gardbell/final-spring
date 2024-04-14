package com.ace.benefit.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class BenefitDAOImple implements BenefitDAO {
	
	private SqlSessionTemplate sqlmap;
	
	public BenefitDAOImple(SqlSessionTemplate sqlmap) {
		super();
		this.sqlmap = sqlmap;
	}

	@Override
	public int benefitWrite(BenefitDTO bDto) {
		int count = sqlmap.insert("benefitWrite",bDto);
		return count;
	}
	
	@Override
	public List<BenefitDTO> benefitList(int idx){
		
		List<BenefitDTO> list=sqlmap.selectList("benefitList",idx);
		return list;
	}
	
	@Override
	public int benefitPromotion(int idx) {
		int count = sqlmap.update("benefitPromotion",idx);
		return count;
	}
	
}
	
	