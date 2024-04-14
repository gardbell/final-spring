package com.ace.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ace.member.model.MemberDTO;
import com.ace.member.service.MemberService;

@Controller
public class WithdrawController {
	@Autowired
	private MemberService memberService;

	@RequestMapping("/withdrawList.do")
	public ModelAndView withdrawList(@RequestParam(value = "cp", defaultValue = "1") int cp) {
		int totalCnt = memberService.getTotalWithdrawCnt();
		int listSize = 5;
		int pageSize = 5;
		List<MemberDTO> withdrawList = memberService.withdrawList(cp, listSize);
		String pageStr = com.ace.page.PageMaker.makePage("withdrawList.do", totalCnt, listSize, pageSize, cp);

		ModelAndView mav = new ModelAndView();
		mav.addObject("withdrawLists", withdrawList);
		mav.addObject("pageStr", pageStr);

		mav.setViewName("withdraw/withdrawList");
		return mav;
	}

	@RequestMapping("/withdrawCompany.do")
	public ModelAndView withdrawCompany() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("withdraw/withdrawCompany");
		return mav;
	}

	@RequestMapping("/submitWithdraw.do")
	public ModelAndView submitWithdraw(@RequestParam("com_idx") int com_idx) {
		ModelAndView mav = new ModelAndView();
		int result = memberService.submitWithdraw(com_idx);
		String msg = result > 0 ? "기업탈퇴 신청 완료" : "기업탈퇴 신청 실패";
		mav.addObject("msg", msg);
		mav.addObject("gourl", "goMain.do");
		mav.setViewName("withdraw/withdrawMsg");
		return mav;
	}

	@RequestMapping("/acceptWithdraw.do")
	public ModelAndView acceptWithdraw(@RequestParam("com_idx") int com_idx) {
		ModelAndView mav = new ModelAndView();
		int result = memberService.delCompany(com_idx);
		int result2 = memberService.delWithdraw(com_idx);
		memberService.updateRankNum0(com_idx);
		String msg = (result > 0 && result2 > 0) ? "기업탈퇴 승인 완료" : "기업탈퇴 승인 실패";
		mav.addObject("msg", msg);
		mav.addObject("gourl", "withdrawList.do");
		mav.setViewName("withdraw/withdrawMsg");
		return mav;
	}
}
