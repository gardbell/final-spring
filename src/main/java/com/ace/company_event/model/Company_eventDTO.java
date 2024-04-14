package com.ace.company_event.model;

import java.sql.*;

public class Company_eventDTO {
	private int com_idx ;
	private int event_idx;
	private String event_title;
	private String event_content;
	private Date event_writedate;
	private int event_readnum;
	private Date event_period;
	private int comment_ref;
	private int comment_level;
	private int comment_sunbun;
	private String event_addr;
	private String event_writer;
	
	public Company_eventDTO() {
		super();
	}

	public Company_eventDTO(int com_idx, int event_idx, String event_title, String event_content, Date event_writedate,
			int event_readnum, Date event_period, int comment_ref, int comment_level, int comment_sunbun,
			String event_addr, String event_writer) {
		super();
		this.com_idx = com_idx;
		this.event_idx = event_idx;
		this.event_title = event_title;
		this.event_content = event_content;
		this.event_writedate = event_writedate;
		this.event_readnum = event_readnum;
		this.event_period = event_period;
		this.comment_ref = comment_ref;
		this.comment_level = comment_level;
		this.comment_sunbun = comment_sunbun;
		this.event_addr = event_addr;
		this.event_writer = event_writer;
	}

	public int getCom_idx() {
		return com_idx;
	}

	public void setCom_idx(int com_idx) {
		this.com_idx = com_idx;
	}

	public int getEvent_idx() {
		return event_idx;
	}

	public void setEvent_idx(int event_idx) {
		this.event_idx = event_idx;
	}

	public String getEvent_title() {
		return event_title;
	}

	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}

	public String getEvent_content() {
		return event_content;
	}

	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}

	public Date getEvent_writedate() {
		return event_writedate;
	}

	public void setEvent_writedate(Date event_writedate) {
		this.event_writedate = event_writedate;
	}

	public int getEvent_readnum() {
		return event_readnum;
	}

	public void setEvent_readnum(int event_readnum) {
		this.event_readnum = event_readnum;
	}

	public Date getEvent_period() {
		return event_period;
	}

	public void setEvent_period(Date event_period) {
		this.event_period = event_period;
	}

	public int getComment_ref() {
		return comment_ref;
	}

	public void setComment_ref(int comment_ref) {
		this.comment_ref = comment_ref;
	}

	public int getComment_level() {
		return comment_level;
	}

	public void setComment_level(int comment_level) {
		this.comment_level = comment_level;
	}

	public int getComment_sunbun() {
		return comment_sunbun;
	}

	public void setComment_sunbun(int comment_sunbun) {
		this.comment_sunbun = comment_sunbun;
	}

	public String getEvent_addr() {
		return event_addr;
	}

	public void setEvent_addr(String event_addr) {
		this.event_addr = event_addr;
	}

	public String getEvent_writer() {
		return event_writer;
	}

	public void setEvent_writer(String event_writer) {
		this.event_writer = event_writer;
	}
}
