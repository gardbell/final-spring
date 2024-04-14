package com.ace.controller;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ace.member.model.MemberDTO;
import com.ace.member.service.MemberService;
import com.ace.qna.model.QnaDTO;
@Controller
public class ApproveController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/approveList.do")
	public ModelAndView qnaList() {
		
		List<MemberDTO> approveList = memberService.approveList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("approveLists", approveList);
		
		mav.setViewName("Approve/approveList");
		return mav;
	}
	@RequestMapping("/approveMember.do")
	public ModelAndView deleteQna(@RequestParam(name = "selectedIdxs", required = false) String selectedIdxs) {
		
		ModelAndView mav = new ModelAndView();
	    
	    if (selectedIdxs == null || selectedIdxs.isEmpty()) {
	        // 선택된 항목이 없는 경우 처리
	        mav.addObject("msg", "선택된 항목 승인 성공!");
	    } else {
	        // 선택된 항목이 있는 경우 처리
	        List<Integer> idxs = Arrays.stream(selectedIdxs.split(","))
	                                    .map(Integer::valueOf)
	                                    .collect(Collectors.toList());

	        int result = memberService.approveMember(idxs);
	        String msg = (result > 0) ? "선택된 항목 승인 성공!" : "선택된 항목 승인 실패";
	        mav.addObject("msg", msg);
	    }

	    mav.addObject("gourl", "approveList.do");
	    mav.setViewName("Approve/approveMsg");
	    return mav;
	}
}
