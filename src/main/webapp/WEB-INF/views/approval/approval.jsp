<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/style.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ACE WORKS</title>
<style>
#left {
	width: 200px;
	height: 600px;
	float: left;
	border-right: 2px solid black;
	margin-left: 50px;
}

#right {
	width: 900px;
	height: 600px;
	margin-left: 330px;
}

#comimg {
	width: 150px;
	height: 150px;
}

#bt {
	width: 180px;
	height: 40px;
}

#Sbt {
	padding-top: 2px;
	height: 30px;
}

h3 {
	text-align: center;
}

a {
	text-decoration: none;
}
</style>
</head>
<body>

	<div>
		<div id="left">
			<button id="bt" type="button" class="btn btn-outline-primary"
				onclick="writeNews()">글 작성</button>
			<script>
				function writeNews() {
					location.href = 'approvalWriteForm.do';
				}
			</script>
			<div class="mt-3">
				<c:if test="${cdto.com_img ==null }">
					<a href="goMain.do"><img id="comimg"
						src="img/noImage/noImage.jpg"></a>
				</c:if>
				<c:if test="${cdto.com_img !=null }">
					<a href="goMain.do"><img id="comimg"
						src="img/${cdto.com_name}/${cdto.com_img}"></a>
				</c:if>
			</div>

			<a href="company_news_List.do?com_idx=${dto.getCom_idx()}">회사소식</a> <br>
			<a href="company_event_List.do?com_idx=${dto.getCom_idx()}">경조사</a> <br>
			<a href="memberMailList.do?com_idx=${dto.getCom_idx()}">메일</a> <br>
			<a href="approval.do?idx=${dto.getIdx()}">결재문서</a> <br> <a
				href="schedule.do">스케줄</a> <br> <a href="insa.do">인사관리</a> <br>
		</div>
	</div>
	<div id="right">
		<div class="mt-5 mb-2">
			<span class="h4">게시판 &gt;&gt; 결재문서</span>
		</div>
		<div
			style="margin-bottom: 20px; background-color: lightgray; width: 800px; height: 250px; text-align: center;">
			<h2>내문서</h2>
			<div
				style="float: left; width: 200px; margin-left: 100px; margin-top: 50px;">
				<h5>전체문서</h5>
				<div>
					<a style="font-size: 30px; color: darkblue; text-decoration: none;"
						href="approvalList.do?idx=${dto.idx}&check=1&cp=1">${myCnt}개</a>
				</div>
			</div>
			<div
				style="float: right; width: 200px; margin-right: 100px; margin-top: 50px;">
				<h5>미결재문서</h5>
				<div>
					<a style="font-size: 30px; color: blue; text-decoration: none;"
						href="approvalList.do?idx=${dto.idx}&check=2&cp=1">${myCnt2}개</a>
				</div>
			</div>
		</div>
		<div
			style="background-color: lightgray; width: 800px; height: 250px; text-align: center;">
			<h2>나에게 요청온 결재문서</h2>
			<div
				style="float: left; width: 200px; margin-left: 100px; margin-top: 50px;">
				<h5>전체문서</h5>
				<div>
					<a style="font-size: 30px; color: darkblue; text-decoration: none;"
						href="approvalList.do?idx=${dto.idx}&check=3&cp=1">${myCnt3}개</a>
				</div>
			</div>
			<div
				style="float: right; width: 200px; margin-right: 100px; margin-top: 50px;">
				<h5>미결재문서</h5>
				<div>
					<a style="font-size: 30px; color: blue; text-decoration: none;"
						href="approvalList.do?idx=${dto.idx}&check=4&cp=1">${myCnt4}개</a>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>