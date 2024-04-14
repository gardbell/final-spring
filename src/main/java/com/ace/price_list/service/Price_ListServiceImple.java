package com.ace.price_list.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ace.price_list.model.Price_ListDAO;
import com.ace.price_list.model.Price_ListDTO;

public class Price_ListServiceImple implements Price_ListService {
	@Autowired
	private Price_ListDAO price_listDao;

	public Price_ListDAO getPrice_listDao() {
		return price_listDao;
	}

	public void setPrice_listDao(Price_ListDAO price_listDao) {
		this.price_listDao = price_listDao;
	}

	@Override
	public List<Price_ListDTO> priceList() {
		List<Price_ListDTO> list = price_listDao.priceList();
		return list;
	}
	@Override
	public int updatePrice_list(Price_ListDTO price_listDto) {
		int count = price_listDao.updatePrice_list(price_listDto);
		return count;
	}
}
