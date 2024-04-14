package com.ace.company_news.model;

import java.sql.*;

import org.springframework.web.multipart.MultipartFile;

public class Company_newsDTO {
	private int com_idx ;
	private int news_idx;
	private String news_writer;
	private String news_title;
	private String news_content;
	private Date news_writedate;
	private int news_readnum;

	
	public Company_newsDTO() {
		super();
	}


	public Company_newsDTO(int com_idx, int news_idx, String news_writer, String news_title, String news_content,
			Date news_writedate, int news_readnum) {
		super();
		this.com_idx = com_idx;
		this.news_idx = news_idx;
		this.news_writer = news_writer;
		this.news_title = news_title;
		this.news_content = news_content;
		this.news_writedate = news_writedate;
		this.news_readnum = news_readnum;
	}


	public int getCom_idx() {
		return com_idx;
	}


	public void setCom_idx(int com_idx) {
		this.com_idx = com_idx;
	}


	public int getNews_idx() {
		return news_idx;
	}


	public void setNews_idx(int news_idx) {
		this.news_idx = news_idx;
	}


	public String getNews_writer() {
		return news_writer;
	}


	public void setNews_writer(String news_writer) {
		this.news_writer = news_writer;
	}


	public String getNews_title() {
		return news_title;
	}


	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}


	public String getNews_content() {
		return news_content;
	}


	public void setNews_content(String news_content) {
		this.news_content = news_content;
	}


	public Date getNews_writedate() {
		return news_writedate;
	}


	public void setNews_writedate(Date news_writedate) {
		this.news_writedate = news_writedate;
	}


	public int getNews_readnum() {
		return news_readnum;
	}


	public void setNews_readnum(int news_readnum) {
		this.news_readnum = news_readnum;
	}
	

	
	
}
