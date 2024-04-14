<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<form name="join" action="memberJoin.do" method="post" onsubmit="combine()">
<table>
<tr>
	<th width="100px">* 기업</th>
	<td><input class="text2" type="text" name="com_idx_show" placeholder="기업 조회" readonly>
		<input type="hidden" name="com_idx" required>
	
	</td>
	<td>
	<input class="push1" type="button" value="조회" onclick="com_show()"></td>
</tr>
<tr>
	<th>* 이름</th>
	<td><input class="text2" type="text" name="name" placeholder="이름" minlength="2" maxlength="8" required>
	</td>
</tr>
<tr>
	<th>* ID</th>
	<td><input class="text2" type="text" name="id" placeholder="ID (소문자로 변환됨)" pattern="[a-zA-Z0-9]+" minlength="4" maxlength="8" required>
	</td>
	<td>
	<input class="push1" type="button" value="중복확인" onclick="idCheckMsg()"></td>
</tr>
<tr>
	<td></td>
	<td><span id="idCheckMsg"></span></td>
</tr>
<tr>
	<th>* PW</th>
	<td><input class="text2" type="password" name="pwd" placeholder="비밀번호" minlength="4" maxlength="8" required></td>
</tr>
<tr>
	<th>* Email</th>
	<td colspan="2">
		<input class="text3" width="200px" type="text" id="email1" name="email1" placeholder="Email" required>
		@
		<input class="text3" type="text" id="email2" name="email2" placeholder="mail.com" required>
	
		<select class="text3" name="emails" onchange="email_change()">
			<option value="1" selected>직접 입력</option>
			<option value="naver.com">naver.com</option>
			<option value="gmail.com">gmail.com</option>
			<option value="hanmail.com">hanmail.com</option>
		</select>		
	</td>
</tr>
<tr>
	<th>주소</th>
<td>
	<input class="text3" type="text" id="sample4_postcode" name="addr1" placeholder="우편번호" required>
	<input class="push1" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
	<input class="text2" type="text" id="sample4_roadAddress" name="adrr2" placeholder="도로명주소" readonly>
	<input class="text2" type="text" id="sample4_jibunAddress" name="addr3" placeholder="지번주소" readonly>
	<span id="guide" style="color:#999;display:none"></span>
	<input class="text2" type="text" id="sample4_detailAddress" name="addr4" placeholder="상세주소">
	<input class="text2" type="text" id="sample4_extraAddress" name="addr5" placeholder="참고항목">
</td>
</tr>
<tr>
	<th>TEL</th>
	<td><input class="text2"  type="text" name="tel" placeholder="전화번호 (숫자만 입력)" pattern="[0-9]+"></td>
</tr>
<tr>
	<th>* 주민번호</th>
	<td>
		<input class="text3"  type="text" id="hum_num1" name="hum_num1" placeholder="생년월일" pattern="[0-9]+" minlength="6" maxlength="6" required>
		-
		<input class="text3"  type="password" id="hum_num2" name="hum_num2" placeholder="뒷자리" pattern="[0-9]+" minlength="7" maxlength="7" required>	
	</td>
</tr>

<tr>
	<th>* 부서</th>
	<td>
	<select class="text3" name="dept" id="dept"></select>
	<td>
</tr>

<tr>
	<td align="center" colspan="3">
	<input class="submit" type="submit" value="가입하기">
	</td>
</tr>
</table>
<input type="hidden" id="hum_num" name="hum_num">
<input type="hidden" id="addr" name="addr">
<input type="hidden" id="email" name="email">
</form>