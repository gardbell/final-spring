package com.ace.approval_file.service;

import java.util.List;
import java.util.Map;

import com.ace.approval_file.model.Approval_fileDAO;
import com.ace.approval_file.model.Approval_fileDTO;

public class Approval_fileServiceImple implements Approval_fileService{
	private Approval_fileDAO approval_fileDao;

	public Approval_fileServiceImple(Approval_fileDAO approval_fileDao) {
		super();
		this.approval_fileDao = approval_fileDao;
	}

	@Override
	public int addFile(Approval_fileDTO dto) {
		int result=approval_fileDao.addFile(dto);
		return result;
	}
	
	@Override
	public List<Approval_fileDTO> approval_file(Map<String, Integer> map) {
		List<Approval_fileDTO> list=approval_fileDao.approval_file(map);
		return list;
	}
	
	@Override
	public int delFile(Map map) {
		int result=approval_fileDao.delFile(map);
		return result;
	}
}
