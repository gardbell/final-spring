<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>복지신청폼</title>
<style>
    /* 전체 페이지 스타일 */
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }

    /* 페이지 타이틀 스타일 */
    h1 {
        color: DarkSlateBlue;
        text-align: center;
        margin-top: 20px;
    }

    /* 왼쪽 메뉴 스타일 */
    #menu {
        width: 200px;
        float: left;
        border-right: 2px solid black;
        margin-right: 40px; /* 여백을 더 넓게 조절 */
        padding-left: 20px; /* 여백을 더 넓게 조절 */
        padding-right: 40px; /* 여백을 더 넓게 조절 */
        margin-left: calc(40% - 620px); /* 페이지 중앙에 위치하도록 조절 */
    }

    #menu h2 {
        text-align: left;
    }

    #menu h2 a {
        display: block;
        margin-bottom: 10px; /* 링크 사이의 간격 조절 */
        text-decoration: none;
        color: #333; /* 링크 색상 변경 */
    }
    
    #menu2 h2 a {
        
        text-decoration: none;
        color: #333; /* 링크 색상 변경 */
    }

    
    #mybenefit {
        width: calc(50% - 140px); 
        float: left;
    }

  
</style>
</head>
<body>
<h1>인사관리</h1>
<br>
<div id="menu">
    <h2>
    	<a href="goMain.do">메인</a><br>
        <a href="insa.do">급여</a><br>
        <a href="workList.do?idx=${dto.getIdx()}">근태</a><br>
        <a href="benefitList.do?idx=${dto.getIdx()}">복지</a><br>
        <a href="insaUpdate.do?id=${dto.getId()}">개인정보수정</a><br>
        <a href="memberDel.do?id=${dto.getId()}">회원탈퇴</a>
    </h2>
</div>
<div id="menu2">
	<h4>
		<a href="bindex.do">경조사안내</a>&nbsp;
		<a href="benefitList.do?idx=${dto.getIdx() }">내 신청내역</a>&nbsp;
		<a href="benefit_Writeform.do">신청하기</a>
	</h4>
</div>
<br>
<h3>복지 신청하기</h3>
	<input type="hidden" name="idx" value="${dto.getIdx()}">
<form name="benefitWrite" action="benefitWrite.do" method="post">
<table>
	<tr>
		<th>이름</th>
		<td>${dto.getName() }</td>
	<tr>	
	<tr>
    <th>구분</th>
    <td>
        <select name="sort">
            <option value="결혼">결혼</option>
            <option value="수연">수연</option>
            <option value="출산">출산</option>
            <option value="사망">사망</option>
            <option value="기타">기타</option>
        </select>
    </td>
	</tr>
	<tr>
		<th>신청일자</th>
		<td><input type="date" name="bdate"></td>
	</tr>
	<tr>
		<td colspan="4">
			<br>
			<textarea rows="6" cols="60" name="bnote"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4" align="center">
			<input type="submit" value="신청하기">
			<input type="reset" value="다시작성">
		</td>
	</tr>
</table>
</form>
</body>
</html>