package com.ace.page;

public class Company_eventReListPage {
public static String makePage(String pagename,int totalCnt,int listSize,int pageSize,int cp,int com_idx,int comment_ref) {
		
		int totalPage = (totalCnt/listSize)+1;
		if(totalCnt%listSize==0)totalPage--;
		
		int userGroup=cp/pageSize;
		if(cp%pageSize==0)userGroup--;
		
		StringBuffer sb = new StringBuffer();
		
		if(userGroup!=0){
			
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp=(userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append("&com_idx=");
			sb.append(com_idx);
			sb.append("&comment_ref=");
			sb.append(comment_ref);
			sb.append("'>&lt;&lt;</a>");
		}
		for(int i=(userGroup*pageSize)+1;i<=(userGroup*pageSize)+pageSize;i++){
			sb.append("&nbsp;&nbsp;<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("&com_idx=");
			sb.append(com_idx);
			sb.append("&comment_ref=");
			sb.append(comment_ref);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;");

			if(i==totalPage){
				break;
			}
		}
		if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup+1)*pageSize+1;
			sb.append(temp);
			sb.append("&com_idx=");
			sb.append(com_idx);
			sb.append("&comment_ref=");
			sb.append(comment_ref);
			sb.append("'>&gt;&gt;</a>");
		}
		return sb.toString();
	}

}