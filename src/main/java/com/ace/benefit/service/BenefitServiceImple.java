package com.ace.benefit.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.ace.benefit.model.BenefitDAO;
import com.ace.benefit.model.BenefitDTO;


public class BenefitServiceImple implements BenefitService {
	
	private BenefitDAO BenefitDao;
	
	
	public BenefitDAO getBenefitDao() {
		return BenefitDao;
	}


	public void setBenefitDao(BenefitDAO benefitDao) {
		BenefitDao = benefitDao;
	}


	@Override
	public int benefitWrite(BenefitDTO bDto) {
		int count = BenefitDao.benefitWrite(bDto);
		return count;
	}
	
	@Override
	public List<BenefitDTO> benefitList(int idx){
		
		List<BenefitDTO> benefitList = BenefitDao.benefitList(idx);
		return benefitList;
	}
	
	@Override
	public int benefitPromotion(int idx) {
		int count = BenefitDao.benefitPromotion(idx);
		return count;
	}

}
