package com.ace.company_news.model;

import java.util.*;


import org.mybatis.spring.SqlSessionTemplate;

public class Company_newsDAOImple implements Company_newsDAO {

	private SqlSessionTemplate sqlmap;
	
	public Company_newsDAOImple(SqlSessionTemplate sqlmap) {
		super();
		this.sqlmap = sqlmap;
	}
	
	@Override
	public int company_newsWrite(Company_newsDTO newsDto) {
		int count = sqlmap.insert("company_newsWrite" , newsDto);
		return count;
	}
	
	@Override
	public List<Company_newsDTO> company_newsList(Map map) {
		List<Company_newsDTO> list = sqlmap.selectList("company_newsList",map);
		return list;
	}
	
	@Override
	public List<Company_newsDTO> company_newsSearch(Map map) {
		List<Company_newsDTO> list = sqlmap.selectList("company_newsSearch",map);
		return list;
	}
	
	@Override
	public int SearchGetTotalCnt(Map map) {
		int count = sqlmap.selectOne("SearchTotalCnt",map);
		return count;
	}
	
	@Override
	public int getTotalCnt(int news_idx) {
		int count = sqlmap.selectOne("totalCnt",news_idx);
		return count;
	}
	
	@Override
	public Company_newsDTO company_newsContent(Map map) {
		Company_newsDTO newsDto = sqlmap.selectOne("company_newsContent",map);
		return newsDto;
	}
	
	@Override
	public Company_newsDTO company_newsSearchContent(Map map) {
		Company_newsDTO newsDto = sqlmap.selectOne("company_newsSearchContent",map);
		return newsDto;
	}
	
	@Override
	public int company_newsDelete(int news_idx) {
		int count = sqlmap.delete("company_newsDelete",news_idx);
		return count;
	}
	
	@Override
	public Company_newsDTO company_newsUpdateForm(int news_idx) {
		Company_newsDTO newsDto = sqlmap.selectOne("company_newsUpdateForm",news_idx);
		return newsDto;
	}
	
	@Override
	public int company_newsUpdate(Company_newsDTO newsDto) {
		int count = sqlmap.update("company_newsUpdate",newsDto);
		return count;
	}
	
	@Override
	public int company_newsReadnumUpdate(int news_idx) {
		int count = sqlmap.update("company_newsReadnumUpdate",news_idx);
		return count;
	} 
	
	@Override
	public Company_newsDTO company_newsPreviousNews(Map map) {
		Company_newsDTO newsDto = sqlmap.selectOne("company_newsPreviousNews",map);
		return newsDto;
	}
	
	@Override
	public Company_newsDTO company_newsSearchPreviousNews(Map map) {
		Company_newsDTO newsDto = sqlmap.selectOne("company_newsSearchPreviousNews",map);
		return newsDto;
	}
	
	@Override
	public Company_newsDTO company_newsNextNews(Map map) {
		Company_newsDTO newsDto = sqlmap.selectOne("company_newsNextNews",map);
		return newsDto;
	}
	
	@Override
	public Company_newsDTO company_newsSearchNextNews(Map map) {
		Company_newsDTO newsDto = sqlmap.selectOne("company_newsSearchNextNews",map);
		return newsDto;
	}
	
	@Override
	   public List<Company_newsDTO> comNews3(int com_idx) {
	      List<Company_newsDTO> list = sqlmap.selectList("comNews3",com_idx);
	      return list;
	   }
}







