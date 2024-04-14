package com.ace.controller;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ace.company.model.CompanyDTO;
import com.ace.company.service.CompanyService;
import com.ace.member.model.MemberDTO;
import com.ace.member.service.MemberService;

@Controller
public class LoginController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private CompanyService companyService;

	@RequestMapping("/login.do")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView loginSubmit(
			@RequestParam("userid")String userid,
			@RequestParam("userpwd")String userpwd,
			HttpSession session,
			@RequestParam(value="saveid", defaultValue = "off")String saveid,
			HttpServletResponse resp) {
		int result = memberService.loginCheck(userid, userpwd);
		ModelAndView mav = new ModelAndView();
		if(result==memberService.NOT_ID||result==memberService.NOT_PWD) {
			mav.addObject("msg", "아이디 또는 비밀번호가 잘못 되었습니다.");
			mav.addObject("url", "login.do");
			mav.setViewName("member/message");
		}else if(result==memberService.LOGIN_OK){
			if(saveid.equals("on")) {
				Cookie ck = new Cookie("saveid", userid);
				ck.setMaxAge(60*60*24*30);
				resp.addCookie(ck);
			}else {
				Cookie ck = new Cookie("saveid", userid);
				ck.setMaxAge(0);//쿠키심자마자사라짐(삭제)
				resp.addCookie(ck);
			}
			
			MemberDTO dto = memberService.getUserInfo(userid);
			session.setAttribute("dto", dto);
			
			CompanyDTO cdto = companyService.getComInfo(dto.getCom_idx());
			if(cdto !=null) {
				session.setAttribute("cdto", cdto);
			}					
			
			mav.addObject("msg", dto.getName() +"님 환영합니다.");			
			mav.addObject("url", "goMain.do");
			mav.setViewName("member/message");
		}
		return mav;
	}
	
	@RequestMapping("/goMain.do")
	public String goMain() {
		return "member/goMain";
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", "안녕히 가십시오.");
		mav.addObject("url", "login.do");
		mav.setViewName("member/message");
		return mav;
	}
}
