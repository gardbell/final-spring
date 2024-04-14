package com.ace.price_list.model;

import java.util.*;

public interface Price_ListDAO {
	public List<Price_ListDTO> priceList();
	public int updatePrice_list(Price_ListDTO price_listDto);
}
