<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수익 현황</title>
</head>
<body>
	<div class="container mt-3">
		<form action="main_admin.do">
			<button id="Sbt" type="submit" class="btn btn btn-primary">메인으로</button>
		</form>
	</div>
	<h1 class="text-center mt-5 text-purple-light">수익 현황</h1>
	<h3 class="text-center mt-5" style="color: purple;">지난 6개월 수익</h3>
	<div class="container text-center mt-3">
		<canvas id="myChart" width="500" height="120"></canvas>
	</div>
	<div class="container">
	<h5 class="text-center mt-5 text-purple-light">총 수익 : ${totalIncome} (지난 6개월)<br><br>전월 대비 수익 증가율 : ${increaseIncome } %</h5>
	<br>
	</div>
	<h3 class="text-center mt-5 " style="color: purple;">기능별 그룹웨어 이용량</h3>
	<div class="container text-center mt-3">
		<canvas id="myPieChart" width="500" height="400"></canvas>
	</div>
	<div class="container">
	<h5 class="text-center mt-5 text-purple-light">최대 방문자 수 : ${maxCount} (${maxLabel})<br><br>방문 비율 : ${log_percentage } %</h5>
	<br>
	</div>
	<br><br>

	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script>
    //////////////////////////////////
    //파이차트
    // 데이터 정의
    // 동규= 회사소식, 동규= 경조사, ??= 결재문서, 수종= 스케줄, 태근= 인사관리, 동규= 메일, 준식= 기업관리
    // 각 사이트 이용량 수집
    var companyNews_Log = ${companyNews_Log};
    var companyEvent_Log = ${companyEvent_Log};
    var document_Log = ${document_Log};
    var schedule_Log = ${schedule_Log};
    var HR_Log = ${HR_Log};
    var mail_Log = ${mail_Log};
    var companyManage_Log = ${companyManage_Log};
    
    var data = {
        labels: ['회사소식', '경조사', '결재문서', '스케줄', '인사관리', '메일', '기업관리'],
        datasets: [{
            data: [companyNews_Log, companyEvent_Log, document_Log, schedule_Log, HR_Log, mail_Log, companyManage_Log], // 데이터 수에 맞게 조정
            backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#FF8C00',
                '#9966CC', '#00FFFF', '#FF1493']
        }]
    };

    // 옵션 정의
    var options = {
        responsive: true,
        maintainAspectRatio: false
    };

    // 파이차트 생성
    const ctx2 = document.getElementById('myPieChart').getContext('2d');
    var myPieChart = new Chart(ctx2, {
        type: 'pie',
        data: data,
        options: options
    });
    //////////////////////////////////
    // 막대차트 생성
    var monthList = [];
    var monthData = [];
    var dt = new Date();
    var year = dt.getFullYear();
    var mon = dt.getMonth() + 1;
    var thisMonthIncome = ${thisMonthIncome};
    var lastMonthIncome = ${lastMonthIncome};
    var twoMonthIncome = ${twoMonthIncome};
    var threeMonthIncome = ${threeMonthIncome};
    var fourMonthIncome = ${fourMonthIncome};
    var fiveMonthIncome = ${fiveMonthIncome};
    var otherMonthIncome = 100000;

    for (var i = 0; i < 6; i++) {
        var month = mon - i;
        var yearOffset = 0;
        if (month <= 0) {
            month += 12;
            yearOffset = 1;
        }
        var yearStr = (year - yearOffset).toString();
        var monthStr = month.toString().padStart(2, '0');
        var format = yearStr + '/' + monthStr;
        monthList.unshift(format);

        if (i === 0) {
            monthData.unshift(thisMonthIncome);
        } else if (i == 1) {
            monthData.unshift(lastMonthIncome);
        } else if (i == 2) {
            monthData.unshift(twoMonthIncome);
        } else if (i == 3) {
            monthData.unshift(threeMonthIncome);
        } else if (i == 4) {
            monthData.unshift(fourMonthIncome);
        } else if (i == 5) {
            monthData.unshift(fiveMonthIncome);
        } else {
            monthData.unshift(otherMonthIncome);
        }
    }

    const ctx1 = document.getElementById('myChart').getContext('2d');
    const myChart = new Chart(ctx1, {
        type: 'line',
        data: {
            labels: monthList,
            datasets: [{
                data: monthData,
                borderColor: 'rgba(255, 99, 132, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: false
                }
            }
        }
    });
</script>

</body>
</html>
