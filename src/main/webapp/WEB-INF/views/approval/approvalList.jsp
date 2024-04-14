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
<script>
	function writeNews() {
		location.href = 'approvalWriteForm.do';
	}
</script>
</head>
<body>
	<div>
		<div id="left">
			<button id="bt" type="button" class="btn btn-outline-primary"
				onclick="writeNews()">글 작성</button>
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

			<div class="mt-3">

				<a href="company_news_List.do?com_idx=${dto.getCom_idx()}">회사소식</a>
				<br> <a
					href="company_event_List.do?com_idx=${dto.getCom_idx()}">경조사</a> <br>
				<a href="memberMailList.do?com_idx=${dto.getCom_idx()}">메일</a> <br>
				<a href="approval.do?idx=${dto.getIdx()}">결재문서</a> <br> <a
					href="schedule.do">스케줄</a> <br> <a href="insa.do">인사관리</a> <br>
			</div>
		</div>
		<div id="right">
			<div class="mt-5 mb-2">
				<span class="h4">게시판 &gt;&gt; 결재문서</span>
			</div>
			<div class="mt-2 d-flex gap-2 justify-content-end"></div>
			<table width="1000" cellspacing="0" class="table table-hover">
				<thead>
					<tr align="center">
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">등록자</th>
						<th scope="col">등록일</th>
						<th scope="col">결재여부</th>
					</tr>
				</thead>

				<tbody class="table-group-divider">
					<c:if test="${empty lists }">
						<tr>
							<td colspan="5" align="center">등록된 게시물이 없습니다</td>
						</tr>
					</c:if>

					<c:forEach var="approvalDto" items="${lists }">
						<c:url var="approvalContentUrl" value="approvalContent.do">
							<c:param name="ref">${approvalDto.ref }</c:param>
							<c:param name="com_idx">${dto.com_idx}</c:param>
						</c:url>
						<tr class="text-center"
							onclick="javascript:location.href='${approvalContentUrl}'">
							<th scope="row">${approvalDto.ref }</th>
							<td>${approvalDto.title }</td>
							<td>${approvalDto.name }</td>
							<td>${approvalDto.writedate }</td>
							<td>${approvalDto.approval_check==1?"미결재":"결재완료" }</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5" align="center">${pageStr }</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</body>
</html>