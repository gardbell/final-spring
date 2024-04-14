package com.ace.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.ace.work.model.WorkDTO;
import com.ace.work.service.WorkService;

@Controller
public class WorkController {

	@Autowired
	private WorkService workService;
	
	@RequestMapping("/workList.do")
	public ModelAndView workList(@RequestParam("idx")int idx) {
		List<WorkDTO> list=workService.workList(idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists",list);
		mav.setViewName("insa/workList");
		return mav;
	}
	
	@RequestMapping("/work_Writeform.do")
	public String work_Writeform() {
		return "insa/work_WriteForm";
	}
	
	@RequestMapping("/workWrite.do")
	public ModelAndView workWrite(WorkDTO wDto) {
		int result = workService.workWrite(wDto);
		
		String msg = result> 0? "등록성공":"등록실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("insa/wMsg");
		return mav;
	}
	
		
	@RequestMapping("workPromotion.do")
	public ModelAndView workPromotion(
			@RequestParam("idx")int idx) {
		ModelAndView mav = new ModelAndView();
		int count = workService.workPromotion(idx);
		String url = "companyManager.do";
		String msg = count>0?"성공":"실패";
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("member/message");
		return mav;
	}
	
}
