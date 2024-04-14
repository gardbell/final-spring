package com.ace.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ace.company_event.model.Company_eventDTO;
import com.ace.company_event.service.Company_eventService;
import com.ace.site_log.service.Site_LogService;

@Controller
public class Company_eventController {
	
	@Autowired
	private Company_eventService company_eventService;
	@Autowired
	private Site_LogService site_logService;
	
	@RequestMapping("/company_event_List")
	public ModelAndView company_eventList(@RequestParam("com_idx")int com_idx,@RequestParam(value = "cp", defaultValue = "1") int cp) {
	
		site_logService.updateCompanyEvent_Log();
		int totalCnt = company_eventService.getEventTotalCnt(com_idx);
		int listSize = 10;
		int pageSize = 5;
		
		String pageStr = com.ace.page.Company_eventListPage.makePage("company_event_List.do", totalCnt, listSize, pageSize, cp, com_idx);
		
		List<Company_eventDTO> eventList = company_eventService.company_eventList(com_idx, cp, listSize);
		ModelAndView mav = new ModelAndView();
		mav.addObject("com_idx",com_idx);
		mav.addObject("eventList",eventList);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("company_event/company_event_List");
		return mav;
	}
	
	@RequestMapping("/company_eventReWriteList")
	public ModelAndView company_eventReWriteList(@RequestParam("com_idx")int com_idx,@RequestParam("comment_ref")int comment_ref,@RequestParam(value = "cp", defaultValue = "1") int cp) {
		int totalCnt = company_eventService.eventReListTotalCnt(com_idx, comment_ref);
		int listSize = 10;
		int pageSize = 5;
		
		String pageStr = com.ace.page.Company_eventReListPage.makePage("company_eventReWriteList.do", totalCnt, listSize, pageSize, cp, com_idx, comment_ref);
		
		List<Company_eventDTO> list = company_eventService.company_eventReWriteList(com_idx, comment_ref, cp, listSize);
		ModelAndView mav =new ModelAndView();
		mav.addObject("com_idx",com_idx);
		mav.addObject("comment_ref",comment_ref);
		mav.addObject("list",list);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("yongJson");
		return mav;
	}
	
	@RequestMapping("/company_event_Writeform")
	public String company_event_Writeform() {
		return "company_event/company_event_WriteForm";
	}

	
	@RequestMapping("/company_eventWrite")
	public ModelAndView company_eventWrite(Company_eventDTO eventDto) {
		int result = company_eventService.company_eventWrite(eventDto);

		String msg = result > 0? "게시물이 등록 되었습니다.":"게시물 등록에 실패 하였습니다.";
		ModelAndView mav = new ModelAndView();

		mav.addObject("msg", msg);
		mav.setViewName("company_event/company_eventMsg");
		return mav;
	}
	
	@RequestMapping("/company_eventReWrite")
	public ModelAndView company_eventReWrite(Company_eventDTO eventDto) {
		int result = company_eventService.company_eventReWrite(eventDto);
		String msg = result > 0? "댓글이 등록 되었습니다.":"댓글 등록에 실패 하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("yongJson");
		return mav;
	}
	
	@RequestMapping("/company_eventNextReWrite")
	public ModelAndView company_eventNextReWrite(Company_eventDTO eventDto) {
		int result = company_eventService.company_eventNextReWrite(eventDto);
		String msg = result > 0? "댓글이 등록 되었습니다.":"댓글 등록에 실패 하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("yongJson");
		return mav;
	}
	
	@RequestMapping("/company_event_Content")
	public ModelAndView company_eventContent(@RequestParam("event_idx") Integer event_idx,@RequestParam("com_idx") Integer com_idx) {
		Company_eventDTO eventDto = company_eventService.company_eventContent(event_idx,com_idx);
		
		Company_eventDTO nexteventDto = company_eventService.company_eventNextEvent(event_idx, com_idx);
		
		Company_eventDTO previouseventDto = company_eventService.company_eventPreviousEvent(event_idx, com_idx);
		
		int result = company_eventService.company_eventReadnumUpdate(event_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("nexteventDto",nexteventDto);
		mav.addObject("previouseventDto",previouseventDto);
		mav.addObject("eventDto",eventDto);
		mav.addObject("com_idx",com_idx);
		mav.addObject("event_idx",event_idx);
		mav.addObject("result",result);
		mav.setViewName("company_event/company_event_Content");
		return mav;
	}
	
	@RequestMapping("/company_event_SearchContent")
	public ModelAndView company_eventSearchContnet(@RequestParam("event_idx") Integer event_idx,@RequestParam("com_idx") Integer com_idx,@RequestParam("eventKeyword") String eventKeyword) {
		Company_eventDTO eventDto = company_eventService.company_eventSearchContnet(event_idx, com_idx);
		Company_eventDTO SearchPreviouseventDto = company_eventService.company_eventSearchPreviousEvent(event_idx, com_idx,eventKeyword);
		Company_eventDTO SearchNexteventDto = company_eventService.company_eventSearchNextEvent(event_idx, com_idx, eventKeyword);
		int result = company_eventService.company_eventReadnumUpdate(event_idx);
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("SearchPreviouseventDto",SearchPreviouseventDto);
		mav.addObject("SearchNexteventDto", SearchNexteventDto);
		mav.addObject("eventDto",eventDto);
		mav.addObject("com_idx",com_idx);
		mav.addObject("eventKeyword",eventKeyword);
		mav.addObject("event_idx",event_idx);
		mav.addObject("result",result);
		mav.setViewName("company_event/company_event_SearchContent");
		return mav;
	}
	

	
	@RequestMapping("/company_eventSearch")
	public ModelAndView company_eventSearch(@RequestParam("com_idx")int com_idx,@RequestParam("eventKeyword")String eventKeyword,@RequestParam(value = "cp", defaultValue = "1") int cp) {
		int totalCnt = company_eventService.searchGetEventTotalCnt(eventKeyword, com_idx);
		int listSize = 10;
		int pageSize = 5;
		String pageStr = com.ace.page.Company_eventSearchPage.makePage("company_eventSearch.do", totalCnt, listSize, pageSize, cp, eventKeyword, com_idx);
		List<Company_eventDTO> eventList = company_eventService.company_eventSearch(com_idx, eventKeyword, cp, listSize);
		ModelAndView mav = new ModelAndView();
		mav.addObject("com_idx",com_idx);
		mav.addObject("eventKeyword",eventKeyword);
		mav.addObject("eventList",eventList);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("company_event/company_event_Search");
		return mav;
	}
	
	@RequestMapping("/company_event_Delete")
	public ModelAndView company_eventDelete(@RequestParam("event_idx")int event_idx) {
		int result = company_eventService.company_eventDelete(event_idx);
		String msg = result > 0? "게시물이 삭제 되었습니다.":"게시물 삭제에 실패 하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("company_event/company_eventMsg");
		return mav;
	}
	
	@RequestMapping("/company_event_UpdateForm")
	public ModelAndView company_eventUpdateForm(@RequestParam("event_idx")int event_idx) {
		Company_eventDTO eventDto = company_eventService.company_eventUpdateForm(event_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("event_idx", event_idx);
		mav.addObject("eventDto", eventDto);
		mav.setViewName("company_event/company_event_UpdateForm");
		return mav;
	}
	
	@RequestMapping("/company_eventUpdate")
	public ModelAndView company_eventUpdate(Company_eventDTO eventDto) {
		int result = company_eventService.company_eventUpdate(eventDto);
		System.out.println(result);
		String msg = result>0?"게시글이 수정되었습니다.":"게시글 수정에 실패 하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("company_event/company_eventMsg");
		return mav;
	}

	   @RequestMapping("/comEvent3.do")
	   public ModelAndView comEvent3(
	         @RequestParam("com_idx")int com_idx
	         ) {
	      List<Company_eventDTO> list = company_eventService.comEvent3(com_idx);
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("list", list);
	      mav.setViewName("member/checkEvent");
	      return mav;
	   }
}









