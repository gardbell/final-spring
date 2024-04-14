package com.ace.company_event.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ace.company_event.model.Company_eventDAO;
import com.ace.company_event.model.Company_eventDTO;

public class Company_eventServiceImple implements Company_eventService {

	private Company_eventDAO Company_eventDao;

	public Company_eventDAO getCompany_eventDao() {
		return Company_eventDao;
	}

	public void setCompany_eventDao(Company_eventDAO company_eventDao) {
		Company_eventDao = company_eventDao;
	}
	
	@Override
	public int company_eventWrite(Company_eventDTO eventDto) {
		int count = Company_eventDao.company_eventWrite(eventDto);
		return count;
	}
	
	@Override
	public int company_eventReWrite(Company_eventDTO eventDto) {
		int count = Company_eventDao.company_eventReWrite(eventDto);
		return count;
	}
	
	@Override
	public int company_eventNextReWrite(Company_eventDTO eventDto) {
		int count = Company_eventDao.company_eventNextReWrite(eventDto);
		return count;
	}
	
	@Override
	public List<Company_eventDTO> company_eventReWriteList(int com_idx, int comment_ref,int cp,int ls) {
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		Map map = new HashMap();
		map.put("com_idx", com_idx);
		map.put("comment_ref", comment_ref);
		map.put("start", start);
		map.put("end", end);
		
		List<Company_eventDTO> list = Company_eventDao.company_eventReWriteList(map);
		return list;
	}
	
	@Override
	public List<Company_eventDTO> company_eventList(int com_idx,int cp,int ls) {
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		Map map = new HashMap();
		map.put("com_idx", com_idx);
		map.put("start", start);
		map.put("end", end);
		List<Company_eventDTO> eventList = Company_eventDao.company_eventList(map);
		return eventList;
	}
	
	@Override
	public int getEventTotalCnt(int com_idx) {
		int count = Company_eventDao.getEventTotalCnt(com_idx);
		count = count == 0?1:count;
		return count;
	}
	
	@Override
	public Company_eventDTO company_eventContent(int event_idx, int com_idx) {
		Map map = new HashMap();
		map.put("com_idx", com_idx);
		map.put("event_idx", event_idx);
		Company_eventDTO eventDto = Company_eventDao.company_eventContent(map);
		return eventDto;
	}
	
	@Override
	public Company_eventDTO company_eventSearchContnet(int event_idx, int com_idx) {
		Map map = new HashMap();
		map.put("com_idx", com_idx);
		map.put("event_idx", event_idx);
		Company_eventDTO eventDto = Company_eventDao.company_eventSearchContnet(map);
		
		return eventDto;
	}
	

	
	@Override
	public List<Company_eventDTO> company_eventSearch(int com_idx, String eventKeyword, int cp, int ls) {
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		Map map = new HashMap();
		map.put("com_idx", com_idx);
		map.put("eventKeyword", eventKeyword);
		map.put("start", start);
		map.put("end", end);
		
		List<Company_eventDTO> eventList = Company_eventDao.company_eventSearch(map);
		return eventList;
	}
	
	@Override
	public int searchGetEventTotalCnt(String eventKeyword, int com_idx) {
		Map map = new HashMap();
		map.put("com_idx", com_idx);
		map.put("eventKeyword", eventKeyword);
		
		int count = Company_eventDao.searchGetEventTotalCnt(map);
		return count;
	}
	
	@Override
	public int eventReListTotalCnt(int com_idx, int comment_ref) {
		Map map = new HashMap();
		map.put("com_idx", com_idx);
		map.put("comment_ref", comment_ref);
		int count = Company_eventDao.eventReListTotalCnt(map);
		return count;
	}
	
	@Override
	public int company_eventDelete(int event_idx) {
		int count = Company_eventDao.company_eventDelete(event_idx);
		return count;
	}
	
	@Override
	public Company_eventDTO company_eventUpdateForm(int event_idx) {
		Company_eventDTO eventDto = Company_eventDao.company_eventUpdateForm(event_idx);
		return eventDto;
	}
	
	@Override
	public int company_eventUpdate(Company_eventDTO eventDto) {
		int count = Company_eventDao.company_eventUpdate(eventDto);
		return count;
	}
	
	@Override
	public Company_eventDTO company_eventPreviousEvent(int event_idx, int com_idx) {
		Map map = new HashMap();
		map.put("event_idx", event_idx);
		map.put("com_idx", com_idx);
		Company_eventDTO eventDto = Company_eventDao.company_eventPreviousEvent(map);
		
		return eventDto;
	}
	
	@Override
	public Company_eventDTO company_eventSearchPreviousEvent(int event_idx, int com_idx, String eventKeyword) {
		Map map = new HashMap();
		map.put("event_idx", event_idx);
		map.put("com_idx", com_idx);
		map.put("eventKeyword", eventKeyword);
		Company_eventDTO eventDto = Company_eventDao.company_eventSearchPreviousEvent(map);
		return eventDto;
	}
	
	@Override
	public Company_eventDTO company_eventNextEvent(int event_idx, int com_idx) {
		Map map = new HashMap();
		map.put("event_idx", event_idx);
		map.put("com_idx", com_idx);
		Company_eventDTO eventDto = Company_eventDao.company_eventNextEvent(map);
		return eventDto;
	}
	
	@Override
	public Company_eventDTO company_eventSearchNextEvent(int event_idx, int com_idx, String eventKeyword) {
		Map map = new HashMap();
		map.put("event_idx", event_idx);
		map.put("com_idx", com_idx);
		map.put("eventKeyword", eventKeyword);
		Company_eventDTO eventDto = Company_eventDao.company_eventSearchNextEvent(map);
		return eventDto;
	}
	
	@Override
	public int company_eventReadnumUpdate(int event_idx) {
		int count = Company_eventDao.company_eventReadnumUpdate(event_idx);
		return count;
	}
	
	@Override
	public List<Company_eventDTO> comEvent3(int com_idx){
	    List<Company_eventDTO> list = Company_eventDao.comEvent3(com_idx);
	    return list;      
	 }
}
