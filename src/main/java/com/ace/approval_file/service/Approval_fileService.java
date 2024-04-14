package com.ace.approval_file.service;

import java.util.List;
import java.util.Map;

import com.ace.approval_file.model.Approval_fileDTO;

public interface Approval_fileService {
	public int addFile(Approval_fileDTO dto);
	public List<Approval_fileDTO> approval_file(Map<String, Integer> map);
	public int delFile(Map map);
}
