package com.ace.policy.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class PolicyDAOImple implements PolicyDAO {
	private SqlSessionTemplate sqlmap;

	public PolicyDAOImple(SqlSessionTemplate sqlmap) {
		super();
		this.sqlmap = sqlmap;
	}

	@Override
	public List<PolicyDTO> policyList() {
		List<PolicyDTO> list = sqlmap.selectList("policyList");
		return list;
	}

	@Override
	public int updatePolicy(PolicyDTO policyDto) {
		int result = sqlmap.update("updatePolicy", policyDto);
		return result;
	}
}
