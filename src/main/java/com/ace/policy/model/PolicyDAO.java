package com.ace.policy.model;

import java.util.List;

public interface PolicyDAO {
	public List<PolicyDTO> policyList();
	public int updatePolicy(PolicyDTO policyDto);
}
