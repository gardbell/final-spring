package com.ace.company_event.service;

import java.util.*;

import com.ace.company_event.model.Company_eventDTO;

public interface Company_eventService {

	public int company_eventWrite(Company_eventDTO eventDto);
	public List<Company_eventDTO> company_eventList(int com_idx,int cp,int Ls);
	public List<Company_eventDTO> company_eventReWriteList(int com_idx,int comment_ref,int cp,int Ls);
	public int getEventTotalCnt(int com_idx);
	public Company_eventDTO company_eventContent(int event_idx , int com_idx);
	public Company_eventDTO company_eventSearchContnet(int event_idx , int com_idx);
	public List<Company_eventDTO> company_eventSearch(int com_idx,String eventKeyword,int cp,int Ls);
	public int searchGetEventTotalCnt(String eventKeyword,int com_idx);
	public int eventReListTotalCnt(int com_idx, int comment_ref);
	public int company_eventDelete(int event_idx);
	public Company_eventDTO company_eventUpdateForm(int event_idx);
	public int company_eventUpdate(Company_eventDTO eventDto);
	public Company_eventDTO company_eventPreviousEvent(int event_idx,int com_idx);
	public Company_eventDTO company_eventSearchPreviousEvent(int event_idx,int com_idx,String eventKeyword);
	public Company_eventDTO company_eventNextEvent(int event_idx,int com_idx);
	public Company_eventDTO company_eventSearchNextEvent(int event_idx,int com_idx,String eventKeyword);
	public int company_eventReadnumUpdate(int event_idx);
	public int company_eventReWrite(Company_eventDTO eventDto);
	public int company_eventNextReWrite(Company_eventDTO eventDto);
	public List<Company_eventDTO> comEvent3(int com_idx);
}
