package com.ace.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ace.client_tel.model.Client_TelDTO;
import com.ace.client_tel.service.Client_TelService;
import com.ace.member.model.MemberDTO;
import com.ace.member.service.MemberService;
import com.ace.sales_item.model.SalesDTO;
import com.ace.sales_item.service.SalesService;
import com.ace.site_log.service.Site_LogService;

@Controller
public class ComManaController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private Client_TelService client_telService;
	@Autowired
	private SalesService salesService;
	@Autowired
	private Site_LogService site_logService;
	
	@RequestMapping("companyManager.do")
	public ModelAndView companyManager(
			@RequestParam(value = "com_idx", required = false) Integer com_idx) {
		site_logService.updateManage_Log();
		ModelAndView mav = new ModelAndView();
		if(com_idx!=null) {
		List<SalesDTO> list = salesService.salesFind(com_idx);
		mav.addObject("sales", list);
		}
		mav.setViewName("comManager/comManager");
		return mav;
	}
	
	@RequestMapping("memberList.do")
	public ModelAndView memberList(
			@RequestParam("com_idx")int com_idx) {		
		ModelAndView mav = new ModelAndView();
		List<MemberDTO> list = memberService.memberList(com_idx);		
		mav.addObject("list", list);
		mav.setViewName("comManager/memberList");
		return mav;
	}
	
	@RequestMapping("memberNot.do")
	public ModelAndView memberNot(
			@RequestParam("com_idx")int com_idx,
			@RequestParam("rank_num")int rank_num) {
		
		Map map = new HashMap();
		map.put("com_idx", com_idx);
		map.put("rank_num", rank_num);
		
		ModelAndView mav = new ModelAndView();
		List<MemberDTO> list = memberService.memberNot(map);
		mav.addObject("list", list);
		mav.setViewName("comManager/memberList");
		return mav;
	}
	@RequestMapping("memberPromotion.do")
	public ModelAndView memberPromotion(
			@RequestParam("idx")int idx) {
		ModelAndView mav = new ModelAndView();
		int count = memberService.memberPromotion(idx);
		String url = "companyManager.do";
		String msg = count>0?"성공":"실패";
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("member/message");
		return mav;
	}	
	@RequestMapping("memberUpdate.do")
	public ModelAndView memberUpdate(
			@RequestParam("id")String id) {
		ModelAndView mav = new ModelAndView();
		MemberDTO dto = memberService.getUserInfo(id);
		
		mav.addObject("mdto", dto);
		mav.setViewName("comManager/memberUpdate");
		return mav;
	}
	@RequestMapping(value="memberUpdate.do", method = RequestMethod.POST)
	public ModelAndView memberUpdateOk(
			MemberDTO dto,
			@RequestParam("id")String id) {
		dto.setId(id);
		ModelAndView mav = new ModelAndView();
		int count = memberService.update(dto);
		String url = "companyManager.do";
		String msg = count>0?"성공":"실패";
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("member/message");
		return mav;
	}
	
	@RequestMapping("clientTel.do")
	public ModelAndView clientTel(int com_idx,
			@RequestParam(value = "cp", defaultValue = "1") int cp) {
		
		int totalCnt = client_telService.getTelTotalCnt(com_idx);
		int listSize = 10;
		int pageSize = 5;
		
		String pageStr = com.ace.page.Com_memberListPage.makePage("clientTel.do", totalCnt, listSize, pageSize, cp, com_idx);
		
		ModelAndView mav = new ModelAndView();
		List<Client_TelDTO> list = client_telService.telList(com_idx, cp, listSize);		
		mav.addObject("list", list);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("comManager/clientTel");
		return mav;
	}
	@RequestMapping("clientTelWrite.do")
	public String clientTelWrite() {
		return "comManager/clientTelWrite";
	}
	@RequestMapping(value="clientTelWrite.do", method = RequestMethod.POST)
	public ModelAndView clientTelWriteOk(Client_TelDTO dto) {
		ModelAndView mav = new ModelAndView();
		int count = client_telService.insertTel(dto);
		String url = "companyManager.do";
		String msg = count>0?"성공":"실패";
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("member/message");
		return mav;
	}
	@RequestMapping("rewriteTel.do")
	public ModelAndView rewriteTel(
			@RequestParam("client_tel_idx")int client_tel_idx) {
		ModelAndView mav = new ModelAndView();
		Client_TelDTO tdto = client_telService.rewriteTel(client_tel_idx);
		
		mav.addObject("tdto", tdto);
		mav.setViewName("comManager/clientTelReWrite");
		return mav;
	}
	
	@RequestMapping(value = "rewriteTel.do", method = RequestMethod.POST)
	public ModelAndView rewriteTelOk(Client_TelDTO dto) {
		ModelAndView mav = new ModelAndView();
		int count = client_telService.rewriteTelOk(dto);
		String url = "companyManager.do";
		String msg = count>0?"성공":"실패";
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("member/message");
		return mav;
	}
	
	@RequestMapping("delTel.do")
	public ModelAndView delTel(
			@RequestParam("client_tel_idx")int client_tel_idx) {
		ModelAndView mav = new ModelAndView();
		int count = client_telService.delTel(client_tel_idx);
		String url = "companyManager.do";
		String msg = count>0?"성공":"실패";
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("member/message");
		return mav;
	}
	
	
	
	@RequestMapping("memberSal.do")
	public ModelAndView memberSal(
			@RequestParam("com_idx")int com_idx) {
		ModelAndView mav = new ModelAndView();
		List<MemberDTO> list = memberService.memberList(com_idx);
		mav.addObject("list",list);
		mav.setViewName("comManager/memberSal");
		return mav;
	}
	
	
	
	@RequestMapping("memworkList.do")
	public ModelAndView memworkList(
			@RequestParam("com_idx")int com_idx) {
		
		ModelAndView mav = new ModelAndView();
		List<MemberDTO> list = memberService.memworkList(com_idx);
		mav.addObject("list", list);
		mav.setViewName("comManager/memworkList");
		return mav;
	
	}
	
	@RequestMapping("memBenefitList.do")
	public ModelAndView memBenefitList(
			@RequestParam("com_idx")int com_idx) {
		
		ModelAndView mav = new ModelAndView();
		List<MemberDTO> list = memberService.memBenefitList(com_idx);
		mav.addObject("list", list);
		mav.setViewName("comManager/memBenefitList");
		return mav;
	}
	
	
	@RequestMapping("memberSalNot.do")
	public ModelAndView memberSalNot(
			@RequestParam("com_idx")int com_idx,
			@RequestParam("rank_num")int rank_num) {
		
		Map map = new HashMap();
		map.put("com_idx", com_idx);
		map.put("rank_num", rank_num);
		
		ModelAndView mav = new ModelAndView();
		List<MemberDTO> list = memberService.memberNot(map);
		mav.addObject("list", list);
		mav.setViewName("comManager/memberSal");
		return mav;
	}
	
	
}
