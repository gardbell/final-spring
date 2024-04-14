package com.ace.benefit.service;

import java.util.List;

import com.ace.benefit.model.BenefitDTO;

public interface BenefitService {
	
	public int benefitWrite(BenefitDTO bDto);
	public List<BenefitDTO> benefitList(int idx);
	public int benefitPromotion(int idx);
	
}
