package com.ace.benefit.model;

import java.util.List;

public interface BenefitDAO {

	public int benefitWrite(BenefitDTO bDto);
	public List<BenefitDTO> benefitList(int idx);
	public int benefitPromotion(int idx);
}