package com.ace.sales_item.model;

import java.util.List;
import java.util.Map;

public interface SalesDAO {
	public List<SalesDTO> salesFind(int com_idx);
	public int salesWrite(SalesDTO dto);
	public List<Sales_itemDTO> itemFind(int com_idx);
	public int delSales(String writedate);
	public int salesNewWrite(Sales_itemDTO dto);
	public int delSale(Map map);
}
