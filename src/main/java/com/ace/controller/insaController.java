package com.ace.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ace.member.model.MemberDTO;
import com.ace.member.service.MemberService;
import com.ace.site_log.service.Site_LogService;


@Controller
public class insaController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private Site_LogService site_logService;
	
	@RequestMapping("insa.do")
	public String insa() {
		site_logService.updateHR_Log();
		return "insa/insa";
	}
	
	@RequestMapping("/insaUpdate.do")
	public ModelAndView memberUpdate(
			@RequestParam("id")String id) {
		ModelAndView mav =new ModelAndView();
		MemberDTO dto=memberService.getUserInfo(id);
		mav.addObject("mdto", dto);
		mav.setViewName("insa/insaUpdate");
		return mav;
	}
	
	@RequestMapping("/update.do")
	public ModelAndView update(MemberDTO dto) {
		int result = memberService.update(dto);
		String msg = result>0?"회원정보 수정완료.":"회원정보 수정실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("insa/iMsg");
		return mav;
	}
	
	
	
	@RequestMapping("/memberDel.do")
	public String memberDel() {
		return "insa/memberDel";
	}
	
	
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public ModelAndView delete(
			@RequestParam("pwd")String pwd,
			@RequestParam("id")String id){
		Map map = new HashMap();
		map.put("pwd", pwd);
		map.put("id", id);
		
		
		int result = memberService.delete(map);
		String msg = result>0?"회원탈퇴 완료":"비밀번호를 다시확인하세요";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("insa/byeMsg");
		return mav;
	}
}	
