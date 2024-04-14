package com.ace.price_list.service;

import java.util.List;

import com.ace.price_list.model.Price_ListDTO;

public interface Price_ListService {
	public List<Price_ListDTO> priceList();
	public int updatePrice_list(Price_ListDTO price_listDto);
}
