<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h1>거래처 연락망</h1>
<hr>
<div align="left">
	<input class="push1" type="button" value="추가하기" onclick="newTel()">
</div>
<br>
<table style="width: 1200px" border=1  frame=below rules=rows>
<tr style="height: 50px">
	<th>기업명</th>
	<th>대표자</th>
	<th>전화번호</th>
	<th>수정</th>
	<th>삭제</th>
</tr>
<c:if test="${empty list}">
<tr>
	<td colspan="4"><b>내용이 없습니다.</b></td>
</tr>
</c:if>
<c:forEach var="tel" items="${list }">
<tr style="height: 50px;">
	<td>${tel.com_name }</td>
	<td>${tel.ceo }</td>
	<td>${tel.tel }</td>
	<td align="center">
		<input class="push1" type="button" value="수정" onclick="rewriteTel('${tel.client_tel_idx}')">
	</td>
	<td align="center">
		<input class="push1" type="button" value="삭제" onclick="location.href='delTel.do?client_tel_idx='+'${tel.client_tel_idx}'">
	</td>
</tr>
</c:forEach>
<tr style="height: 50px;">
	<td colspan="4" align="center">${pageStr}</td>
</tr>
</table>
