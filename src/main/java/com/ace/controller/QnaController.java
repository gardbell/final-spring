package com.ace.controller;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ace.member.model.MemberDTO;
import com.ace.qna.model.QnaDTO;
import com.ace.qna.service.QnaService;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;
	@RequestMapping(value = "/qnaWrite.do",method = RequestMethod.GET)
	public ModelAndView qnaWrite() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("qna/qnaWrite");
		return mav;
	}
	@RequestMapping(value = "/qnaWrite.do",method = RequestMethod.POST)
	public ModelAndView qnaWriteSubmit(QnaDTO qnaDto) {
		
		int result = qnaService.qnaInsert(qnaDto);
		String msg = result > 0 ? "작성 성공" : "작성 실패";

		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("gourl", "qnaList.do");
		
		mav.setViewName("qna/qnaMsg");
		//
		return mav;
	}

	@RequestMapping("/qnaList.do")
	public ModelAndView qnaList(@RequestParam(value = "cp", defaultValue = "1") int cp) {
		int totalCnt = qnaService.getTotalQnaCnt();
		int listSize = 5;
		int pageSize = 5;
		List<QnaDTO> qnaList = qnaService.qnaList(cp, listSize);
		String pageStr = com.ace.page.PageMaker.makePage("qnaList.do", totalCnt, listSize, pageSize, cp);

		ModelAndView mav = new ModelAndView();
		mav.addObject("qnaLists", qnaList);
		mav.addObject("pageStr", pageStr);

		mav.setViewName("qna/qnaList");
		return mav;
	}

	@RequestMapping("/qnaListSearch.do")
	public ModelAndView qnaListSearch(@RequestParam(value = "cp", defaultValue = "1") int cp,
			@RequestParam("keyword") String keyword) {
		int totalCnt = qnaService.getTotalQnaSearchCnt(keyword);
		int listSize = 5;
		int pageSize = 5;
		List<QnaDTO> qnaList = qnaService.qnaSearchList(cp, listSize, keyword);
		String pageStr = com.ace.page.PageMaker.makePage("qnaList.do", totalCnt, listSize, pageSize, cp);

		ModelAndView mav = new ModelAndView();
		mav.addObject("qnaLists", qnaList);
		mav.addObject("pageStr", pageStr);

		mav.setViewName("qna/qnaList");
		return mav;
	}

	@RequestMapping("/deleteQna.do")
	public ModelAndView deleteQna(@RequestParam(name = "selectedIdxs", required = false) String selectedIdxs) {
	    ModelAndView mav = new ModelAndView();
	    
	    if (selectedIdxs == null || selectedIdxs.isEmpty()) {
	        // 선택된 항목이 없는 경우 처리
	        mav.addObject("msg", "선택된 항목 삭제 성공!");
	    } else {
	        // 선택된 항목이 있는 경우 처리
	        List<Integer> idxs = Arrays.stream(selectedIdxs.split(","))
	                                    .map(Integer::valueOf)
	                                    .collect(Collectors.toList());

	        int result = qnaService.deleteQna(idxs);
	        String msg = (result > 0) ? "선택된 항목 삭제 성공!" : "선택된 항목 삭제 실패";
	        mav.addObject("msg", msg);
	    }

	    mav.addObject("gourl", "qnaList.do");
	    mav.setViewName("qna/qnaMsg");
	    return mav;
	}
	@RequestMapping("/qnaContent.do")
	public ModelAndView qnaContent(@RequestParam("qna_idx") Integer qna_idx) {
		QnaDTO qnaDto = qnaService.qnaContent(qna_idx);
		List<QnaDTO> commentList = qnaService.getCommentList(qnaDto.getQna_ref()); // 댓글 목록 가져오기
		
		ModelAndView mav = new ModelAndView();
		String writerName=qnaService.getWriterName(qnaDto.getQna_writer());
		String companyName=qnaService.getCompanyName(qnaDto.getQna_writer());
		mav.addObject("qnaDto", qnaDto);
		mav.addObject("writerName", writerName);
		mav.addObject("companyName", companyName);
		mav.addObject("commentList", commentList); // 댓글 목록을 Model에 추가
		mav.setViewName("qna/qnaContent");
		return mav;
	}
	@RequestMapping("/saveComment.do")
	public ModelAndView saveComment(QnaDTO qnaDto) {
		
		qnaService.saveComment(qnaDto);
		qnaService.updateAnswer(qnaDto);
		
		List<QnaDTO> list = qnaService.getCommentList(qnaDto.getQna_ref());
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", list);
		mav.setViewName("yongJson");
		return mav;
	}
	
	

}
