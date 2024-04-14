<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h5>회사소식</h5>
<table style="width: 500px" border=1  frame=below rules=rows>
<tr>
	<th style="width: 100px">등록자</th>
	<th>제목</th>
	<th style="width: 100px">조회수</th>
</tr>
<c:if test="${empty list }">
		<tr>
			<td colspan="5" align="center">등록된 게시물이 없다.</td>
		</tr>
</c:if>
<c:forEach var="event" items="${list }">
<tr>
	<td>${event.news_writer}</td>
	<td>${event.news_title}</td>
	<td>${event.news_readnum}</td>
</tr>
</c:forEach>
</table>