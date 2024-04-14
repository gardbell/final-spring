package com.ace.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ace.member.model.MemberDTO;
import com.ace.member.service.MemberService;
import com.ace.site_log.service.Site_LogService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private Site_LogService site_logService;
	
	@RequestMapping("/member.do")
	public String member() {
		return "member/member";
	}
	@RequestMapping(value = "/memberJoin.do", method = RequestMethod.GET)
	public String memberJoin() {
		return "member/memberJoin";
	}
	@RequestMapping(value = "/memberJoin.do", method = RequestMethod.POST)
	public ModelAndView memberJoinOk(MemberDTO dto) {
		
		ModelAndView mav = new ModelAndView();
		boolean check = memberService.idCheck(dto.getId());	
		if(check) {
			String url = "/aceworks/member.do";
			mav.addObject("msg", "ID 중복됨. 다시 확인하세요.");
			mav.addObject("url", url);
			mav.setViewName("member/message");
			return mav;			
		}else {		
			int result = memberService.memberJoin(dto);
			String msg = result>0?"회원가입 성공":"회원가입 실패";
			String url = "/aceworks";		
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("member/message");
			return mav;		
		}
	}
	
	@RequestMapping("/idpwFind.do")
	public String idpwFind() {
		return "member/idpwFind";
	}
	@RequestMapping("/idpwMemId.do")
	public String idpwMemId() {
		return "member/idpwMemId";
	}
	@RequestMapping(value="/idpwMemId.do", method = RequestMethod.POST)
	public ModelAndView idpwMemIdOk(
			@RequestParam("name")String name,
			@RequestParam("email")String email) {
		Map map = new HashMap();
		map.put("name", name);
		map.put("email", email);
		
		ModelAndView mav = new ModelAndView();
		String msg = memberService.idFind(map);
		if(msg==null||msg.equals("")) {
			msg="해당 아이디가 없습니다.";
		}
		String url = "/aceworks";			
		mav.addObject("msg", "찾은 ID: "+msg);
		mav.addObject("url", url);
		mav.setViewName("member/message");
		return mav;
	}
	
	@RequestMapping("/idpwMemPwd.do")
	public String idpwMemPwd() {
		return "member/idpwMemPwd";
	}
	@RequestMapping(value="/idpwMemPwd.do", method = RequestMethod.POST)
	public ModelAndView idpwMemPwdOk(
			@RequestParam("id")String id,
			@RequestParam("name")String name,
			@RequestParam("tel")String tel,
			@RequestParam("email")String email) {
		Map map = new HashMap();
		map.put("id", id);
		map.put("name", name);
		map.put("tel", tel);
		map.put("email", email);
		
		ModelAndView mav = new ModelAndView();
		String msg = memberService.pwdFind(map);
		if(msg==null||msg.equals("")) {
			msg="해당 비밀번호가 없습니다.";
		}
		String url = "/aceworks";			
		mav.addObject("msg", "찾은 PWD: "+msg);
		mav.addObject("url", url);
		mav.setViewName("member/message");
		return mav;
	}
	
	
	@RequestMapping("/idCheck.do")
	public ModelAndView idCheckSubmit(
			@RequestParam("id")String id) {
		boolean result = memberService.idCheck(id);
		ModelAndView mav = new ModelAndView();
		String msg = result==true?"이미 등록된 아이디 입니다.":"사용 가능한 아이디 입니다.";
		mav.addObject("msg",msg);
		mav.setViewName("member/checkMsg");	
		return mav;
	}
	
	@RequestMapping("/memberMailList.do")
	public ModelAndView memberMailList(@RequestParam("com_idx")Integer com_idx,@RequestParam(value = "cp", defaultValue = "1") int cp) {
		site_logService.updateMail_Log();
		
		int totalCnt = memberService.memberMailListTotalCnt(com_idx);
		int listSize = 10;
		int pageSize = 5;
		
		String pageStr = com.ace.page.MemberMailListPage.makePage("memberMailList.do", totalCnt, listSize, pageSize, cp, com_idx);
		
		List<MemberDTO> memberList = memberService.memberMailList(com_idx, cp, listSize);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberList",memberList);
		mav.addObject("com_idx",com_idx);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("mail/memberMailList");
		return mav;
	}
	
	@RequestMapping("/memberMailListSearch.do")
	public ModelAndView memberMailListSearch(@RequestParam("com_idx")int com_idx,@RequestParam("memberKeyword")String memberKeyword,@RequestParam(value = "cp", defaultValue = "1") int cp) {
		int totalCnt = memberService.memberMailListSearchTotalCnt(com_idx, memberKeyword);
		int listSize = 10;
		int pageSize = 5;
		
		String pageStr = com.ace.page.MemberMailListSearchPage.makePage("memberMailListSearch.do", totalCnt, listSize, pageSize, cp, com_idx, memberKeyword);
		
		List<MemberDTO> memberList = memberService.memberMailListSearch(com_idx, memberKeyword, cp, listSize);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberList",memberList);
		mav.addObject("com_idx",com_idx);
		mav.addObject("memberKeyword",memberKeyword);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("mail/memberMailListSearch");
		return mav;
	}
	
}
