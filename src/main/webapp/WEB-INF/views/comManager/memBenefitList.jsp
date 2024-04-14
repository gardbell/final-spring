<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<h1>사원 복지목록</h1>
<hr>
<br><br>
<table style="width: 1200px;" border=1  frame=below rules=rows>
<tr style="height: 50px">
	<th style="width: 100px">이름</th>
	<th style="width: 100px">신청번호</th>
	<th style="width: 100px">부서</th>	
	<th style="width: 100px">구분</th>	
	<th style="width: 100px">신청일</th>	
	<th style="width: 300px">특이사항</th>		
	<th style="width: 50px">승인</th>	
</tr>
<c:forEach var="member" items="${list }">
<tr style="height: 50px">
	<td><a class="link" href='javascript:void(0);' onclick="update('${member.id}');">${member.name }</a></td>
	<td>${member.bidx}</td>
	<td>${member.dept}</td>
	<td>${member.sort}</td>
	<td>${member.bdate}</td>
	<td>${member.bnote}</td>
	<c:if test="${member.status==0}">
		<td><input class="push2" type="button" value="승인" onclick="benefitpromotion('${member.idx}')"></td>
	</c:if>
	<c:if test="${member.status!=0}">
		<td style="text-align: center"><b>승인</b></td>
	</c:if>
</tr>
</c:forEach>
</table>