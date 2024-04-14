package com.ace.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ace.approval.model.ApprovalDTO;
import com.ace.approval.service.ApprovalService;
import com.ace.approval_file.model.Approval_fileDTO;
import com.ace.approval_file.service.Approval_fileService;
import com.ace.company_news.model.Company_newsDTO;
import com.ace.member.model.MemberDTO;
import com.ace.site_log.service.Site_LogService;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService approvalService;
	@Autowired
	private Approval_fileService approval_fileService;
	@Autowired
	private Site_LogService site_logService;
	
	@RequestMapping("/approval.do")
	public ModelAndView approval(Integer idx,HttpServletRequest req) {
		HttpSession session = req.getSession();
		if(idx==null) {
			MemberDTO mdto= (MemberDTO)session.getAttribute("dto");
			idx=mdto.getIdx();
		}
		
		site_logService.updateDocument_Log();
		
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("idx", idx);
		map.put("check", 1);
		int myCnt = approvalService.getTotalCnt(map);
		map.remove("check");
		map.put("check", 2);
		int myCnt2 = approvalService.getTotalCnt(map);
		map.remove("check");
		map.put("check", 3);
		int myCnt3 = approvalService.getTotalCnt(map);
		map.remove("check");
		map.put("check", 4);
		
		int myCnt4 = approvalService.getTotalCnt(map);
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("myCnt", myCnt);
		mav.addObject("myCnt2", myCnt2);
		mav.addObject("myCnt3", myCnt3);
		mav.addObject("myCnt4", myCnt4);
		mav.setViewName("approval/approval");
		return mav;
	}
	@RequestMapping("selectApprover.do")
	public ModelAndView approverList(int com_idx) {
		List<MemberDTO> approver=approvalService.selectApprover(com_idx);
		int ref=approvalService.getRef(com_idx);
		
		ModelAndView mav=new ModelAndView("yongJson");
		mav.addObject("list", approver);
		mav.addObject("ref", ref);
		return mav;
	}
	@RequestMapping(value="/approvalWriteForm.do" , method = RequestMethod.GET)
	public String approvalWriteform() {
		return "approval/approvalWriteForm";
	}
	
	@RequestMapping(value="/approvalWriteForm.do" , method = RequestMethod.POST)
	public ModelAndView approvalWriteform2(ApprovalDTO appDto,@RequestParam(name = "upload", required = false) List<MultipartFile> upload) {
		int result = approvalService.approvalWrite(appDto);
		String msg = result > 0? "게시물이 등록 되었습니다.":"게시물 등록에 실패 하였습니다.";
		ModelAndView mav = new ModelAndView();
		if(upload!=null) {
			int count=0;
			for(int i=0;i<upload.size();i++) {
				Approval_fileDTO fileDto=new Approval_fileDTO();
				fileDto.setCom_idx(appDto.getCom_idx());
				fileDto.setRef(appDto.getRef());
				fileDto.setFilename(upload.get(i).getOriginalFilename());
				copyInto(appDto.getCom_idx(),upload.get(i));
				int result2=approval_fileService.addFile(fileDto);
				count+=result2;
			}
		}
		mav.addObject("msg", msg);
		mav.setViewName("approval/goApproval");
		return mav;
	}
	
	@RequestMapping("/approvalList.do")
	public ModelAndView approvalList(int idx,int check,@RequestParam(value = "cp", defaultValue = "1") int cp) {
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("idx", idx);
		map.put("check", check);
		int totalCnt = approvalService.getTotalCnt(map);
		totalCnt = totalCnt == 0?1:totalCnt;
		int listSize = 10;
		int pageSize = 5;
		String pageStr = com.ace.page.ApprovalListPage.makePage("approvalList.do", totalCnt, listSize, pageSize, cp, check, idx);
		List<ApprovalDTO> list = approvalService.approvalList(idx,check,cp,listSize);
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists",list);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("approval/approvalList");
		return mav;
	}
	
	@RequestMapping("/approvalContent.do")
	public ModelAndView approvalContent(@RequestParam("ref") int ref,@RequestParam("com_idx") int com_idx) {
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("ref", ref);
		map.put("com_idx", com_idx);
		ApprovalDTO appDto = approvalService.approvalContent(map);
		List<Approval_fileDTO> app_fileList=approval_fileService.approval_file(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("appDto",appDto);
		mav.addObject("app_fileList",app_fileList);
		mav.setViewName("approval/approvalContent");
		return mav;
	}
	
	@RequestMapping("/fileDown.do")
	public ModelAndView fileDown(String filename,int com_idx) {
		
		File f=new File("C:/student_java/final/aceworks/src/main/webapp/appfile/"+com_idx+"/"+filename);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("downloadFile",f);
		mav.setViewName("yongDown");
		return mav;
	}
	
	@RequestMapping("/approvalUpdateForm.do")
	public ModelAndView approvalUpdateForm(int ref,int com_idx) {
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("ref", ref);
		map.put("com_idx", com_idx);
		List<Approval_fileDTO> app_fileList=approval_fileService.approval_file(map);
		ApprovalDTO appDto = approvalService.approvalContent(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("appDto", appDto);
		mav.addObject("app_fileList",app_fileList);
		mav.setViewName("approval/approvalUpdateForm");
		return mav;
	}
	@RequestMapping("/approvalUpdate.do")
	public ModelAndView approvalUpdate(ApprovalDTO appDto,@RequestParam(name = "upload", required = false) List<MultipartFile> upload) {
	int result = approvalService.approvalUpdate(appDto);
	String msg = result>0?"게시글이 수정되었습니다.":"게시글 수정에 실패 하였습니다.";
	
	ModelAndView mav = new ModelAndView();
	if(upload!=null) {
		int count=0;
		for(int i=0;i<upload.size();i++) {
			Approval_fileDTO fileDto=new Approval_fileDTO();
			fileDto.setCom_idx(appDto.getCom_idx());
			fileDto.setRef(appDto.getRef());
			fileDto.setFilename(upload.get(i).getOriginalFilename());
			copyInto(appDto.getCom_idx(),upload.get(i));
			int result2=approval_fileService.addFile(fileDto);
			count+=result2;
		}
	}
	mav.addObject("msg",msg);
	mav.setViewName("approval/goApproval");
	return mav;
	}
	
	@RequestMapping("/deleteFile.do")
	public ModelAndView deleteFile(int com_idx, String filename) {
		String msg=delete(com_idx,filename);
		Map map=new HashMap();
		map.put("com_idx", com_idx);
		map.put("filename", filename);
		map.put("check", 1);
		ModelAndView mav=new ModelAndView("yongJson");
		if(msg.equals("파일 삭제 성공")) {
			approval_fileService.delFile(map);
		}
		mav.addObject("msg",msg);
		return mav;
	}
	
	@RequestMapping("/approvalDelete.do")
	public ModelAndView deleteApproval(int ref, int com_idx) {
		String msg="";
		Map<String,Integer> map=new HashMap<String, Integer>();
		map.put("ref", ref);
		map.put("com_idx", com_idx);
		map.put("check", 2);
		int result=approvalService.deleteApproval(map);
		if(result>0) {
			List<Approval_fileDTO> app_fileList=approval_fileService.approval_file(map);
			for(int i=0;i<app_fileList.size();i++) {
				delete(com_idx,app_fileList.get(i).getFilename());
			}
			int result2=approval_fileService.delFile(map);
			
			if(result>0&&result2>0) {
				msg="content삭제성공!";
			}else if(result>0&&!(result2>0)) {
				msg="게시글 삭제성공 파일삭제실패";
			}else if(!(result>0)&&result2>0) {
				msg="게시글 삭제실패 파일삭제성공";
			}else {
				msg="다실패";
			}
			System.out.println(msg);
		}
		
		ModelAndView mav=new ModelAndView("approval/goApproval");
		return mav;
	}
	
	@RequestMapping("/checkApproval.do")
	public ModelAndView checkApproval(int ref,int com_idx) {
		Map<String,Integer> map=new HashMap<String, Integer>();
		map.put("ref", ref);
		map.put("com_idx", com_idx);
		int result=approvalService.checkApproval(map);
		String msg="";
		if(result>0) {
			msg="승인완료";
		}else {
			msg="승인실패";
		}
		ModelAndView mav=new ModelAndView("approval/goApproval");
		return mav;
	}
	
	public String delete(int com_idx, String filename) {
		String filePath = "C:/student_java/final/aceworks/src/main/webapp/appfile/"+com_idx+"/";
        File fileToDelete = new File(filePath, filename);
        String msg="";
        if (fileToDelete.exists()) {
            boolean isDeleted = fileToDelete.delete();
            if (isDeleted) {
                msg="파일 삭제 성공";
            } else {
                msg="파일 삭제 실패";
            }
        } else {
           msg="파일이 존재하지 않습니다.";
        }
        return msg;
	}
	
	public void copyInto(int com_idx, MultipartFile upload) {
		try {
			byte bytes[] = upload.getBytes();
			File dirPath = new File("C:/student_java/final/aceworks/src/main/webapp/appfile/"+ com_idx +"/");
			
			if (!dirPath.exists()) {
	            dirPath.mkdirs();
	        }
	        File f = new File("C:/student_java/final/aceworks/src/main/webapp/appfile/"+com_idx+"/"+upload.getOriginalFilename());      
	        FileOutputStream fos = new FileOutputStream(f);
	        fos.write(bytes);
	        fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}

}
