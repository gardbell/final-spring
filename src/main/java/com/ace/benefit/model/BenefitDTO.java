package com.ace.benefit.model;

import java.sql.*;

public class BenefitDTO {

	private int bidx;
	private int idx;
	private String sort;
	private Date writedate;
	private String bdate;
	private int status;
	private String bnote;
	
	public BenefitDTO() {
		super();
	}

	public BenefitDTO(int bidx, int idx, String sort, Date writedate, String bdate, int status, String bnote) {
		super();
		this.bidx = bidx;
		this.idx = idx;
		this.sort = sort;
		this.writedate = writedate;
		this.bdate = bdate;
		this.status = status;
		this.bnote = bnote;
	}

	public int getBidx() {
		return bidx;
	}

	public void setBidx(int bidx) {
		this.bidx = bidx;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getBnote() {
		return bnote;
	}

	public void setBnote(String bnote) {
		this.bnote = bnote;
	}
	
	
}
