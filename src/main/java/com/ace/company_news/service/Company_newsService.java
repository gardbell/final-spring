package com.ace.company_news.service;

import java.util.*;

import com.ace.company_news.model.Company_newsDTO;

public interface Company_newsService {

	public int company_newsWrite(Company_newsDTO newsDto);
	public List<Company_newsDTO> company_newsList(int com_idx,int cp,int Ls);
	public int getTotalCnt(int com_idx);
	public Company_newsDTO company_newsContent(int news_idx,int com_idx);
	public Company_newsDTO company_newsSearchContent(int news_idx,int com_idx);
	public int company_newsDelete(int news_idx);
	public Company_newsDTO company_newsUpdateForm(int news_idx);
	public int company_newsUpdate(Company_newsDTO newsDto);
	public int company_newsReadnumUpdate(int news_idx );
	public List<Company_newsDTO> company_newsSearch(int com_idx,String keyword,int cp,int Ls);
	public int SearchGetTotalCnt(String keyword,int com_idx);
	public Company_newsDTO company_newsPreviousNews(int news_idx,int com_idx);
	public Company_newsDTO company_newsSearchPreviousNews(int news_idx,int com_idx,String keyword);
	public Company_newsDTO company_newsNextNews(int news_idx,int com_idx);
	public Company_newsDTO company_newsSearchNextNews(int news_idx,int com_idx,String keyword);
	public List<Company_newsDTO> comNews3(int com_idx);
	
}
