package com.ace.schedule.service;

import java.util.*;

import com.ace.schedule.model.*;

public class ScheduleServiceImple implements ScheduleService {

	private ScheduleDAO scheduleDao;

	public ScheduleDAO getScheduleDao() {
		return scheduleDao;
	}

	public void setScheduleDao(ScheduleDAO scheduleDao) {
		this.scheduleDao = scheduleDao;
	}

	public int addSchedule(ScheduleDTO dto) {
		int result=3;
		if(!(dto.getTitle()==null||dto.getTitle().equals(""))&&!(dto.getContent()==null||dto.getContent().equals(""))) {
			if(dto.getSmna()==2) {
				dto.setStime(dto.getStime()+12);
			}
			if(dto.getEmna()==2) {
				dto.setEtime(dto.getEtime()+12);
			}
			result=scheduleDao.addSchedule(dto);
		}
		return result;
	}
	
	public Map<String,List<ScheduleDTO>> listSchedule(Map map) {
		List<ScheduleDTO> list=scheduleDao.listSchedule(map);
		int lastDate=(Integer)map.get("lastDate");
		Map<String,List<ScheduleDTO>> dateMap=new HashMap<String, List<ScheduleDTO>>();
		for(int i=1;i<=lastDate;i++) {
			List<ScheduleDTO> arr=new ArrayList<ScheduleDTO>();
			for(int j=0;j<list.size();j++) {
				ScheduleDTO dto=list.get(j);
				String str[]=dto.getSdate().split("-");
				int date=Integer.parseInt(str[2].substring(0, 2));
				if(date==i) {
					arr.add(dto);
				}
			}
			if(arr!=null||arr.size()!=0) {
				dateMap.put(""+i, arr);
			}
		}
		return dateMap;
	}
	
	public int delSchedule(int schedule_idx) {
		int result=scheduleDao.delSchedule(schedule_idx);
		return result;
	}
	
	public int upSchedule(ScheduleDTO dto) {
		int result=3;
		if(!(dto.getTitle()==null||dto.getTitle().equals(""))&&!(dto.getContent()==null||dto.getContent().equals(""))) {
			if(dto.getSmna()==2) {
				dto.setStime(dto.getStime()+12);
			}
			if(dto.getEmna()==2) {
				dto.setEtime(dto.getEtime()+12);
			}
			result=scheduleDao.upSchedule(dto);
		}
		return result;
	}
	
}
