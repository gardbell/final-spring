package com.ace.policy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ace.policy.model.PolicyDAO;
import com.ace.policy.model.PolicyDTO;

public class PolicyServiceImple implements PolicyService {

	@Autowired
	private PolicyDAO policyDao;

	public PolicyDAO getPolicyDao() {
		return policyDao;
	}

	public void setPolicyDao(PolicyDAO policyDao) {
		this.policyDao = policyDao;
	}

	@Override
	public List<PolicyDTO> policyList() {
		List<PolicyDTO> list = policyDao.policyList();
		return list;
	}

	@Override
	public int updatePolicy(PolicyDTO policyDto) {
		int result = policyDao.updatePolicy(policyDto);
		return result;
	}
}
