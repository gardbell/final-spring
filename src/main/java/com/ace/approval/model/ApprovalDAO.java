package com.ace.approval.model;

import java.util.List;
import java.util.Map;

import com.ace.member.model.MemberDTO;

public interface ApprovalDAO {
	public List<MemberDTO> selectApprover(int com_idx);
	public int getRef(int com_idx);
	public int approvalWrite(ApprovalDTO dto);
	public int getTotalCnt(Map<String, Integer> map);
	public List<ApprovalDTO> approvalList(Map<String,Integer> map);
	public ApprovalDTO approvalContent(Map<String,Integer> map);
	public int approvalUpdate(ApprovalDTO dto);
	public int deleteApproval(Map<String,Integer> map);
	public int checkApproval(Map<String,Integer> map);
}
