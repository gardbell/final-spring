package com.ace.qna.service;

import java.util.List;

import com.ace.qna.model.QnaDTO;

public interface QnaService {

	public int getTotalQnaCnt();

	public int getNotAnswerQnaNum();

	public List<QnaDTO> qnaList(int cp, int ls);

	public List<QnaDTO> qnaSearchList(int cp, int ls, String keyword);
	public int getTotalQnaSearchCnt(String keyword);
	public int deleteQna(List<Integer> selectedIdxs);
	
	public QnaDTO qnaContent(int qna_idx);
	public String getWriterName(int qna_writer);
	public String getCompanyName(int qna_writer);
	public int qnaInsert(QnaDTO qnaDto);
	public int saveComment(QnaDTO qnaDto);
	public List<QnaDTO> getCommentList(int qna_ref);
	public int updateAnswer(QnaDTO qnaDto);
}
