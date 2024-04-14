package com.ace.approval_file.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class Approval_fileDAOImple implements Approval_fileDAO {
	
	private SqlSessionTemplate sqlmap;

	public Approval_fileDAOImple(SqlSessionTemplate sqlmap) {
		super();
		this.sqlmap = sqlmap;
	}

	@Override
	public int addFile(Approval_fileDTO dto) {
		int result=sqlmap.insert("addFile", dto);
		return result;
	}
	
	@Override
	public List<Approval_fileDTO> approval_file(Map<String, Integer> map) {
		List<Approval_fileDTO> list=sqlmap.selectList("approval_File",map);
		return list;
	}
	
	@Override
	public int delFile(Map map) {
		int result=sqlmap.delete("delFile", map);
		return result;
	}

}
