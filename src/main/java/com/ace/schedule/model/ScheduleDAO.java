package com.ace.schedule.model;

import java.util.List;
import java.util.Map;

public interface ScheduleDAO {
	
	public int addSchedule(ScheduleDTO dto);
	
	public List<ScheduleDTO> listSchedule(Map map);
	
	public int delSchedule(int schedule_idx);
	
	public int upSchedule(ScheduleDTO dto);

}
