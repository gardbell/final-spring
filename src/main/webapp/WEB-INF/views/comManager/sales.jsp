<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>
<h1>매출 현황</h1>
<hr>
<div align="left">
<input class="push1"  type="button" value="기록추가" onclick="newSales()">
&nbsp;&nbsp;&nbsp;&nbsp;
<input class="push1"  type="button" value="상품추가" onclick="newProduct()">
&nbsp;&nbsp;&nbsp;&nbsp;
<input class="push1"  type="button" value="날짜별보기" onclick="chart()">
</div>
<br>
<div style="display: inline-block; margin-right: 30px; vertical-align: top">
<table style="width: 500px" border=1  frame=below rules=rows>
<tr style="height: 50px">
	<th>이름</th>
	<th>작성일</th>
	<th>매출액</th>
	<th>삭제</th>
</tr>
<c:if test="${empty list}">
<tr>
	<td colspan="3">정보가 없습니다.</td>
</tr>
</c:if>
<c:forEach var="a" items="${list }" varStatus="status">
<tr style="height: 50px; text-align: center">
	<td>${a.item_name}</td>
	<td>${a.writedate }</td>
	<td>${a.sales }</td>
	<td>
		<input class="push2"  type="button" value="삭제" onclick="delSale('${a.writedate.getYear()}','${a.writedate.getMonth()}','${a.writedate.getDate()}')">
	</td>
</tr>
</c:forEach>
</table>
</div>
<div style="display: inline-block;">
<canvas id="myChart" width="400" height="400"></canvas>
</div>
</body>
