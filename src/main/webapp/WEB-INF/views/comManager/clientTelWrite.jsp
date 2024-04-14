<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="clientTelWrite.do" method="post">
<h1>연락망 추가</h1>
<hr>
<input type="hidden" name="com_idx" value="${cdto.com_idx }">
<table style="width:800px">
<tr>
	<th style="width:100px; height: 50px;">기업명</th>
	<td><input class="text2" type="text" name="com_name"></td>
</tr>
<tr>
	<th style="width:100px; height: 50px;">대표자</th>
	<td><input class="text2" type="text" name="ceo"></td>
</tr>
<tr>
	<th style="width:100px; height: 50px;">전화번호</th>
	<td><input class="text2" type="text" name="tel"></td>
</tr>
<tr>
	<td></td>
	<td><input class="submit" type="submit" value="저장"></td>
</tr>
</table>
</form>