<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태 신청 내역</title>
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

    /* 사원정보 필드셋 스타일 */
    #mywork {
        width: 50%; 
        float: left;
    }

    /* 테이블 스타일 */
    #table {
        width: 50%; /* 오른쪽 컨텐츠와 겹치지 않도록 폭 조절 */
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

    @media only screen and (max-width: 768px) {
        /* 화면 너비가 768px 이하일 때 */
        #menu, #mywork, #table {
            width: 100%; /* 모든 요소를 화면 너비의 100%로 설정 */
            float: none; /* float 해제 */
            margin-left: 0; /* 왼쪽 여백 초기화 */
            padding-right: 0; /* 오른쪽 여백 초기화 */
            border-right: none; /* 우측 테두리 제거 */
        }
    }
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    // 조회 버튼 클릭 시 이벤트 처리
    $('#queryBtn').click(function() {
        var months = parseInt($('#months').val()); // 선택한 개월 수 가져오기
        $('#workTableBody').empty(); // 이전에 표시된 내용을 지우고 새로운 데이터로 갱신
        displayData(months);
    });

    // 초기 데이터 표시
    displayData(1);

    // 데이터 표시 함수
    function displayData(months) {
        var today = new Date(); // 현재 날짜 가져오기
        var currentYear = today.getFullYear(); // 현재 연도 가져오기
        var currentMonth = today.getMonth() + 1; // 현재 월 가져오기

        // 선택한 개월 수만큼 반복하여 데이터 생성
        for (var i = 0; i < months; i++) {
            var newRow = $('<tr>'); // 새로운 행 생성

            // 현재 월과 이전 월을 구분하여 데이터 생성
            var targetYear = currentYear;
            var targetMonth = currentMonth - i;
            if (targetMonth <= 0) { // 이전 연도의 경우
                targetYear--;
                targetMonth = 12 + targetMonth;
            }

            var period = targetYear + '년 ' + targetMonth + '월'; // 기간 설정

            // 이번 달의 평일 수 계산
            var daysInMonth = new Date(targetYear, targetMonth, 0).getDate(); // 현재 달의 총 일수를 구합니다.
            var weekdays = 0; // 평일 수를 저장할 변수
            for (var day = 1; day <= daysInMonth; day++) {
                var currentDay = new Date(targetYear, targetMonth - 1, day); // 현재 날짜 생성
                if (currentDay.getDay() % 6 !== 0) { // 일요일(0) 또는 토요일(6)이 아닌 경우(평일)
                    weekdays++;
                }
            }
            
            function getWeekdaysBeforeToday() {
                var yesterday = new Date(today); // 복사하여 어제의 날짜 생성
                yesterday.setDate(yesterday.getDate() - 1); // 어제로 날짜 설정
                var weekdaysBeforeToday = 0; // 어제까지의 평일 수를 저장할 변수
                for (var day = 1; day <= yesterday.getDate(); day++) {
                    var currentDay = new Date(today.getFullYear(), today.getMonth(), day); // 어제부터 현재까지의 날짜 생성
                    if (currentDay.getDay() % 6 !== 0) { // 일요일(0) 또는 토요일(6)이 아닌 경우(평일)
                        weekdaysBeforeToday++;
                    }
                }
                return weekdaysBeforeToday;
            }
           
            // 연차, 반차, 외근, 출장, 휴가, 경조 값 계산
            var a = 0;
            var b = 0;
            var c = 0;
            var d = 0;
            var e = 0;
            var f = 0;
            
            // 내 근무일 수 설정 (첫 번째 행에서만 어제까지의 평일 수로 설정)
            var myWorkingDays = (i === 0) ? getWeekdaysBeforeToday() : weekdays;

            // lists를 이용하여 값 계산
            <c:forEach var="dto" items="${lists}">
                if ("${dto.work_date.substring(0, 4)}" == targetYear && "${dto.work_date.substring(5, 7)}" == targetMonth) {
                    <c:choose>
                        <c:when test="${dto.work eq 0}">
                            a += ${dto.work_day};
                        </c:when>
                        <c:when test="${dto.work eq 1}">
                            b += ${dto.work_day};
                        </c:when>
                        <c:when test="${dto.work eq 2}">
                            c += ${dto.work_day};
                        </c:when>
                        <c:when test="${dto.work eq 3}">
                            d += ${dto.work_day};
                        </c:when>
                        <c:when test="${dto.work eq 4}">
                            e += ${dto.work_day};
                        </c:when>
                        <c:when test="${dto.work eq 5}">
                            f += ${dto.work_day};
                        </c:when>
                    </c:choose>
                }
            </c:forEach>

            // 각 셀에 데이터 추가
            newRow.append('<td>' + period + '</td>');
            newRow.append('<td>' + weekdays + '</td>'); // 총 근무일로 이번 달의 평일 수 설정
            newRow.append('<td>' + (myWorkingDays -a -e -f) + '</td>'); // 내 근무일로 어제까지의 평일 수 설정
            newRow.append('<td>' + a + '</td>');
            newRow.append('<td>' + b + '</td>'); 
            newRow.append('<td>' + c + '</td>'); 
            newRow.append('<td>' + d + '</td>'); 
            newRow.append('<td>' + e + '</td>'); 
            newRow.append('<td>' + f + '</td>'); 
            

            $('#workTableBody').append(newRow); 
        }
    }
});
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
<h3>근태내역</h3>
<h4><a href="work_Writeform.do">신청하기</a></h4>
<div id=mywork>
<fieldset>
    <legend><h4>내 근태 신청내역</h4></legend>
    <table width="650" border="1" cellspacing="0">
        <thead>
            <tr>
                <th>처리상태</th>
                <th>구분</th>
                <th>신청일수</th>
                <th>신청일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="dto" items="${lists}">
                <tr>               
                    <td>
                        <c:choose>
                            <c:when test="${dto.status eq 0}">신청완료</c:when>
                            <c:when test="${dto.status eq 1}">승인완료</c:when>
                            <c:when test="${dto.status eq 2}">승인실패</c:when>
                            <c:otherwise>알 수 없음</c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${dto.work eq 0}">연차</c:when>
                            <c:when test="${dto.work eq 1}">반차</c:when>
                            <c:when test="${dto.work eq 2}">외근</c:when>
                            <c:when test="${dto.work eq 3}">출장</c:when>
                            <c:when test="${dto.work eq 4}">휴가</c:when>
                            <c:when test="${dto.work eq 5}">경조</c:when>
                            <c:otherwise>알 수 없음</c:otherwise>
                        </c:choose>
                    </td>
                    <td>${dto.work_day}</td>
                    <td>${dto.work_date.substring(0, 10)}</td>
                </tr>
            </c:forEach>
            <c:if test="${empty lists}">
                <tr>
                    <td colspan="4">내 근태 신청 내역이 없습니다.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
</fieldset>
</div>
<div id=table>
<form method="post" name="">
    <select id="months" name="months">
        <option value="1" selected>1개월</option>
        <option value="3">3개월</option>
        <option value="6">6개월</option>
        <option value="12">12개월</option>
    </select>
    &nbsp;&nbsp;&nbsp;
    <input type="button" value="조회" id="queryBtn">
</form>
<br>
<table id="workTable" width="650" border="1" cellspacing="0">
    <thead>
        <tr>
            <th>기간</th>
            <th>총근무일</th>
            <th>내근무일</th>
            <th>연차</th>
            <th>반차</th>
            <th>외근</th>
            <th>출장</th>
            <th>휴가</th>
            <th>경조</th>
        </tr>
    </thead>
    <tbody id="workTableBody">
    </tbody>
</table>
</div>
</body>
</html>
