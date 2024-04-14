package com.ace.approval_file.model;

import java.util.List;
import java.util.Map;

public interface Approval_fileDAO {
	public int addFile(Approval_fileDTO dto);
	public List<Approval_fileDTO> approval_file(Map<String, Integer> map);
	public int delFile(Map map);
}
