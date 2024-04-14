package com.ace.company_news.service;

import java.util.*;

import com.ace.company_news.model.Company_newsDAO;
import com.ace.company_news.model.Company_newsDTO;

public class Company_newsServiceImple implements Company_newsService {

	private Company_newsDAO company_newsDao;



	public Company_newsDAO getCompany_newsDao() {
		return company_newsDao;
	}



	public void setCompany_newsDao(Company_newsDAO company_newsDao) {
		this.company_newsDao = company_newsDao;
	}



	@Override
	public int company_newsWrite(Company_newsDTO newsDto) {
		int count = company_newsDao.company_newsWrite(newsDto);
		return count;
	}
	
	@Override
	public List<Company_newsDTO> company_newsList(int com_idx,int cp,int ls) {
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		Map map = new HashMap();
		map.put("com_idx", com_idx);
		map.put("start", start);
		map.put("end", end);
		
		List<Company_newsDTO> list = company_newsDao.company_newsList(map);
		return list;
	}
	
	@Override
	public List<Company_newsDTO> company_newsSearch(int com_idx,String keyword,int cp,int ls) {

		int start = (cp-1)*ls+1;
		int end = cp*ls;
		Map map = new HashMap();
		map.put("com_idx", com_idx);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		List<Company_newsDTO> list = company_newsDao.company_newsSearch(map);
		return list;
	}
	
	@Override
	public int SearchGetTotalCnt(String keyword,int com_idx) {
		Map map = new HashMap();
		map.put("com_idx", com_idx);
		map.put("keyword", keyword);
		int count = company_newsDao.SearchGetTotalCnt(map);
		return count;
}
	
	@Override
	public int getTotalCnt(int com_idx) {
		int count = company_newsDao.getTotalCnt(com_idx);
		count = count == 0?1:count;
		return count;
	}
	
	@Override
	public Company_newsDTO company_newsContent(int news_idx,int com_idx) {
		Map map = new HashMap();
		map.put("com_idx", com_idx);
		map.put("news_idx", news_idx);
		Company_newsDTO newsDto = company_newsDao.company_newsContent(map);
		return newsDto;	
	}
	
	@Override
	public Company_newsDTO company_newsSearchContent(int news_idx, int com_idx) {
		Map map = new HashMap();
		map.put("com_idx", com_idx);
		map.put("news_idx", news_idx);
		
		Company_newsDTO newsDto = company_newsDao.company_newsSearchContent(map);
		return newsDto;
	}
	
	@Override
	public int company_newsDelete(int news_idx) {
		int count = company_newsDao.company_newsDelete(news_idx);
		return count;
	}
	
	@Override
	public Company_newsDTO company_newsUpdateForm(int news_idx) {
		Company_newsDTO newsDto = company_newsDao.company_newsUpdateForm(news_idx);
		return newsDto;
	}
	
	@Override
	public int company_newsUpdate(Company_newsDTO newsDto) {
		int count = company_newsDao.company_newsUpdate(newsDto);
		return count;
	}
	
	@Override
	public int company_newsReadnumUpdate(int news_idx) {
		int count = company_newsDao.company_newsReadnumUpdate(news_idx);
		return count;
	}
	
	@Override
	public Company_newsDTO company_newsPreviousNews(int news_idx,int com_idx) {
		Map map = new HashMap();
		map.put("news_idx", news_idx);
		map.put("com_idx", com_idx);
		
		Company_newsDTO newsDto = company_newsDao.company_newsPreviousNews(map);
		return newsDto;
	}
	
	@Override
	public Company_newsDTO company_newsSearchPreviousNews(int news_idx, int com_idx, String keyword) {
		Map map = new HashMap();
		map.put("news_idx", news_idx);
		map.put("com_idx", com_idx);
		map.put("keyword", keyword);
		Company_newsDTO newsDto = company_newsDao.company_newsSearchPreviousNews(map);
		
		return newsDto;
	}

	@Override
	public Company_newsDTO company_newsNextNews(int news_idx,int com_idx) {
		Map map = new HashMap();
		map.put("news_idx", news_idx);
		map.put("com_idx", com_idx);
		Company_newsDTO newsDto = company_newsDao.company_newsNextNews(map);
		return newsDto;
	}
	
	@Override
	public Company_newsDTO company_newsSearchNextNews(int news_idx, int com_idx, String keyword) {
		Map map = new HashMap();
		map.put("news_idx", news_idx);
		map.put("com_idx", com_idx);
		map.put("keyword", keyword);
		Company_newsDTO newsDto = company_newsDao.company_newsSearchNextNews(map);
		return newsDto;
	}
	
	@Override
	   public List<Company_newsDTO> comNews3(int com_idx) {
	      List<Company_newsDTO> list = company_newsDao.comNews3(com_idx);
	      return list;
	   }
}






