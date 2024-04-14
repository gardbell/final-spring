package com.ace.client_tel.model;

public class Client_TelDTO {
	private int client_tel_idx;
	private int com_idx ;
	private String com_name;
	private String ceo;
	private String tel;
	
	public Client_TelDTO() {
		super();
	}

	public Client_TelDTO(int client_tel_idx, int com_idx, String com_name, String ceo, String tel) {
		super();
		this.client_tel_idx = client_tel_idx;
		this.com_idx = com_idx;
		this.com_name = com_name;
		this.ceo = ceo;
		this.tel = tel;
	}

	public int getClient_tel_idx() {
		return client_tel_idx;
	}

	public void setClient_tel_idx(int client_tel_idx) {
		this.client_tel_idx = client_tel_idx;
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

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
}
