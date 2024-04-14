package com.ace.schedule.model;


public class ScheduleDTO {
	
	private int schedule_idx;
	private int idx;
	private int com_idx;
	private String sort;
	private String title;
	private String content;
	private String sdate;
	private int stime;
	private int etime;
	private int smna;
	private int emna;
	
	public ScheduleDTO() {
		// TODO Auto-generated constructor stub
	}

	public ScheduleDTO(int schedule_idx, int idx, int com_idx, String sort, String title, String content, String sdate,
			int stime, int etime, int smna, int emna) {
		super();
		this.schedule_idx = schedule_idx;
		this.idx = idx;
		this.com_idx = com_idx;
		this.sort = sort;
		this.title = title;
		this.content = content;
		this.sdate = sdate;
		this.stime = stime;
		this.etime = etime;
		this.smna = smna;
		this.emna = emna;
	}

	public int getSchedule_idx() {
		return schedule_idx;
	}

	public void setSchedule_idx(int schedule_idx) {
		this.schedule_idx = schedule_idx;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getCom_idx() {
		return com_idx;
	}

	public void setCom_idx(int com_idx) {
		this.com_idx = com_idx;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public int getStime() {
		return stime;
	}

	public void setStime(int stime) {
		this.stime = stime;
	}

	public int getEtime() {
		return etime;
	}

	public void setEtime(int etime) {
		this.etime = etime;
	}

	public int getSmna() {
		return smna;
	}

	public void setSmna(int smna) {
		this.smna = smna;
	}

	public int getEmna() {
		return emna;
	}

	public void setEmna(int emna) {
		this.emna = emna;
	}
	
}
