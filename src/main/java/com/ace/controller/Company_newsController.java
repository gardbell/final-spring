package com.ace.controller;


import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ace.company_news.model.Company_newsDTO;
import com.ace.company_news.service.Company_newsService;
import com.ace.site_log.service.Site_LogService;


@Controller
public class Company_newsController {

@Autowired
private Company_newsService company_newsService; 
@Autowired
private Site_LogService site_logService;
	
	@RequestMapping("/company_news_List")
	public ModelAndView company_newsList(@RequestParam("com_idx")int com_idx,@RequestParam(value = "cp", defaultValue = "1") int cp) {
		site_logService.updateCompanyNews_Log();
		
		int totalCnt = company_newsService.getTotalCnt(com_idx);
		int listSize = 10;
		int pageSize = 5;
		
		String pageStr = com.ace.page.Company_news_ListPage.makePage("company_news_List.do", totalCnt, listSize, pageSize, cp, com_idx);
		
		List<Company_newsDTO> list = company_newsService.company_newsList(com_idx,cp,listSize);
		ModelAndView mav = new ModelAndView();
		mav.addObject("com_idx",com_idx);
		mav.addObject("lists",list);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("company_news/company_news_List");
		return mav;
	}
	
	@RequestMapping("/company_newsSearch")
	public ModelAndView company_newsSearch(@RequestParam("com_idx")int com_idx,@RequestParam("keyword")String keyword,@RequestParam(value = "cp", defaultValue = "1") int cp) {
		
		int totalCnt = company_newsService.SearchGetTotalCnt(keyword,com_idx);
		int listSize = 10;
		int pageSize = 5;

		String pageStr = com.ace.page.Company_newsSearchPage.makePage("company_newsSearch.do", totalCnt, listSize, pageSize, cp, keyword, com_idx);

		List<Company_newsDTO> list = company_newsService.company_newsSearch(com_idx,keyword,cp,listSize);

		ModelAndView mav = new ModelAndView();
		mav.addObject("com_idx",com_idx);
		mav.addObject("keyword",keyword);
		mav.addObject("lists",list);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("company_news/company_news_Search");

		return mav;
	}
	
	@RequestMapping(value="/company_news_Writeform" , method = RequestMethod.GET)
	public String company_news_Writeform() {
		return "company_news/company_news_Writeform";
	}
	
	@RequestMapping("/company_newsWrite")
	public ModelAndView company_newsWrite(Company_newsDTO newsDto) {

		int result = company_newsService.company_newsWrite(newsDto);
		String msg = result > 0? "게시물이 등록 되었습니다.":"게시물 등록에 실패 하였습니다.";
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("msg", msg);
		mav.setViewName("company_news/company_newsMsg");
		return mav;
	}
	@RequestMapping("/company_news_Content")
	public ModelAndView company_newsContent(@RequestParam("news_idx") Integer news_idx,@RequestParam("com_idx") Integer com_idx) {
		Company_newsDTO newsDto = company_newsService.company_newsContent(news_idx,com_idx);
		Company_newsDTO PreviousnewsDto = company_newsService.company_newsPreviousNews(news_idx,com_idx);
		Company_newsDTO NextnewsDto = company_newsService.company_newsNextNews(news_idx,com_idx);
		
		int result = company_newsService.company_newsReadnumUpdate(news_idx);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("newsDto",newsDto);
		mav.addObject("PreviousnewsDto",PreviousnewsDto);
		mav.addObject("NextnewsDto",NextnewsDto);
		mav.addObject("com_idx",com_idx);
		mav.addObject("news_idx",news_idx);
		mav.addObject("result",result);
		mav.setViewName("company_news/company_news_Content");
		return mav;
	}
	
	@RequestMapping("/company_news_SearchContent")
	public ModelAndView company_newsSearchContent(@RequestParam("news_idx") Integer news_idx,@RequestParam("com_idx") Integer com_idx,@RequestParam("keyword") String keyword) {
		Company_newsDTO newsDto = company_newsService.company_newsSearchContent(news_idx, com_idx);
		Company_newsDTO SearchPreviousDto = company_newsService.company_newsSearchPreviousNews(news_idx, com_idx, keyword);
		Company_newsDTO SearchNextDto = company_newsService.company_newsSearchNextNews(news_idx, com_idx, keyword);
		
		int result = company_newsService.company_newsReadnumUpdate(news_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("newsDto",newsDto);
		mav.addObject("SearchPreviousDto",SearchPreviousDto);
		mav.addObject("SearchNextDto",SearchNextDto);
		mav.addObject("com_idx",com_idx);
		mav.addObject("news_idx",news_idx);
		mav.addObject("result",result);
		mav.addObject("keyword",keyword);
		mav.setViewName("company_news/company_news_SearchContent");
		return mav;
	}
	
	@RequestMapping("/company_news_Delete")
	public ModelAndView company_newsDelete(@RequestParam("news_idx")int news_idx) {
		int result = company_newsService.company_newsDelete(news_idx);
		String msg = result > 0? "게시물이 삭제 되었습니다.":"게시물 삭제에 실패 하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("company_news/company_newsMsg");
		return mav;
	}
	
	@RequestMapping("/company_news_UpdateForm")
	public ModelAndView company_newsUpdateForm(@RequestParam("news_idx")int news_idx) {
		Company_newsDTO newsDto = company_newsService.company_newsUpdateForm(news_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("newsDto", newsDto);
		mav.setViewName("company_news/company_news_UpdateForm");
		return mav;
	}
	
	@RequestMapping("/company_newsUpdate")
	public ModelAndView companu_newsUpdate(Company_newsDTO newsDto) {
	int result = company_newsService.company_newsUpdate(newsDto);
	String msg = result>0?"게시글이 수정되었습니다.":"게시글 수정에 실패 하였습니다.";
	
	ModelAndView mav = new ModelAndView();
	mav.addObject("msg",msg);
	mav.setViewName("company_news/company_newsMsg");
	return mav;
	}
	
	@RequestMapping("/comNews3.do")
	   public ModelAndView comNews3(
	         @RequestParam("com_idx")int com_idx
	         ) {
	      ModelAndView mav = new ModelAndView();
	      List<Company_newsDTO> list = company_newsService.comNews3(com_idx);
	      mav.addObject("list", list);
	      mav.setViewName("member/checkNews");
	      return mav;
	   }
}








