package com.ace.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ace.sales_item.model.SalesDTO;
import com.ace.sales_item.model.Sales_itemDTO;
import com.ace.sales_item.service.SalesService;

@Controller
public class Sales_itemController {
	@Autowired
	private SalesService salesService;
	
	@RequestMapping("sales.do")
	public ModelAndView sales(int com_idx) {
		ModelAndView mav = new ModelAndView();
		List<SalesDTO> list = salesService.salesFind(com_idx);
		//List<Sales_itemDTO> itemlist = salesService.itemFind(com_idx);
		mav.addObject("list", list);
		//mav.addObject("itemlist", itemlist);
		mav.setViewName("comManager/sales");
		return mav;
	}
	@RequestMapping("salesWrite.do")
	public ModelAndView salesWrite(
			@RequestParam("com_idx")int com_idx) {
		ModelAndView mav = new ModelAndView();
		
		List<Sales_itemDTO> list = salesService.itemFind(com_idx);
		mav.addObject("list",list);
		mav.setViewName("comManager/salesWrite");
		return mav;
	}
	@RequestMapping(value = "salesWriteOk.do", method = RequestMethod.POST)
	public ModelAndView salesWriteOk(
			@RequestParam("com_idx")int com_idx,
			@RequestParam("item_idx")int item_idx,
			@RequestParam("sales")int sales,
			@RequestParam("year")int year,
			@RequestParam("month")int month,
			@RequestParam("date")int date) {
		
		Date writedate = new Date(year-1900, month-1, date);
		
		SalesDTO dto = new SalesDTO();
		dto.setWritedate(writedate);
		dto.setCom_idx(com_idx);
		dto.setItem_idx(item_idx);
		dto.setSales(sales);
		
		ModelAndView mav = new ModelAndView();
		int count = salesService.salesWrite(dto);
		String url = "companyManager.do?com_idx="+com_idx;
		String msg = count>0?"성공":"실패";
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("member/message");
		return mav;
	}
	@RequestMapping("newProduct.do")
	public ModelAndView newProduct() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("comManager/newProduct");
		return mav;
	}
	@RequestMapping(value="newProduct.do", method = RequestMethod.POST)
	public ModelAndView newProductOk(Sales_itemDTO dto) {
		ModelAndView mav = new ModelAndView();
		int count = salesService.salesNewWrite(dto);
		String url = "companyManager.do?com_idx="+dto.getCom_idx();
		String msg = count>0?"성공":"실패";
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("member/message");
		return mav;
	}
	
	@RequestMapping("delSale.do")
	public ModelAndView delSale(
			@RequestParam("year")int year,
			@RequestParam("month")int month,
			@RequestParam("date")int date,
			@RequestParam("com_idx")int com_idx) {
		ModelAndView mav = new ModelAndView();
		
		
		Date writedate = new Date(year, month, date);
		
		Map map = new HashMap();
		map.put("writedate", writedate);
		map.put("com_idx", com_idx);
		
		int count = salesService.delSale(map);
		String url = "companyManager.do?com_idx="+com_idx;
		String msg = count>0?"성공":"실패";
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("member/message");
		return mav;
	}
}
