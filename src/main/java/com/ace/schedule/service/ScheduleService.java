package com.ace.schedule.service;

import java.util.List;
import java.util.Map;

import com.ace.schedule.model.ScheduleDTO;

public interface ScheduleService {
	
	public int addSchedule(ScheduleDTO dto);
	
	public Map<String,List<ScheduleDTO>> listSchedule(Map map);
	
	public int delSchedule(int schedule_idx);
	
	public int upSchedule(ScheduleDTO dto);

}
