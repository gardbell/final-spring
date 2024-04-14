package com.ace.company_news.model;

import java.util.*;

public interface Company_newsDAO {

	public int company_newsWrite(Company_newsDTO newsDto);
	public List<Company_newsDTO> company_newsList(Map map);
	public int getTotalCnt(int news_idx);
	public Company_newsDTO company_newsContent(Map map);
	public Company_newsDTO company_newsSearchContent(Map map);
	public int company_newsDelete(int news_idx);
	public Company_newsDTO company_newsUpdateForm(int news_idx);
	public int company_newsUpdate(Company_newsDTO newsDto);
	public int company_newsReadnumUpdate(int news_idx );
	public List<Company_newsDTO> company_newsSearch(Map map);
	public int SearchGetTotalCnt(Map map);
	public Company_newsDTO company_newsPreviousNews(Map map);
	public Company_newsDTO company_newsSearchPreviousNews(Map map);
	public Company_newsDTO company_newsNextNews(Map map);
	public Company_newsDTO company_newsSearchNextNews(Map map);
	public List<Company_newsDTO> comNews3(int com_idx);
}
