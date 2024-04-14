<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>인사관리</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h1 {
            color: DarkSlateBlue;
            text-align: center;
            margin-top: 20px;
        }

        #menu {
            width: 200px;
            float: left;
            border-right: 2px solid black;
            margin-right: 50px; /* 여백을 더 넓게 조절 */
            padding-left: 20px; /* 여백을 더 넓게 조절 */
            padding-right: 50px; /* 여백을 더 넓게 조절 */
            margin-left: calc(50% - 620px); /* 페이지 중앙에 위치하도록 조절 */
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

        /* 테이블 스타일 */
        #table {
            width: calc(50% - 150px); /* 오른쪽 컨텐츠와 겹치지 않도록 폭 조절 */
            float: left;
            margin-top: 10px; 
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

<div id="table">
    <h2>개인정보 수정</h2>
    <form name="update" action="update.do?id=${mdto.id}" method="post">
        <table style="width:800px">
            <tr>
                <th style="width:100px; height: 50px; text-align: left;">아이디</th>
                <td>${mdto.id }</td>
            </tr>
            <tr>
                <th style="width:100px; height: 50px; text-align: left;">비밀번호</th>
                <td><input class="text2" type="password" name="pwd" size="50" required></td>
            </tr>
            <tr>
                <th style="width:100px; height: 50px; text-align: left;">이름</th>
                <td><input class="text2" type="text" name="name" size="50" value="${mdto.name}"></td>
            </tr>
            <tr>
                <th style="width:100px; height: 50px; text-align: left;">이메일</th>
                <td><input class="text2" type="text" name="email" size="50" value="${mdto.email}"></td>
            </tr>
            <tr>
                <th style="width:100px; height: 50px; text-align: left;">주소</th>
                <td><input class="text2"  type="text" name="addr" size="50" value="${mdto.addr}"></td>
            </tr>
            <tr>
                <th style="width:100px; height: 50px; text-align: left;">전화번호</th>
                <td><input class="text2"  type="text" name="tel" size="50" value="${mdto.tel}"></td>
            </tr>
            <tr>
                <th style="width:100px; height: 50px; text-align: left;">부서</th>
                <td><input class="text2"  type="text" name="dept" size="50" value="${mdto.dept}"></td>
            </tr>
            <tr>
                <th style="width:100px; height: 50px; text-align: left;">월급</th>
                <td><input class="text2"  type="text" name="sal" size="50" value="${mdto.sal}"></td>
                <td><input type="hidden" name="rank_num" value="${mdto.rank_num}"></td>
            </tr>
            <tr>
                <td style="width:100px; height: 50px;"></td>
                <td><input class="submit" type="submit" value="수정"></td>
            </tr>
        </table>
    </form>

</div>


</body>
</html>
