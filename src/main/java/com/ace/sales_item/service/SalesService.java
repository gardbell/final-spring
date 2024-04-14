package com.ace.sales_item.service;

import java.util.List;
import java.util.Map;

import com.ace.sales_item.model.SalesDTO;
import com.ace.sales_item.model.Sales_itemDTO;

public interface SalesService {
	public List<SalesDTO> salesFind(int com_idx);
	public int salesWrite(SalesDTO dto);
	public List<Sales_itemDTO> itemFind(int com_idx); 
	public int delSales(String writedate);
	public int salesNewWrite(Sales_itemDTO dto);
	public int delSale(Map map);
}	
