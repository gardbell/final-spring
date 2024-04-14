package com.ace.qna.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.ace.member.model.MemberDTO;

public class QnaDAOImple implements QnaDAO {

	private SqlSessionTemplate sqlmap;

	public QnaDAOImple(SqlSessionTemplate sqlmap) {
		super();
		this.sqlmap = sqlmap;
	}
	@Override
	public int getTotalQnaCnt() {
		int count = sqlmap.selectOne("totalQnaCnt");
		return count;
	}
	@Override
	public int getNotAnswerQnaCnt() {
		int count = sqlmap.selectOne("notAnswerQnaCnt");
		return count;
	}
	@Override
	public List<QnaDTO> qnaList(Map map) {
		List<QnaDTO> list = sqlmap.selectList("qnaList", map);
		return list;
	}
	@Override
	public int getTotalQnaSearchCnt(String keyword) {
		int count = sqlmap.selectOne("totalQnaSearchCnt", keyword);
		return count;
	}
	@Override
	public List<QnaDTO> qnaSearchList(Map map) {
		List<QnaDTO> list = sqlmap.selectList("qnaSearchList", map);
		return list;
	}
	@Override
	public int deleteQna(List<Integer> selectedIdxs) {
		int count = sqlmap.delete("deleteQna", selectedIdxs);
		return count;
	}
	@Override
	public QnaDTO qnaContent(int qna_idx) {
		QnaDTO dto=sqlmap.selectOne("qnaContent", qna_idx);
		return dto;
	}
	@Override
	public String getCompanyName(int qna_writer) {
		String companyName=sqlmap.selectOne("getCompanyName",qna_writer);
		return companyName;
	}@Override
	public String getWriterName(int qna_writer) {
		String writerName=sqlmap.selectOne("getWriterName",qna_writer);
		return writerName;
	}
	@Override
	public int qnaInsert(QnaDTO qnaDto) {
		int count= sqlmap.insert("qnaInsert", qnaDto);
		return count;
	}
	@Override
	public int qnaCommentInsert(QnaDTO qnaDto) {
		int count= sqlmap.insert("qnaCommentInsert", qnaDto);
		return count;
	}
	@Override
	public List<QnaDTO> qnaCommentList(int qna_ref) {
		List<QnaDTO> list = sqlmap.selectList("qnaCommentList", qna_ref);
		return list;
	}
	@Override
	public int qnaAnswerUpdate(QnaDTO qnaDto) {
		int count=sqlmap.update("qnaAnswerUpdate", qnaDto);
		return count;
	}
}
