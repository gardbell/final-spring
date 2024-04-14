<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ACE WORKS</title>

<script>
	function goBossList() {
		location.href = 'bossList.do';
	}
	function goStatsList() {
		location.href = 'statsList.do';
	}
	function goWithdrawList() {
		location.href = 'withdrawList.do';
	}
	function goPriceAndPolicyList() {
		location.href = 'PriceAndPolicyList.do';
	}
	function goQnaList() {
		location.href = 'qnaList.do';
	}
	function goApproveList() {
		location.href = 'approveList.do';
	}
</script>
</head>
<body>
	<div class="container mt-3">
		<form action="goMain.do">

			<button id="Sbt" type="submit" class="btn btn btn-primary">aceworks</button>
		</form>
	</div>
	<h1 class="text-center mt-3 text-purple-light">Ace Works 현황</h1>
	<div class="container text-center mt-5">
		<div class="row">
			<div class="col-sm-5 bg-secondary bg-opacity-25 p-3"
				style="margin-right: 10px;">
				<h3 style="color: purple;">수입 및 사이트 이용량 통계</h3>
				<br>
				<h5>현 이용자 수 : ${currentUserNum} 명</h5>
				<h5>이번달 수익 : ${thisMonthIncome} 원</h5>
				<h5>지난달 수익 : ${lastMonthIncome} 원</h5>
				<br>
				<button type="button" class="btn btn-primary btn-lg"
					onclick="goStatsList()">자세히 보기</button>
			</div>
			<div class="col-sm-3 bg-secondary bg-opacity-25 p-3 "
				style="margin-right: 20px;">
				<h3 style="color: purple;">대표 가입 승인</h3>
				<br><br><br>
				<h5>
					미승인 대표 : <font style="color: red;">${approveNum}</font> 명
				</h5>				
				<br>
				<button type="button" class="btn btn-primary btn-lg"
					onclick="goApproveList()">승인하기</button>
			</div>
			<div class="col-sm-3 bg-secondary bg-opacity-25 p-3">
				<h3 style="color: purple;">기업 대표 정보</h3>
				<br>
				<br>
				<h5>가입 기업 수 : ${bossNum} 개</h5>
				<h5>(회원 정보 / 연락처)</h5>
				<br>
				<button type="button" class="btn btn-primary btn-lg"
					onclick="goBossList()">확인하기</button>
			</div>
		</div>

		<div class="row mt-3">
			<div class="col-sm-4 bg-secondary bg-opacity-25 p-3"
				style="margin-right: 10px;">
				<h3 style="color: purple;">기업 탈퇴 신청 현황</h3>
				<br>
				<h5>
					탈퇴 신청 기업 수 : <font style="color: red;">${withdrawNum}</font> 개
				</h5>
				<br>
				<button type="button" class="btn btn-primary btn-lg"
					onclick="goWithdrawList()">확인 및 승인하기</button>
			</div>
			<div class="col-sm-4 bg-secondary bg-opacity-25 p-3 "
				style="margin-right: 20px;">
				<h3 style="color: purple;">질의응답</h3>
				<br>
				<h5>
					미응답 문의 : <font style="color: red;">${qnaNum}</font> 건
				</h5>
				<h5>답변하기 및 삭제</h5>

				<button type="button" class="btn btn-primary btn-lg"
					onclick="goQnaList()">확인하기</button>
			</div>
			<div class="col-sm-3 bg-secondary bg-opacity-25 p-3 ">
				<h3 style="color: purple;">정책 관리</h3>
				<br>
				<h5>(요금 / 약관 수정)</h5>
				<br>
				<button type="button" class="btn btn-primary btn-lg"
					onclick="goPriceAndPolicyList()">수정하기</button>
			</div>
		</div>
	</div>
</body>
</html>