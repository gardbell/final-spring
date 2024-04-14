package com.ace.member.service;

import java.util.*;

import com.ace.member.model.MemberDTO;

public interface MemberService {
	int NOT_ID = 1;
	int NOT_PWD = 2;
	int LOGIN_OK = 3;
	int ERROR = -1;
	public int memberJoin(MemberDTO dto);
	public boolean idCheck(String userid);
	public int loginCheck(String userid, String userpwd);
	public MemberDTO getUserInfo(String userid);
	public String idFind(Map map);
	public String pwdFind(Map map);
	public List<MemberDTO> memberList(int com_idx);
	public int update(MemberDTO dto);
	public int memberPromotion(int idx);
	public List<MemberDTO> memberNot(Map map);
	public int getListTotalCnt(int com_idx);
	
	public List<MemberDTO> bossList(int cp, int ls);
	public List<MemberDTO> withdrawList(int cp, int ls);
	public List<MemberDTO> bossSearchList(int cp, int ls, String keyword);
	public int getTotalBossCnt();
	public int getTotalBossNum();
	public int getTotalBossSearchCnt(String keyword);
	public int getTotalWithdrawCnt();
	public int getTotalWithdrawNum();
	public int submitWithdraw(int com_idx);
	public int delCompany(int com_idx);
	public int delWithdraw(int com_idx);
	public void updateRankNum0(int com_idx);
	public List<MemberDTO> approveList();
	public int approveMember(List<Integer> selectedIdxs);
	public int getTotalApproveNum();
	
	
	public List<MemberDTO> memberMailList(int com_idx,int cp,int Ls);
	public int memberMailListTotalCnt(int com_idx);
	public List<MemberDTO> memberMailListSearch(int com_idx,String memberKeyword,int cp,int Ls);
	public int memberMailListSearchTotalCnt(int com_idx , String memberKeyword);
	
	
	
	public int delete(Map map);
	public List<MemberDTO> memworkList(int com_idx);
	public List<MemberDTO> memBenefitList(int com_idx);
	
}
