package com.ace.company_event.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class Company_eventDAOImple implements Company_eventDAO {

	private SqlSessionTemplate sqlmap;
	
	public Company_eventDAOImple(SqlSessionTemplate sqlmap) {
		super();
		this.sqlmap = sqlmap;
	}
	
	@Override
	public int company_eventWrite(Company_eventDTO eventDto) {
		int count = sqlmap.insert("company_eventWrite",eventDto);
		return count;
	}
	@Override
	public int company_eventReWrite(Company_eventDTO eventDto) {
		int count = sqlmap.insert("company_eventReWrite",eventDto);
		return count;
	}

	@Override
	public int company_eventNextReWrite(Company_eventDTO eventDto) {
		int count = sqlmap.insert("company_eventNextReWrite",eventDto);
		return count;
	}
	
	@Override
	public List<Company_eventDTO> company_eventReWriteList(Map map) {
		List<Company_eventDTO> list = sqlmap.selectList("company_eventReWriteList",map);
		return list;
	}
	
	@Override
	public List<Company_eventDTO> company_eventList(Map map) {
		List<Company_eventDTO> eventList = sqlmap.selectList("company_eventList",map); 
		return eventList;
	}
	
	@Override
	public int getEventTotalCnt(int event_idx) {
		int count = sqlmap.selectOne("eventTotalCnt",event_idx);
		return count;
	}
	
	@Override
	public Company_eventDTO company_eventContent(Map map) {
		Company_eventDTO eventDto = sqlmap.selectOne("company_eventContnet",map);
		return eventDto;
	}
	
	@Override
	public Company_eventDTO company_eventSearchContnet(Map map) {
		Company_eventDTO eventDto = sqlmap.selectOne("company_eventSearchContnet",map);
		return eventDto;
	}
	

	
	@Override
	public List<Company_eventDTO> company_eventSearch(Map map) {
		List<Company_eventDTO> evenList = sqlmap.selectList("company_eventSearch",map);
		return evenList;
	}
	
	@Override
	public int searchGetEventTotalCnt(Map map) {
		int count = sqlmap.selectOne("eventSearchTotalCnt",map);
		return count;
	}
	@Override
	public int eventReListTotalCnt(Map map) {
		int count = sqlmap.selectOne("eventReListTotalCnt",map);
		return count;
	}
	
	@Override
	public int company_eventDelete(int event_idx) {
		int count = sqlmap.delete("company_eventDelete",event_idx);
		return count;
	}
	
	@Override
	public Company_eventDTO company_eventUpdateForm(int event_idx) {
		Company_eventDTO eventDto = sqlmap.selectOne("company_eventUpdateForm",event_idx);
		return eventDto;
	}
	
	@Override
	public int company_eventUpdate(Company_eventDTO eventDto) {
		int count = sqlmap.update("company_eventUpdate",eventDto);
		return count;
	}
	
	@Override
	public Company_eventDTO company_eventPreviousEvent(Map map) {
		Company_eventDTO eventDto = sqlmap.selectOne("company_eventPreviousEvent",map);
		return eventDto;
	}
	
	@Override
	public Company_eventDTO company_eventSearchPreviousEvent(Map map) {
		Company_eventDTO eventDto = sqlmap.selectOne("company_eventSearchPreviousEvent",map);
		return eventDto;
	}
	
	@Override
	public Company_eventDTO company_eventNextEvent(Map map) {
		Company_eventDTO eventDto = sqlmap.selectOne("company_eventNextEvent",map);
		return eventDto;
	}
	
	@Override
	public Company_eventDTO company_eventSearchNextEvent(Map map) {
		Company_eventDTO eventDto = sqlmap.selectOne("company_eventSearchNextEvent",map);
		return eventDto;
	}
	
	@Override
	public int company_eventReadnumUpdate(int event_idx) {
		int count = sqlmap.update("company_eventReadnumUpdate",event_idx);
		return count;
	}
	
	@Override
	   public List<Company_eventDTO> comEvent3(int com_idx) {
	      List<Company_eventDTO> list = sqlmap.selectList("comEvent3",com_idx);
	      return list;
	   }
}
