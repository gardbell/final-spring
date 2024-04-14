package com.ace.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ace.schedule.model.ScheduleDTO;
import com.ace.schedule.service.ScheduleService;
import com.ace.site_log.service.Site_LogService;

@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduleService;
	@Autowired
	private Site_LogService site_logService;

	@RequestMapping("/schedule.do")
	public ModelAndView schedule() {
		site_logService.updateSchedule_Log();
		
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("schedule/schedule");
		return mav;
	}
	
	@RequestMapping("/addSchedule.do")
	public ModelAndView addSchedule(ScheduleDTO dto) {
		int result=scheduleService.addSchedule(dto);
		String msg="";
		if(result==3) {
			msg="요약과 상세내용에 내용을 입력해주세요";
		}else if(result==1) {
			msg="등록성공";
		}else {
			msg="등록실패";
		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("yongJson");
		return mav;
	}
	
	@RequestMapping("/selectSchedule.do")
	public ModelAndView listSchedule(int year,int month,int sort,int idx,int lastDate) {
		Map map=new HashMap();
		map.put("year", year);
		map.put("month", month);
		map.put("sort", sort);
		map.put("idx", idx);
		map.put("lastDate", lastDate);
		Map<String,List<ScheduleDTO>> dateMap=scheduleService.listSchedule(map);
		
		ModelAndView mav= new ModelAndView();
		
		mav.addObject("map", dateMap);
		mav.setViewName("yongJson");
		return mav;
	}
	
	@RequestMapping("/delSchedule.do")
	public ModelAndView delSchedule(int schedule_idx) {
		int result=scheduleService.delSchedule(schedule_idx);
		String msg="";
		if(result==1) {
			msg="삭제성공";
		}else {
			msg="삭제실패";
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("yongJson");
		return mav;
	}
	
	@RequestMapping("/upSchedule.do")
	public ModelAndView upSchedule(ScheduleDTO dto) {
		int result=scheduleService.upSchedule(dto);
		String msg="";
		if(result==1) {
			msg="수정완료";
		}else {
			msg="수정실패";
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("yongJson");
		return mav;
	}
	
}
