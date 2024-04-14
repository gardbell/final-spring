package com.ace.policy.model;

public class PolicyDTO {
	private int policy_idx;
	private String policy_title;
	private String policy_content;

	public PolicyDTO() {
		super();
	}

	public PolicyDTO(int policy_idx, String policy_title, String policy_content) {
		super();
		this.policy_idx = policy_idx;
		this.policy_title = policy_title;
		this.policy_content = policy_content;
	}

	public int getPolicy_idx() {
		return policy_idx;
	}

	public void setPolicy_idx(int policy_idx) {
		this.policy_idx = policy_idx;
	}

	public String getPolicy_title() {
		return policy_title;
	}

	public void setPolicy_title(String policy_title) {
		this.policy_title = policy_title;
	}

	public String getPolicy_content() {
		return policy_content;
	}

	public void setPolicy_content(String policy_content) {
		this.policy_content = policy_content;
	}

}
