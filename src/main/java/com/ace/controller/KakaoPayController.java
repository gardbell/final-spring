package com.ace.controller;

import com.ace.license.service.LicenseService;
import com.ace.pay.service.PayService;
import com.ace.price_list.model.Price_ListDTO;
import com.ace.price_list.service.Price_ListService;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class KakaoPayController {
	@Autowired
	private Price_ListService price_listService;

	@Autowired
	private PayService payService;

	@Autowired
	LicenseService licenseService;

	@RequestMapping("/kakaoPay.do")
	public ModelAndView kakaoPay(Integer check) {
		List<Price_ListDTO> list = this.price_listService.priceList();
		ModelAndView mav = new ModelAndView("kakaoPay/kakaoPay");
		if(check!=null) {
			mav.addObject("check", check);
		}
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping("/goPay.do")
  public ModelAndView goPay(int com_idx, int price_sort, int usernum) {
    Map<String, Integer> map1 = new HashMap<>();
    map1.put("com_idx", Integer.valueOf(com_idx));
    map1.put("price_sort", Integer.valueOf(price_sort));
    map1.put("usernum", Integer.valueOf(usernum));
    int result1 = this.payService.addPay(map1);
    Map<Object, Object> map2 = new HashMap<>();
    map2.put("com_idx", Integer.valueOf(com_idx));
    map2.put("usernum", Integer.valueOf(usernum));
    Date now = new Date();
    int nowMon = now.getMonth();
    now.setMonth(nowMon + 1);
    map2.put("buydate", now);
    int result2 = this.licenseService.addLicense(map2);
    ModelAndView mav = new ModelAndView();
    String msg = "";
    if (result1 > 0 && result2 > 0) {
      mav.setViewName("member/goMain");
    } else if (result1 <= 0 && result2 > 0) {
      msg = "구매등록오류";
      mav.addObject("msg", msg);
      mav.setViewName("kakaoPay/kakaoPay");
    } else if (result1 > 0 && result2 <= 0) {
      msg = "라이센스등록오류";
      mav.addObject("msg", msg);
      mav.setViewName("kakaoPay/kakaoPay");
    } else {
      msg = "알수없는오류 고객센터에 문의해주세요.";
      mav.addObject("msg", msg);
      mav.setViewName("kakaoPay/kakaoPay");
    } 
    return mav;
  }

	@RequestMapping("/delLicense.do")
  public ModelAndView delLicense(int com_idx) {
    int result = this.licenseService.delLicense(com_idx);
    String msg = "";
    if (result > 0) {
      msg = "라이센스가 만료되었습니다.";
    } else {
      msg = "가능";
    } 
    ModelAndView mav = new ModelAndView();
    mav.addObject("msg", msg);
    mav.setViewName("yongJson");
    return mav;
  }

	@RequestMapping("/checkLicense.do")
	public ModelAndView checkLicense(int com_idx) {
		int result = this.licenseService.checkLicense(com_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", Integer.valueOf(result));
		mav.setViewName("yongJson");
		return mav;
	}

	@RequestMapping("/checkCEO.do")
	public ModelAndView checkCEO(int com_idx) {
		Integer ceoidx = this.licenseService.checkCEO(com_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("ceoidx", ceoidx);
		mav.setViewName("yongJson");
		return mav;
	}
	
	@RequestMapping("/stopLicense.do")
	public ModelAndView stopLicense(int com_idx) {
		int result=licenseService.stopLicense(com_idx);
		String msg="";
		if(result>0) {
			msg="중단 성공 서비스 이용기간은 다음달 결제일 까지입니다.";
		}else {
			msg="알수없는 오류 고객센터에 문의해주세요.";
		}
		ModelAndView mav=new ModelAndView("yongJson");
		mav.addObject("msg", msg);
		return mav;
	}
}
