package com.ace.company.model;

public class CompanyDTO {
	private int com_idx;
	private String com_name;
	private String ceo;
	private String position;
	private String cr_num;
	private String com_img;
	private String dept;
	
	public CompanyDTO() {
		super();
	}
	
	public CompanyDTO(int com_idx, String com_name, String ceo, String position, String cr_num, String com_img,
			String dept) {
		super();
		this.com_idx = com_idx;
		this.com_name = com_name;
		this.ceo = ceo;
		this.position = position;
		this.cr_num = cr_num;
		this.com_img = com_img;
		this.dept = dept;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public int getCom_idx() {
		return com_idx;
	}
	public void setCom_idx(int com_idx) {
		this.com_idx = com_idx;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public String getCeo() {
		return ceo;
	}
	public void setCeo(String ceo) {
		this.ceo = ceo;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getCr_num() {
		return cr_num;
	}
	public void setCr_num(String cr_num) {
		this.cr_num = cr_num;
	}
	public String getCom_img() {
		return com_img;
	}
	public void setCom_img(String com_img) {
		this.com_img = com_img;
	}	
}
