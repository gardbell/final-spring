package com.ace.price_list.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class Price_ListDAOImple implements Price_ListDAO {
	private SqlSessionTemplate sqlmap;

	public Price_ListDAOImple(SqlSessionTemplate sqlmap) {
		super();
		this.sqlmap = sqlmap;
	}

	@Override
	public List<Price_ListDTO> priceList() {
		List<Price_ListDTO> list = sqlmap.selectList("priceList");
		return list;
	}
	@Override
	public int updatePrice_list(Price_ListDTO price_listDto) {
		int count= sqlmap.update("updateprice_list", price_listDto);
		return count;
	}

}
