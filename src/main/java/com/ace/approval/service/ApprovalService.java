package com.ace.approval.service;

import java.util.List;
import java.util.Map;

import com.ace.approval.model.ApprovalDTO;
import com.ace.member.model.MemberDTO;

public interface ApprovalService {
	public List<MemberDTO> selectApprover(int com_idx);
	public int getRef(int com_idx);
	public int approvalWrite(ApprovalDTO dto);
	public int getTotalCnt(Map<String, Integer> map);
	public List<ApprovalDTO> approvalList(int idx,int check,int cp,int listSize);
	public ApprovalDTO approvalContent(Map<String, Integer> map);
	public int approvalUpdate(ApprovalDTO dto);
	public int deleteApproval(Map<String,Integer> map);
	public int checkApproval(Map<String,Integer> map);
}
