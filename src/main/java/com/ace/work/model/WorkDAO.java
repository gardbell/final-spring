package com.ace.work.model;

import java.util.List;

public interface WorkDAO {

	public int workWrite(WorkDTO wDto);
	public List<WorkDTO> workList(int idx);
	public int workPromotion(int idx);
}
