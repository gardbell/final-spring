package com.ace.policy.service;

import java.util.List;

import com.ace.policy.model.PolicyDTO;

public interface PolicyService{
	public List<PolicyDTO> policyList();
	public int updatePolicy(PolicyDTO policyDto);
}
