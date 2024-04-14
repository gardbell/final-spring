package com.ace.sales_item.service;

import java.util.List;
import java.util.Map;

import com.ace.sales_item.model.SalesDAO;
import com.ace.sales_item.model.SalesDTO;
import com.ace.sales_item.model.Sales_itemDTO;

public class SalesServiceImple implements SalesService {
	private SalesDAO salesDao;

	public SalesDAO getSalesDao() {
		return salesDao;
	}

	public void setSalesDao(SalesDAO salesDao) {
		this.salesDao = salesDao;
	}

	@Override
	public List<SalesDTO> salesFind(int com_idx) {
		List<SalesDTO> list = salesDao.salesFind(com_idx);
		return list;
	}

	@Override
	public int salesWrite(SalesDTO dto) {
		int cont = salesDao.salesWrite(dto);
		return cont;
	}
	
	@Override
	public List<Sales_itemDTO> itemFind(int com_idx) {
		List<Sales_itemDTO> list = salesDao.itemFind(com_idx);
		return list;
	}
	
	@Override
	public int delSales(String writedate) {
		int a = salesDao.delSales(writedate);
		return a;
	}
	@Override
	public int salesNewWrite(Sales_itemDTO dto) {
		int a = salesDao.salesNewWrite(dto);
		return a;
	}
	@Override
	public int delSale(Map map) {
		int ds = salesDao.delSale(map);
		return ds;
	}
}
