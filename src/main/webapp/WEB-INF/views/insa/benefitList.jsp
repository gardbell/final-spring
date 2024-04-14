<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 복지 신청내역</title>
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

  
    #table {
        width: calc(50% - 140px); /* 오른쪽 컨텐츠와 겹치지 않도록 폭 조절 */
        float: left;
        margin-top: 40px; /* 테이블과 사원정보 필드셋 사이의 간격을 더 넓게 조절 */
    }

    #workTable {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px; /* 테이블과 제목 사이의 간격 조절 */
    }

    #workTable th, #workTable td {
        padding: 10px;
        border: 1px solid #ddd;
        text-align: right;
    }

    #workTable th {
        background-color: skyblue;
        color: white;
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
<div id="mybenefit">
<fieldset>
    <legend><b>내 복지 신청내역</b></legend>
    <table width="650" border="1" cellspacing="0">
        <thead>
            <tr>
            <th>신청일자</th>
            <th>구분</th>
            <th>신청일</th>
            <th>처리상태</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="dto" items="${lists}">
                    <c:set var="status" value="${dto.status}" />
                    <c:set var="statusOutput">
                        <c:choose>
                            <c:when test="${status == 0}">신청완료</c:when>
                            <c:when test="${status == 1}">승인완료</c:when>
                            <c:when test="${status == 2}">승인거절</c:when>
                            <c:otherwise>알 수 없음</c:otherwise>
                        </c:choose>
                    </c:set>
                    <tr>               
                        <td>${dto.bdate.substring(0, 10)}</td>
                        <td>${dto.sort}</td>
                        <td>${dto.writedate}</td>
                        <td>${statusOutput}</td>
                    </tr>
            </c:forEach>
            <c:if test="${empty lists}">
                <tr>
                    <td colspan="5">내 복지 신청 내역이 없습니다.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
</fieldset>
</div>
</body>
</html>
