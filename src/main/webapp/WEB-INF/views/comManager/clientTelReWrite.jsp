<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="rewriteTel.do" method="post">
<h1>연락망 추가</h1>
<hr>
<input type="hidden" name="client_tel_idx" value="${tdto.client_tel_idx}">
<input type="hidden" name="com_idx" value="${cdto.com_idx }">
<table style="width:800px">
<tr>
	<th style="width:100px; height: 50px;">기업명</th>
	<td><input class="text2" type="text" name="com_name" value="${tdto.com_name }"></td>
</tr>
<tr>
	<th style="width:100px; height: 50px;">대표자</th>
	<td><input class="text2" type="text" name="ceo" value="${tdto.ceo }"></td>
</tr>
<tr>
	<th style="width:100px; height: 50px;">전화번호</th>
	<td><input class="text2" type="text" name="tel" value="${tdto.tel }"></td>
</tr>
<tr>
	<td></td>
	<td><input class="submit" type="submit" value="저장"></td>
</tr>
</table>
</form>