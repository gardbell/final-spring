package com.ace.qna.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.ace.member.model.MemberDTO;
import com.ace.qna.model.QnaDAO;
import com.ace.qna.model.QnaDTO;

public class QnaServiceImple implements QnaService {
	@Autowired
	private QnaDAO qnaDao;

	public QnaDAO getQnaDao() {
		return qnaDao;
	}

	public void setQnaDao(QnaDAO qnaDao) {
		this.qnaDao = qnaDao;
	}

	@Override
	public int getTotalQnaCnt() {
		int count = qnaDao.getTotalQnaCnt();
		count = count == 0 ? 1 : count;
		return count;
	}

	@Override
	public int getNotAnswerQnaNum() {
		int count = qnaDao.getNotAnswerQnaCnt();
		return count;
	}

	@Override
	public List<QnaDTO> qnaList(int cp, int ls) {
		int start = (cp - 1) * ls + 1;
		int end = cp * ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<QnaDTO> list = qnaDao.qnaList(map);
		return list;
	}

	@Override
	public int getTotalQnaSearchCnt(String keyword) {
		int count = qnaDao.getTotalQnaSearchCnt(keyword);
		count = count == 0 ? 1 : count;
		return count;
	}

	@Override
	public List<QnaDTO> qnaSearchList(int cp, int ls, String keyword) {

		int start = (cp - 1) * ls + 1;
		int end = cp * ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("keyword", keyword);
		List<QnaDTO> list = qnaDao.qnaSearchList(map);
		return list;
	}
	@Override
	public int deleteQna(List<Integer> selectedIdxs) {
		int result= qnaDao.deleteQna(selectedIdxs);
		return result;
	}
	@Override
	public QnaDTO qnaContent(int qna_idx) {
	    QnaDTO dto = qnaDao.qnaContent(qna_idx);
	    if (dto != null) {
	        dto.setQna_content(dto.getQna_content().replaceAll("\n", "<br>"));
	    }
	    return dto;
	}
	@Override
	public String getCompanyName(int qna_writer) {
		String companyName=qnaDao.getCompanyName(qna_writer);
		return companyName;
	}@Override
	public String getWriterName(int qna_writer) {
		String writerName=qnaDao.getWriterName(qna_writer);
		return writerName;
	}
	@Override
	public int qnaInsert(QnaDTO qnaDto) {
		
		int result=qnaDao.qnaInsert(qnaDto);
		return result;
	}
	@Override
	public int saveComment(QnaDTO qnaDto) {
		qnaDto.setQna_content(qnaDto.getQna_content().replaceAll("\n", "<br>"));
		int result=qnaDao.qnaCommentInsert(qnaDto);
		return result;
	}
	@Override
	public List<QnaDTO> getCommentList(int qna_ref) {
		List<QnaDTO> list=qnaDao.qnaCommentList(qna_ref);
		return list;
	}
	@Override
	public int updateAnswer(QnaDTO qnaDto) {
		int result=qnaDao.qnaAnswerUpdate(qnaDto);
		return result;
	}
}
