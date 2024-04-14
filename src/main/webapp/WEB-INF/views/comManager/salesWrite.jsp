<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form action="salesWriteOk.do" method="post">
<h1>매출 추가</h1>
<hr>
<input type="hidden" name="com_idx" value="${cdto.com_idx }">
<table style="width:800px">
<tr>
	<th style="width:100px; height: 50px;">상품명</th>
	<td>
		<select class="text3" name="item_idx">
			<c:forEach var="item" items="${list}">
			<option value="${item.item_idx }">${item.item_name}</option>
			</c:forEach>
		</select>
	</td>
</tr>
<tr>
	<th style="width:100px; height: 50px;">작성날짜</th>
	<td>
		<select class="text3" name="year">
			<c:forEach var="y" begin="2020" end="2050">
			<option value="${y}">${y}</option>
			</c:forEach>
		</select>&nbsp;년&nbsp;&nbsp;
		<select class="text3" name="month">
			<c:forEach var="m" begin="1" end="12">
			<option value="${m}">${m}</option>
			</c:forEach>
		</select>&nbsp;월&nbsp;&nbsp;
		<select class="text3" name="date">
			<c:forEach var="d" begin="1" end="31">
			<option value="${d}">${d}</option>
			</c:forEach>
		</select>&nbsp;일&nbsp;&nbsp;
	</td>
</tr>
<tr>
	<th style="width:100px; height: 50px;">매출액</th>
	<td><input class="text2" type="text" name="sales"></td>
</tr>

<tr>
	<td></td>
	<td><input class="submit" type="submit" value="저장하기"></td>
</tr>
</table>
</form>