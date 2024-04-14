package com.ace.sales_item.model;

public class Sales_itemDTO {
	private int item_idx;
	private int com_idx;
	private String item_name;
	private int item_price;
	private int item_cost;
	
	public Sales_itemDTO() {
		super();
	}
	public Sales_itemDTO(int item_idx, int com_idx, String item_name, int item_price, int item_cost) {
		super();
		this.item_idx = item_idx;
		this.com_idx = com_idx;
		this.item_name = item_name;
		this.item_price = item_price;
		this.item_cost = item_cost;
	}
	public int getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(int item_idx) {
		this.item_idx = item_idx;
	}
	public int getCom_idx() {
		return com_idx;
	}
	public void setCom_idx(int com_idx) {
		this.com_idx = com_idx;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public int getItem_cost() {
		return item_cost;
	}
	public void setItem_cost(int item_cost) {
		this.item_cost = item_cost;
	}
}
