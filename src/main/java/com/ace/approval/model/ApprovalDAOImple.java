package com.ace.approval.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.ace.member.model.MemberDTO;

public class ApprovalDAOImple implements ApprovalDAO {
	
	private SqlSessionTemplate sqlmap;
	
	public ApprovalDAOImple(SqlSessionTemplate sqlmap) {
		super();
		this.sqlmap = sqlmap;
	}

	@Override
	public List<MemberDTO> selectApprover(int com_idx) {
		List<MemberDTO> approver=sqlmap.selectList("selectApprover",com_idx);
		return approver;
	}
	
	@Override
	public int getRef(int com_idx) {
		int result=sqlmap.selectOne("getRef", com_idx);
		return result;
	}

	@Override
	public int approvalWrite(ApprovalDTO dto) {
		int result=sqlmap.insert("writeApproval", dto);
		return result;
	}
	
	@Override
	public int getTotalCnt(Map<String, Integer> map) {
		int count = sqlmap.selectOne("appTotalCnt",map);
		return count;
	}
	
	@Override
	public List<ApprovalDTO> approvalList(Map<String,Integer> map) {
		List<ApprovalDTO> list=sqlmap.selectList("approvalList", map);
		return list;
	}
	
	@Override
	public ApprovalDTO approvalContent(Map<String, Integer> map) {
		ApprovalDTO dto=sqlmap.selectOne("approvalContent", map);
		return dto;
	}
	
	@Override
	public int approvalUpdate(ApprovalDTO dto) {
		int result=sqlmap.update("updateApproval", dto);
		return result;
	}
	
	@Override
	public int deleteApproval(Map<String, Integer> map) {
		int result=sqlmap.delete("deleteApproval", map);
		return result;
	}
	
	@Override
	public int checkApproval(Map<String, Integer> map) {
		int result=sqlmap.update("checkApproval", map);
		return result;
	}
}
