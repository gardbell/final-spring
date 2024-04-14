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
public class BossController {
	@Autowired
	private MemberService memberService;

	
	@RequestMapping("/bossList.do")
	public ModelAndView bossList(@RequestParam(value = "cp", defaultValue = "1") int cp) {
		int totalCnt = memberService.getTotalBossCnt();
		int listSize = 5;
		int pageSize = 5;
		List<MemberDTO> bossList = memberService.bossList(cp, listSize);
		String pageStr = com.ace.page.PageMaker.makePage("bossList.do", totalCnt, listSize, pageSize, cp);

		ModelAndView mav = new ModelAndView();
		mav.addObject("bossLists", bossList);
		mav.addObject("pageStr", pageStr);

		mav.setViewName("boss/bossList");
		
		return mav;
	}

	@RequestMapping("/bossListSearch.do")
	public ModelAndView bossListSearch(@RequestParam(value = "cp", defaultValue = "1") int cp,
			@RequestParam("keyword") String keyword) {
		int listSize = 5;
		int pageSize = 5;
		List<MemberDTO> bossList = memberService.bossSearchList(cp, listSize, keyword);
		int totalCnt = memberService.getTotalBossSearchCnt(keyword);

		String pageStr = com.ace.page.PageMaker.makePage("bossSearchList.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav = new ModelAndView();
		mav.addObject("bossLists", bossList);
		mav.addObject("pageStr", pageStr);

		mav.setViewName("boss/bossList");
		return mav;

	}
}
