package com.ace.approval.model;

import java.util.Date;

public class ApprovalDTO {
	
	private int com_idx;
	private int ref;
	private String title;
	private String content;
	private Date writedate;
	private int writer;
	private String name;
	private int approver;
	private int approval_check;
	
	public ApprovalDTO() {
		// TODO Auto-generated constructor stub
	}

	public ApprovalDTO(int com_idx, int ref, String title, String content, Date writedate, int writer, String name,
			int approver, int approval_check) {
		super();
		this.com_idx = com_idx;
		this.ref = ref;
		this.title = title;
		this.content = content;
		this.writedate = writedate;
		this.writer = writer;
		this.name = name;
		this.approver = approver;
		this.approval_check = approval_check;
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

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	public int getWriter() {
		return writer;
	}

	public void setWriter(int writer) {
		this.writer = writer;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getApprover() {
		return approver;
	}

	public void setApprover(int approver) {
		this.approver = approver;
	}

	public int getApproval_check() {
		return approval_check;
	}

	public void setApproval_check(int approval_check) {
		this.approval_check = approval_check;
	}
	
	

}
