package com.ace.approval.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ace.approval.model.ApprovalDAO;
import com.ace.approval.model.ApprovalDTO;
import com.ace.member.model.MemberDTO;

public class ApprovalServiceImple implements ApprovalService {
	
	private ApprovalDAO approvalDao;
	
	public ApprovalServiceImple(ApprovalDAO approvalDao) {
		super();
		this.approvalDao = approvalDao;
	}

	@Override
	public List<MemberDTO> selectApprover(int com_idx) {
		List<MemberDTO> approver=approvalDao.selectApprover(com_idx);
		return approver;
	}
	
	@Override
	public int getRef(int com_idx) {
		int result=approvalDao.getRef(com_idx)+1;
		return result;
	}
	
	@Override
	public int approvalWrite(ApprovalDTO dto) {
		int result=approvalDao.approvalWrite(dto);
		return result;
	}
	
	@Override
	public int getTotalCnt(Map<String, Integer> map) {
		int count = approvalDao.getTotalCnt(map);
		return count;
	}
	
	@Override
	public List<ApprovalDTO> approvalList(int idx,int check,int cp,int listSize) {
		int start = (cp-1)*listSize+1;
		int end = cp*listSize;
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("idx", idx);
		map.put("check", check);
		map.put("start", start);
		map.put("end", end);
		List<ApprovalDTO> list=approvalDao.approvalList(map);
		return list;
	}
	
	@Override
	public ApprovalDTO approvalContent(Map<String, Integer> map) {
		ApprovalDTO dto=approvalDao.approvalContent(map);
		return dto;
	}
	
	@Override
	public int approvalUpdate(ApprovalDTO dto) {
		int result=approvalDao.approvalUpdate(dto);
		return result;
	}
	
	@Override
	public int deleteApproval(Map<String, Integer> map) {
		int result=approvalDao.deleteApproval(map);
		return result;
	}
	
	@Override
	public int checkApproval(Map<String, Integer> map) {
		int result=approvalDao.checkApproval(map);
		return result;
	}
}
