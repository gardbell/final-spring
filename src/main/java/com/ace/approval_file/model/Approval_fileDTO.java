package com.ace.approval_file.model;

public class Approval_fileDTO {
	
	private int com_idx;
	private int ref;
	private String filename;
	
	public Approval_fileDTO() {
		// TODO Auto-generated constructor stub
	}

	public Approval_fileDTO(int com_idx, int ref, String filename) {
		super();
		this.com_idx = com_idx;
		this.ref = ref;
		this.filename = filename;
	}

	public int getCom_idx() {
		return com_idx;
	}

	public void setCom_idx(int com_idx) {
		this.com_idx = com_idx;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	

}
