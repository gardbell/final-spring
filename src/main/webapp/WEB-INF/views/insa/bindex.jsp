<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경조사비용 표</title>
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

       

        #menu2 h4 a {
            text-decoration: none;
            color: #333; /* 링크 색상 변경 */
        }

        /* 테이블 스타일 */
        #mybenefit table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px; /* 테이블과 제목 사이의 간격 조절 */
        }

        #mybenefit th, #mybenefit td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }

        #mybenefit th {
            background-color: skyblue;
            color: white;
        }

        /* 추가 스타일 */
        #mybenefit hr {
            margin-top: 20px;
            margin-bottom: 20px;
        }

        #mybenefit li {
            margin-left: 20px;
        }
    </style>

</head>
<body>
<h1>인사관리</h1>
<br>
<div id="menu2">
	<h4>
		<a href="bindex.do">경조사안내</a>&nbsp;
		<a href="benefitList.do?idx=${dto.getIdx() }">내 신청내역</a>&nbsp;
		<a href="benefit_Writeform.do">신청하기</a>
	</h4>
</div>
<div id="mybenefit">
<h2>경조사비용 표</h2>
<table>
    <tr>
    	<th></th>
        <th>구분</th>
        <th>경조금</th>
        <th>휴가</th>
        <th>화환</th>
        <th>상조물품</th>
        <th>장례서비스</th>
    </tr>
    <tr>
        <td rowspan="3">결혼</td>
        <td>본인</td>
        <td>50만원</td>
        <td>7일</td>
        <td>O</td>

    </tr>
    <tr>
        <td>본인,배우자의 형제자매</td>
        <td>10만원</td>
        <td>1일</td>
        <td>X</td>

    </tr>
    <tr>
        <td>자녀의 결혼</td>
        <td>10만원</td>
        <td>1일</td>
        <td>X</td>

    </tr>
    <tr>
        <td rowspan="2">수연(환갑,칠순)</td>
        <td>본인,배우자의 부모</td>
        <td>20만원</td>
        <td>1일</td>
        <td>X</td>
        
    </tr>
    <tr>
        <td>본인,배우자의 부모</td>
        <td>20만원</td>
        <td>1일</td>
        <td>X</td>
        
    </tr>
    <tr>
        <td rowspan="8">사망</td>
        <td>본인</td>
        <td>500만원</td>
        <td>-</td>
        <td>O</td>
        <td>O</td>
        <td>O</td>
    </tr>
    <tr>
        <td>배우자</td>
        <td>100만원</td>
        <td>6일</td>
        <td>O</td>
        <td>O</td>
        <td>O</td>
    </tr>
    <tr>
        <td>본인,배우자의 부모</td>
        <td>50만원</td>
        <td>6일</td>
        <td>O</td>
        <td>O</td>
        <td>O</td>
    </tr>
    <tr>
        <td>자녀</td>
        <td>50만원</td>
        <td>6일</td>
        <td>O</td>
        <td>O</td>
        <td>O</td>
    </tr>
    <tr>
        <td>본인의 형제자매</td>
        <td>20만원</td>
        <td>3일</td>
        <td>O</td>
        <td>O</td>
        <td>O</td>
    </tr>
    <tr>
        <td>배우자의 형제자매</td>
        <td>10만원</td>
        <td>3일</td>
        <td>O</td>
        <td>O</td>
        <td>O</td>
    </tr>
    <tr>
        <td>본인,배우자의(외)조부모</td>
        <td>20만원</td>
        <td>3일</td>
        <td>O</td>
        <td>O</td>
        <td>O</td>
    </tr>
    <tr>
        <td>본인,배우자 부모의 형제자매</td>
        <td>-</td>
        <td>1일</td>
        <td>X</td>
        <td>X</td>
        <td>X</td>
    </tr>
    <tr>
        <td rowspan="2">출산</td>
        <td>본인</td>
        <td>50만원</td>
        <td>90일</td>
        <td>O</td>

    </tr>
    <tr>
        <td>배우자</td>
        <td>50만원</td>
        <td>10일</td>
        <td>O</td>
    </tr>
</table>
<ul style="list-style:none;">
<li>경조 휴가는 경조일로부터 휴일 포함하여 적용</li>
<li>배우자 출산 휴가는 발생일 기준 90일 이내에 1회 분할 사용 가능, 10일 유급 휴가 사용 가능</li>
<li>&nbsp;</li>
<li><b>## 경조사 인정 범위 ##</b></li>
<li>&nbsp;&nbsp;- 회사가 증명을 요구 할 경우 증명서류 제출 필요</li>
<li>&nbsp;&nbsp;- 경조일로부터 10주 이내 신청한 건에 대해서 지원함 (증빙서류 미제출 시 경조 지원불가)</li>
<li>&nbsp;&nbsp;- 사전에 경사일이 확정 된 행사는 경사일 기준 15일 전 신청 필수 (결혼,환갑,칠순 등)</li>
</ul>
<hr>
</div>

</body>
</html>
