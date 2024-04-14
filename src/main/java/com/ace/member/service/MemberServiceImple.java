package com.ace.member.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;

import com.ace.member.model.MemberDAO;
import com.ace.member.model.MemberDTO;

public class MemberServiceImple implements MemberService {
	int NOT_ID = 1;
	int NOT_PWD = 2;
	int LOGIN_OK = 3;
	int ERROR = -1;
	
	@Autowired
	private MemberDAO memberDao;
	
	public MemberDAO getMemberDao() {
		return memberDao;
	}
	public void setMemberDao(MemberDAO memberDao) {
		this.memberDao = memberDao;
	}
	
	public int memberJoin(MemberDTO dto) {
		String lc = dto.getId().toLowerCase();
		dto.setId(lc);
		int cout = memberDao.memberJoin(dto);
		return cout;
	}
	public boolean idCheck(String userid) {
		boolean result = memberDao.idCheck(userid);
		return result;
	}
	public int loginCheck(String userid, String userpwd) {
		try {
			String result = memberDao.loginCheck(userid, userpwd);
			if (result!=null) {
				if(result.equals(userpwd)) {
					return LOGIN_OK;
				}else {
					return NOT_PWD;
				}		
			}else {
				return NOT_ID;
			}
		}
		catch (Exception e) {
			return ERROR;
		}
	}
	public MemberDTO getUserInfo(String userid) {
		MemberDTO dto = memberDao.getUserInfo(userid);
		return dto;
	}
	public String idFind(Map map) {
		String idfind = memberDao.idFind(map);
		return idfind;
	}
	public String pwdFind(Map map) {
		String pwdfind = memberDao.pwdFind(map);
		return pwdfind;
	}
	public List<MemberDTO> memberList(int com_idx){
		
		List<MemberDTO> list = memberDao.memberList(com_idx);
		return list;
	}
	@Override
	public int update(MemberDTO dto) {
		int count = memberDao.update(dto);
		return count;
	}
	@Override
	public int memberPromotion(int idx) {
		int count = memberDao.memberPromotion(idx);
		return count;
	}
	@Override
	public List<MemberDTO> memberNot(Map map) {
		List<MemberDTO> a = memberDao.memberNot(map);
		return a;
	}
	@Override
	public int getListTotalCnt(int com_idx) {
		int a = memberDao.getListTotalCnt(com_idx);
		return a;
	}
	
	//
	@Override
	public List<MemberDTO> bossList(int cp, int ls) {
		int start = (cp - 1) * ls + 1;
		int end = cp * ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<MemberDTO> list = memberDao.bossList(map);
		return list;
	}

	@Override
	public int getTotalBossCnt() {
		int count = memberDao.getTotalBossCnt();
		count = count == 0 ? 1 : count;
		return count;
	}

	@Override
	public int getTotalBossNum() {
		int count = memberDao.getTotalBossCnt();
		return count;
	}

	@Override
	public List<MemberDTO> bossSearchList(int cp, int ls, String keyword) {
		int start = (cp - 1) * ls + 1;
		int end = cp * ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("keyword", keyword);
		List<MemberDTO> list = memberDao.bossSearchList(map);
		return list;
	}

	@Override
	public int getTotalBossSearchCnt(String keyword) {
		int count = memberDao.getTotalBossSearchCnt(keyword);
		count = count == 0 ? 1 : count;
		return count;
	}

	@Override
	public int getTotalWithdrawCnt() {
		int count = memberDao.getTotalWithdrawCnt();
		count = count == 0 ? 1 : count;
		return count;
	}

	@Override
	public int getTotalWithdrawNum() {
		int count = memberDao.getTotalWithdrawCnt();
		return count;
	}

	@Override
	public List<MemberDTO> withdrawList(int cp, int ls) {
		int start = (cp - 1) * ls + 1;
		int end = cp * ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<MemberDTO> list = memberDao.withdrawList(map);
		return list;
	}

	@Override
	public int submitWithdraw(int com_idx) {
		int result = memberDao.submitWithdraw(com_idx);
		return result;
	}

	@Override
	public int delCompany(int com_idx) {
		int result = memberDao.delCompany(com_idx);
		return result;
	}

	public int delWithdraw(int com_idx) {
		int result = memberDao.delWithdraw(com_idx);
		return result;
	}

	@Override
	public void updateRankNum0(int com_idx) {
		memberDao.updateRankNum0(com_idx);

	}

	@Override
	public List<MemberDTO> approveList() {
		List<MemberDTO> list = memberDao.approveList();
		return list;
	}
	@Override
	public int approveMember(List<Integer> selectedIdxs) {
		int result= memberDao.approveMember(selectedIdxs);
		return result;
	}
	@Override
	public int getTotalApproveNum() {
		int count=memberDao.getTotalApproveNum();
		return count;
	}
	   
	   
	   @Override
	   public List<MemberDTO> memberMailList(int com_idx,int cp,int ls) {
			int start = (cp-1)*ls+1;
			int end = cp*ls;
			Map map = new HashMap();
			map.put("com_idx", com_idx);
			map.put("start", start);
			map.put("end", end);
		List<MemberDTO> memberList = memberDao.memberMailList(map);
		return memberList;
	}
	   
	   @Override
	   public int memberMailListTotalCnt(int com_idx) {
		int count = memberDao.memberMailListTotalCnt(com_idx);
		count = count == 0?1:count;
		return count;
	}
	   
	   @Override
	public List<MemberDTO> memberMailListSearch(int com_idx, String memberKeyword,int cp,int ls) {
			int start = (cp-1)*ls+1;
			int end = cp*ls;
			Map map = new HashMap();
			map.put("com_idx", com_idx);
			map.put("memberKeyword", memberKeyword);
			map.put("start", start);
			map.put("end", end);
			List<MemberDTO> memberList = memberDao.memberMailListSearch(map);
			
			return memberList;
	}
	   
	   @Override
	public int memberMailListSearchTotalCnt(int com_idx, String memberKeyword) {
			Map map = new HashMap();
			map.put("com_idx", com_idx);
			map.put("memberKeyword", memberKeyword);
		int count = memberDao.memberMailListSearchTotalCnt(map);
		return count;
	}
	   
	   @Override
		public int delete(Map map) {
			int count = memberDao.delete(map);
			return count;
		}
		
		@Override
		public List<MemberDTO> memworkList(int com_idx) {
			List<MemberDTO> list = memberDao.memworkList(com_idx);
			return list;
		}
		@Override
		public List<MemberDTO> memBenefitList(int com_idx) {
			List<MemberDTO> list = memberDao.memBenefitList(com_idx);
			return list;
		}
	
}
