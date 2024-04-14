package com.ace.license.model;

import java.util.Date;

public class LicenseDTO {
	private int com_idx;

	private int usernum;

	private Date buydate;

	private int buycontinue;

	public LicenseDTO(int com_idx, int usernum, Date buydate, int buycontinue) {
		super();
		this.com_idx = com_idx;
		this.usernum = usernum;
		this.buydate = buydate;
		this.buycontinue = buycontinue;
	}

	public int getCom_idx() {
		return com_idx;
	}

	public void setCom_idx(int com_idx) {
		this.com_idx = com_idx;
	}

	public int getUsernum() {
		return usernum;
	}

	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}

	public Date getBuydate() {
		return buydate;
	}

	public void setBuydate(Date buydate) {
		this.buydate = buydate;
	}

	public int getBuycontinue() {
		return buycontinue;
	}

	public void setBuycontinue(int buycontinue) {
		this.buycontinue = buycontinue;
	}

}
