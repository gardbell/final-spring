package com.ace.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ace.benefit.model.BenefitDTO;
import com.ace.benefit.service.BenefitService;


@Controller
public class BenefitController {
	
	@Autowired
	private BenefitService benefitService;
	
	@RequestMapping("/bindex")
	public String bindex() {
		return "insa/bindex";
	}
	
	@RequestMapping("/benefit")
	public String benefit() {
		return "mana/benefit";
	}
	
	@RequestMapping("/benefitList.do")
	public ModelAndView benefitList(@RequestParam("idx")int idx) {
		List<BenefitDTO> list=benefitService.benefitList(idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists",list);
		mav.setViewName("insa/benefitList");
		return mav;
	}
	
	@RequestMapping("/benefit_Writeform.do")
	public String benefit_Writeform() {
		return "insa/benefit_WriteForm";
	}
	
	@RequestMapping("/benefitWrite.do")
	public ModelAndView benefitWrite(BenefitDTO bDto) {
		int result = benefitService.benefitWrite(bDto);

		String msg = result > 0? "등록성공.":"등록실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("insa/bMsg");
		return mav;
	}
	
	@RequestMapping("benefitPromotion.do")
	public ModelAndView benefitPromotion(
			@RequestParam("idx")int idx) {
		ModelAndView mav = new ModelAndView();
		int count = benefitService.benefitPromotion(idx);
		String url = "companyManager.do";
		String msg = count>0?"성공":"실패";
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("member/message");
		return mav;
	}
	
	
	
	

	
}
