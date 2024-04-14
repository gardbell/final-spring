<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form name="join" action="companyJoin.do" method="post" enctype="multipart/form-data">
<table>
<tr>
	<th width="100px">* 기업명</th>
	<td><input class="text2" type="text" name="com_name" placeholder="기업 조회">
	</td>
	<td>
	<input class="push1" type="button" value="중복확인" onclick="comCheck()"></td>
</tr>
<tr>
	<td></td>
	<td><span id="comCheck"></span></td>
</tr>
<tr>
	<th>* 기업<br>&nbsp;&nbsp;대표자</th>
	<td colspan="2">
		<input class="text2" type="text" name="ceo" placeholder="이름" required>
	</td>
</tr>
<tr>
	<th>* 부서</th>
	<td colspan="2">
		<input class="text2" type="text" name="dept" placeholder="'/'으로 구분 (ex. 대표/인사과/홍보팀)"></td>
</tr>
<tr>
	<th>* 직급체계</th>
	<td colspan="2">
		<input class="text2" type="text" name="position" placeholder="'/'으로 구분 (ex. 사장/이사/부장)"></td>
</tr>
<tr>
	<th>* 사업자<br>&nbsp;&nbsp;등록번호</th>
	<td colspan="2">
		<input class="text2" type="text" name="cr_num" placeholder="사업자 등록번호">
	</td>
</tr>
<tr>
	<th>이미지<br>등록</th>
<td>
	<input type="file" name="fupload" value="이미지등록" onchange="fileUp(this)">
</td>
</tr>
<tr>
	<td align="center" colspan="3">
	<input class="submit" type="submit" value="가입하기">
	</td>
</tr>
</table>
</form>