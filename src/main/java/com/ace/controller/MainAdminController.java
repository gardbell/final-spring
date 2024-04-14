package com.ace.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ace.license.service.LicenseService;
import com.ace.member.service.MemberService;
import com.ace.qna.service.QnaService;

@Controller
public class MainAdminController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private QnaService qnaService;
	@Autowired
	private LicenseService licenseService;
	
	@RequestMapping("/main_admin.do")
	public ModelAndView main_admin() {
		ModelAndView mav=new ModelAndView();
		int currentUsernum=licenseService.getTotalUserNum();
		mav.addObject("currentUserNum", currentUsernum);
		int thisMonthIncome=licenseService.getThisMonthIncome();
		int lastMonthIncome=licenseService.getLastMonthIncome();
		mav.addObject("thisMonthIncome", thisMonthIncome);
		mav.addObject("lastMonthIncome", lastMonthIncome);
		int bossNum=memberService.getTotalBossNum();
		mav.addObject("bossNum", bossNum);
		int withdrawNum=memberService.getTotalWithdrawNum();
		mav.addObject("withdrawNum", withdrawNum);
		int qnaNum=qnaService.getNotAnswerQnaNum();
		mav.addObject("qnaNum", qnaNum);
		int approveNum=memberService.getTotalApproveNum();
		mav.addObject("approveNum", approveNum);
		
		mav.setViewName("main_admin");
		return mav;
	}
	
}
