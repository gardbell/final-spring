package com.ace.sales_item.model;

import java.sql.Date;

public class SalesDTO {
	private int com_idx;
	private Date writedate;
	private int sales;
	private int item_idx;
	private String item_name;
	
	public SalesDTO() {
		super();
	}
	public SalesDTO(int com_idx, Date writedate, int sales, int item_idx) {
		super();
		this.com_idx = com_idx;
		this.writedate = writedate;
		this.sales = sales;
		this.item_idx = item_idx;
	}
	
	
	
	public SalesDTO(int com_idx, Date writedate, int sales, int item_idx, String item_name) {
		super();
		this.com_idx = com_idx;
		this.writedate = writedate;
		this.sales = sales;
		this.item_idx = item_idx;
		this.item_name = item_name;
	}
	public int getCom_idx() {
		return com_idx;
	}
	public void setCom_idx(int com_idx) {
		this.com_idx = com_idx;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public int getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(int item_idx) {
		this.item_idx = item_idx;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	
	
}
