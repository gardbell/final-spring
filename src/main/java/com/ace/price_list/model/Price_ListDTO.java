package com.ace.price_list.model;

public class Price_ListDTO {
	private int price_sort;
	private int price;

	public Price_ListDTO() {
		super();
	}

	public Price_ListDTO(int price_sort, int price) {
		super();
		this.price_sort = price_sort;
		this.price = price;
	}

	public int getPrice_sort() {
		return price_sort;
	}

	public void setPrice_sort(int price_sort) {
		this.price_sort = price_sort;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

}
