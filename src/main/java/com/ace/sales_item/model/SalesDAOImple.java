package com.ace.sales_item.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class SalesDAOImple implements SalesDAO {

	private SqlSessionTemplate sqlMap;
	
	public SalesDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	@Override
	public List<SalesDTO> salesFind(int com_idx) {
		List<SalesDTO> list = sqlMap.selectList("salesFind", com_idx);
		return list;
	}
	@Override
	public int salesWrite(SalesDTO dto) {
		int sw = sqlMap.insert("salesWrite", dto);
		return sw;
	}
	
	@Override
	public List<Sales_itemDTO> itemFind(int com_idx) {
		List<Sales_itemDTO> list = sqlMap.selectList("itemFind", com_idx);
		return list;
	}
	
	@Override
	public int delSales(String writedate) {
		int del = sqlMap.delete("delSale",writedate);
		return del;
	}
	@Override
	public int salesNewWrite(Sales_itemDTO dto) {
		int nw = sqlMap.insert("salesNewWrite", dto);
		return nw;
	}
	@Override
	public int delSale(Map map) {
		int ds = sqlMap.delete("delSale", map);
		return ds;
	}
}
