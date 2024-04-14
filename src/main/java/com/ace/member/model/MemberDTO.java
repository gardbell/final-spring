package com.ace.member.model;

import java.sql.Date;

public class MemberDTO {
	private int idx;
	private int com_idx;
	private String name;
	private String id;
	private String pwd;
	private String email;
	private String addr;
	private String tel;
	private String hum_num;
	private String dept;
	private int rank_num;
	private int sal;
	private Date hiredate;
	private String com_name;
	private int usernum;
	private int work;
	private int work_day;
	private String work_date;
	private String note;
	private int status;
	private int bidx;
	private String sort;
	private String bdate;
	private String bnote;
	
	public MemberDTO() {
		super();
	}

	public MemberDTO(int idx, int com_idx, String name, String id, String pwd, String email, String addr, String tel,
			String hum_num, String dept, int rank_num, int sal, Date hiredate) {
		super();
		this.idx = idx;
		this.com_idx = com_idx;
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.addr = addr;
		this.tel = tel;
		this.hum_num = hum_num;
		this.dept = dept;
		this.rank_num = rank_num;
		this.sal = sal;
		this.hiredate = hiredate;
	}
	
	public MemberDTO(int idx, int com_idx, String name, String id, String pwd, String email, String addr, String tel,
			String hum_num, String dept, int rank_num, int sal, Date hiredate, String com_name, int usernum) {
		super();
		this.idx = idx;
		this.com_idx = com_idx;
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.addr = addr;
		this.tel = tel;
		this.hum_num = hum_num;
		this.dept = dept;
		this.rank_num = rank_num;
		this.sal = sal;
		this.hiredate = hiredate;
		this.com_name = com_name;
		this.usernum = usernum;
	}
	
	public MemberDTO(int idx, int com_idx, String name, String id, String pwd, String email, String addr, String tel,
			String hum_num, String dept, int rank_num, int sal, Date hiredate, String com_name, int usernum, int work,
			int work_day, String work_date, String note, int status, int bidx, String sort, String bdate,
			String bnote) {
		super();
		this.idx = idx;
		this.com_idx = com_idx;
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.addr = addr;
		this.tel = tel;
		this.hum_num = hum_num;
		this.dept = dept;
		this.rank_num = rank_num;
		this.sal = sal;
		this.hiredate = hiredate;
		this.com_name = com_name;
		this.usernum = usernum;
		this.work = work;
		this.work_day = work_day;
		this.work_date = work_date;
		this.note = note;
		this.status = status;
		this.bidx = bidx;
		this.sort = sort;
		this.bdate = bdate;
		this.bnote = bnote;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getHum_num() {
		return hum_num;
	}

	public void setHum_num(String hum_num) {
		this.hum_num = hum_num;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public int getRank_num() {
		return rank_num;
	}

	public void setRank_num(int rank_num) {
		this.rank_num = rank_num;
	}

	public int getSal() {
		return sal;
	}

	public void setSal(int sal) {
		this.sal = sal;
	}

	public Date getHiredate() {
		return hiredate;
	}

	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}
	///
	public String getCom_name() {
		return com_name;
	}

	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}

	public int getUsernum() {
		return usernum;
	}

	public void setUsernum(int usernum) {
		this.usernum = usernum;
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

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getBidx() {
		return bidx;
	}

	public void setBidx(int bidx) {
		this.bidx = bidx;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	public String getBnote() {
		return bnote;
	}

	public void setBnote(String bnote) {
		this.bnote = bnote;
	}
	
}
