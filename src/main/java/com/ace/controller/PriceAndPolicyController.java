package com.ace.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ace.member.model.MemberDTO;
import com.ace.policy.model.PolicyDTO;
import com.ace.policy.service.PolicyService;
import com.ace.price_list.model.Price_ListDTO;
import com.ace.price_list.service.Price_ListService;

import java.util.*;

@Controller
public class PriceAndPolicyController {
	@Autowired
	private Price_ListService price_listService;
	@Autowired
	private PolicyService policyService;

	@RequestMapping("/PriceAndPolicyList.do")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();

		List<Price_ListDTO> price_list = price_listService.priceList();
		List<PolicyDTO> policylist = policyService.policyList();
		mav.addObject("price_lists", price_list);
		mav.addObject("policylists", policylist);
		mav.setViewName("priceandpolicy/priceAndPolicy");
		return mav;
	}

	@RequestMapping("/priceAndPolicyUpdate.do")
	public ModelAndView updateP(Price_ListDTO price_listDto, PolicyDTO policyDto) {
			
		int result1 = price_listService.updatePrice_list(price_listDto);
		int result2 = policyService.updatePolicy(policyDto);
		String msg=null;
		if (result1 > 0 && result2 > 0) {
			msg="데이터 수정 성공!";
		}else {
			msg="데이터 업데이트 실패!";
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("gourl", "PriceAndPolicyList.do");
		mav.setViewName("priceandpolicy/priceAndPolicyMsg");
		return mav;
	}
}
