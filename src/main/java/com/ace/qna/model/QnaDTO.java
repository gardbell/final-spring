package com.ace.qna.model;

public class QnaDTO {

	private int qna_idx;
	private String qna_category;
	private String qna_title;
	private String qna_content;
	private int qna_answer;
	private int qna_writer;
	private int qna_ref;
	private int qna_level;
	private int qna_sunbun;

	public QnaDTO() {
		super();
	}

	public QnaDTO(int qna_idx, String qna_category, String qna_title, String qna_content, int qna_answer,
			int qna_writer, int qna_ref, int qna_level, int qna_sunbun) {
		super();
		this.qna_idx = qna_idx;
		this.qna_category = qna_category;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_answer = qna_answer;
		this.qna_writer = qna_writer;
		this.qna_ref = qna_ref;
		this.qna_level = qna_level;
		this.qna_sunbun = qna_sunbun;
	}

	public int getQna_idx() {
		return qna_idx;
	}

	public void setQna_idx(int qna_idx) {
		this.qna_idx = qna_idx;
	}

	public String getQna_category() {
		return qna_category;
	}

	public void setQna_category(String qna_category) {
		this.qna_category = qna_category;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public int getqna_answer() {
		return qna_answer;
	}

	public void setqna_answer(int qna_answer) {
		this.qna_answer = qna_answer;
	}

	public int getQna_writer() {
		return qna_writer;
	}

	public void setQna_writer(int qna_writer) {
		this.qna_writer = qna_writer;
	}

	public int getQna_ref() {
		return qna_ref;
	}

	public void setQna_ref(int qna_ref) {
		this.qna_ref = qna_ref;
	}

	public int getQna_level() {
		return qna_level;
	}

	public void setQna_level(int qna_level) {
		this.qna_level = qna_level;
	}

	public int getQna_sunbun() {
		return qna_sunbun;
	}

	public void setQna_sunbun(int qna_sunbun) {
		this.qna_sunbun = qna_sunbun;
	}

}
