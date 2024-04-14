package com.ace.work.model;

import java.sql.Date;

public class WorkDTO {
	
	private int work_idx;
	private int idx;
	private int work;
	private int work_day;
	private String work_date;
	private Date writedate;
	private int status;
	private String note;
	
	public WorkDTO() {
		super();
	}

	public WorkDTO(int work_idx, int idx, int work, int work_day, String work_date, Date writedate, int status,
			String note) {
		super();
		this.work_idx = work_idx;
		this.idx = idx;
		this.work = work;
		this.work_day = work_day;
		this.work_date = work_date;
		this.writedate = writedate;
		this.status = status;
		this.note = note;
	}

	public int getWork_idx() {
		return work_idx;
	}

	public void setWork_idx(int work_idx) {
		this.work_idx = work_idx;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getWork() {
		return work;
	}

	public void setWork(int work) {
		this.work = work;
	}

	public int getWork_day() {
		return work_day;
	}

	public void setWork_day(int work_day) {
		this.work_day = work_day;
	}

	public String getWork_date() {
		return work_date;
	}

	public void setWork_date(String work_date) {
		this.work_date = work_date;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}
	
	
	
	
}
