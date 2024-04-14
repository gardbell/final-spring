package com.ace.qna.model;

import java.util.List;
import java.util.Map;

public interface QnaDAO {
	public int getTotalQnaCnt();
	public int getNotAnswerQnaCnt();
	public List<QnaDTO> qnaList(Map map);
	public List<QnaDTO> qnaSearchList(Map map);
	public int getTotalQnaSearchCnt(String keyword);
	public int deleteQna(List<Integer> selectedIdxs);
	public QnaDTO qnaContent(int qna_idx);
	public String getWriterName(int qna_writer);
	public String getCompanyName(int qna_writer);
	public int qnaInsert(QnaDTO qnaDto);
	public int qnaCommentInsert(QnaDTO qnaDto);
	public List<QnaDTO> qnaCommentList(int qna_ref);
	public int qnaAnswerUpdate(QnaDTO qnaDto);

}
