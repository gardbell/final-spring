<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

    /* 왼쪽 메뉴 스타일 */
    #menu {
        width: 200px; /* 이전 코드와 동일한 값 유지 */
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
        margin-bottom: 10px; 
        text-decoration: none;
        color: #333; 
    }

    
    #employeeInfo {
        width: 50%; 
        float: left;
    }

    
    #table {
        width: 50%; 
        float: left;
        margin-top: 40px; 
    }
   
   
    #salaryTable {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px; 
    }

    #salaryTable th, #salaryTable td {
        padding: 10px;
        border: 1px solid #ddd;
        text-align: right;
    }

    #salaryTable th {
        background-color: skyblue;
        color: white;
    }

    
    @media only screen and (max-width: 768px) {
        
        #menu, #employeeInfo, #table {
            width: 100%; 
            float: none; 
            margin-left: 0; 
            padding-right: 0; 
            border-right: none; 
        }
    }
</style>
<script>
document.addEventListener("DOMContentLoaded", function() {
   
    document.getElementById("months").value = "1";
    show();
});

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function show() {
    var months = parseInt(document.getElementById("months").value);
    var today = new Date();
    var year = today.getFullYear();
    var month = today.getMonth() + 1;
    
    var table = document.getElementById("salaryTable");
    var tbody = table.getElementsByTagName("tbody")[0];
    tbody.innerHTML = ""; 
    
    for (var i = 0; i < months; i++) {
        
        month -= 1;
        if (month === 0) {
            year -= 1;
            month = 12;
        }

        var sal = parseFloat("${dto.getSal()}");
        sal *= (year < today.getFullYear()) ? 0.96 : 1; 
        
        var a = (sal <= 14000000) ? Math.round(sal * 0.06) : (sal <= 50000000) ? Math.round(sal * 0.15) : Math.round(sal * 0.24);
        var b = a * 0.1;
        var c = Math.round(sal * 0.045);
        var d = Math.round(sal * 0.035);
        var e = Math.round(sal * 0.009);
        var sum = a + b + c + d + e;
        var rs = sal - sum;

        var newRow = tbody.insertRow();
        var cell1 = newRow.insertCell(0);
        var cell2 = newRow.insertCell(1);
        var cell3 = newRow.insertCell(2);
        var cell4 = newRow.insertCell(3);
        var cell5 = newRow.insertCell(4);
        var cell6 = newRow.insertCell(5);
        var cell7 = newRow.insertCell(6);
        var cell8 = newRow.insertCell(7);
        
        var period = year + "년 " + month + "월";
        cell1.innerHTML = period;
        cell2.innerHTML = numberWithCommas(sal.toFixed(0)); 
        cell3.innerHTML = numberWithCommas(a.toFixed(0));
        cell4.innerHTML = numberWithCommas(b.toFixed(0));
        cell5.innerHTML = numberWithCommas(c.toFixed(0));
        cell6.innerHTML = numberWithCommas(d.toFixed(0));
        cell7.innerHTML = numberWithCommas(e.toFixed(0));
        cell8.innerHTML = numberWithCommas(rs.toFixed(0));
    }
}
</script>
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
<div id="employeeInfo">
<fieldset>
    <legend><h4>사원정보</h4></legend>
    <table>
        <tr>
            <th>이름</th>
            <td>${dto.getName()}&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <th>입사일</th>
            <td>${dto.getHiredate()}</td>
        </tr>
        <tr>
            <th>부서</th>
            <td>${dto.getDept()}&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <th>연락처</th>
            <td>${dto.getTel()}</td>
        </tr>
        <tr>
            <th>사번</th>
            <td>${dto.getIdx()}&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <th>E-mail</th>
            <td>${dto.getEmail()}</td>
        </tr>
    </table>
</fieldset>
</div>
<div id="table">
<h3>급여내역</h3>
<form method="post" name="">
    <select id="months" name="months">
        <option value="1">1개월</option>
        <option value="3">3개월</option>
        <option value="6">6개월</option>
        <option value="12">12개월</option>
    </select >&nbsp;&nbsp;&nbsp;<input type="button" value="조회" onclick="show()">
</form>
<br>
<table id="salaryTable" width="650" border="1" cellspacing="0">
    <thead>
        <tr>
            <th>기간</th>
            <th>지급총액</th>
            <th>소득세</th>
            <th>지방소득세</th>
            <th>국민연금</th>
            <th>건강보험</th>
            <th>고용보험</th>
            <th>실수령</th>
        </tr>
    </thead>
    <tbody>
    </tbody>
</table>
</div>
</body>
</html>
