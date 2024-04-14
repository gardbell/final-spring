<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="memberUpdate.do?id=${mdto.id }" method="post">
<h1>회원 수정</h1>
<hr>
<table style="width:800px">
<tr>
	<th style="width:100px; height: 50px;">아이디</th>
	<td>&nbsp;&nbsp;&nbsp;${mdto.id }</td>
</tr>
<tr>
	<th style="width:100px; height: 50px;">이름</th>
	<td><input class="text2" type="text" name="name" value="${mdto.name}"></td>
</tr>
<tr>
	<th style="width:100px; height: 50px;">이메일</th>
	<td><input class="text2" type="text" name="email" value="${mdto.email}"></td>
</tr>
<tr>
	<th style="width:100px; height: 50px;">주소</th>
	<td><input class="text2"  type="text" name="addr" value="${mdto.addr}"></td>
</tr>
<tr>
	<th style="width:100px; height: 50px;">전화번호</th>
	<td><input class="text2"  type="text" name="tel" value="${mdto.tel}"></td>
</tr>
<tr>
	<th style="width:100px; height: 50px;">부서</th>
	<td><input class="text2"  type="text" name="dept" value="${mdto.dept}"></td>
</tr>
<tr>
	<th style="width:100px; height: 50px;">월급</th>
	<td><input class="text2"  type="text" name="sal" value="${mdto.sal}"></td>
</tr>
<tr>
	<th style="width:100px; height: 50px;">승인 여부</th>
	<td>
		<input type="radio" name="rank_num" value="0" checked>미승인
		<input type="radio" name="rank_num" value="3">회원
		<input type="radio" name="rank_num" value="2">관리자
	</td>
</tr>
<tr>
	<td style="width:100px; height: 50px;"></td>
	<td><input class="submit" type="submit" value="수정"></td>
</tr>
</table>
</form>