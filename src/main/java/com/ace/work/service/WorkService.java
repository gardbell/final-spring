package com.ace.work.service;

import java.util.List;

import com.ace.work.model.WorkDTO;

public interface WorkService {

	public int workWrite(WorkDTO wDto);
	public List<WorkDTO> workList(int idx);
	public int workPromotion(int idx);
}
