package com.ace.page;

public class Com_memberListPage {
public static String makePage(String pagename,int totalCnt,int listSize,int pageSize,int cp,int com_idx) {
		
		int totalPage = (totalCnt/listSize)+1;
		if(totalCnt%listSize==0)totalPage--;
		
		int userGroup=cp/pageSize;
		if(cp%pageSize==0)userGroup--;
		
		StringBuffer sb = new StringBuffer();
		
		if(userGroup!=0){
			int temp=(userGroup-1)*pageSize+pageSize;
			
			sb.append("<a href='javascript:void(0);' onclick='show3(");
			sb.append(temp);
			sb.append(");'>&lt;&lt;</a>");
			
		}
		for(int i=(userGroup*pageSize)+1;i<=(userGroup*pageSize)+pageSize;i++){
			
			sb.append("&nbsp;&nbsp;<a href='javascript:void(0);' onclick='show3(");
			sb.append(i);
			sb.append(");'>");
			sb.append(i);
			sb.append("</a>");

			if(i==totalPage){
				break;
			}
			
		}
		if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
			int temp = (userGroup+1)*pageSize+1;
			
			sb.append("<a href='javascript:void(0);' onclick='show3(");
			sb.append(temp);
			sb.append(");'>&gt;&gt;</a>");
		}
		return sb.toString();
	}

}
