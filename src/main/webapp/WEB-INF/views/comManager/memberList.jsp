<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<h1>사원 목록</h1>
<hr>
<select class="text3" id="proof" name="proof" onchange="proof()">
	<option value="9">선택하십시오.</option>
	<option value="1">전체</option>
	<option value="2">관리자</option>
	<option value="3">일반회원</option>
	<option value="0">미승인</option>
</select>
<br><br>
<table style="width: 1200px;" border=1  frame=below rules=rows>
<tr style="height: 50px">
	<th style="width: 100px">이름</th>
	<th style="width: 100px">아이디</th>
	<th style="width: 200px">이메일</th>	
	<th style="width: 300px">주소</th>	
	<th style="width: 150px">전화번호</th>	
	<th style="width: 100px">부서</th>	
	<th style="width: 100px">월급</th>	
	<th style="width: 100px">입사일</th>	
	<th style="width: 50px">승인</th>	
</tr>
<c:forEach var="member" items="${list }">
<tr style="height: 50px">
	<td><a class="link" href='javascript:void(0);' onclick="update('${member.id}');">${member.name }</a></td>
	<td>${member.id}</td>
	<td>${member.email}</td>
	<td>${fn:replace(member.addr,'/','<br>')}</td>
	<td>${member.tel}</td>
	<td>${member.dept}</td>
	<td>${member.sal}</td>
	<td>${member.hiredate}</td>
	<c:if test="${member.rank_num==0}">
		<td><input class="push2" type="button" value="승인" onclick="promotion('${member.idx}')"></td>
	</c:if>
	<c:if test="${member.rank_num!=0}">
		<td style="text-align: center"><b>승인</b></td>
	</c:if>
</tr>
</c:forEach>
</table>