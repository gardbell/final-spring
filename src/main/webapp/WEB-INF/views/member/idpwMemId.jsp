<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form name="idpwMid" action="idpwMemId.do" method="post">
<table>
<tr>
	<th colspan="2">회원 아이디 찾기</th>
</tr>
<tr>
	<td>
		<input class="text" type="text" name="name" placeholder="이름" autocomplete="off" required>
	</td>
	<td>
		<input class="text" type="text" name="email" placeholder="Email" autocomplete="off" required>
		</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input class="push1" type="submit" value="조회">
	</td>
</tr>
</table>
</form>