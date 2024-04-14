package com.ace.company_event.model;

import java.util.*;

public interface Company_eventDAO {
	
	public int company_eventWrite(Company_eventDTO eventDto);
	public List<Company_eventDTO> company_eventList(Map map);
	public List<Company_eventDTO> company_eventReWriteList(Map map);
	public int getEventTotalCnt(int event_idx);
	public Company_eventDTO company_eventContent(Map map);
	public Company_eventDTO company_eventSearchContnet(Map map);
	public List<Company_eventDTO> company_eventSearch(Map map);
	public int eventReListTotalCnt(Map map);
	public int searchGetEventTotalCnt(Map map);
	public int company_eventDelete(int event_idx);
	public Company_eventDTO company_eventUpdateForm(int event_idx);
	public int company_eventUpdate(Company_eventDTO eventDto);
	public Company_eventDTO company_eventPreviousEvent(Map map);
	public Company_eventDTO company_eventSearchPreviousEvent(Map map);
	public Company_eventDTO company_eventNextEvent(Map map);
	public Company_eventDTO company_eventSearchNextEvent(Map map);
	public int company_eventReadnumUpdate(int event_idx);
	public int company_eventReWrite(Company_eventDTO eventDto);
	public int company_eventNextReWrite(Company_eventDTO eventDto);
	public List<Company_eventDTO> comEvent3(int com_idx);
}
