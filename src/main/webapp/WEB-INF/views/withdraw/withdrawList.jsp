<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ACE WORKS</title>
</head>
<body>
	<div class="container mt-3">
		<form action="main_admin.do">

			<button id="Sbt" type="submit" class="btn btn btn-primary">메인으로</button>
		</form>
	</div>
	<h1 class="text-center mt-5 text-purple-light">기업 탈퇴 승인</h1>
	<div class="mt-3 d-flex gap-2 justify-content-center">
		<form action="bossListSearch.do">
			<input type="text" id="searchKeyword" name="keyword"
				placeholder="검색어를 입력하세요." style="width: 70%; height: 35px;">
			<button id="Sbt" type="submit" class="btn btn-primary">검색</button>
		</form>
	</div>
	<div class="container text-center mt-3">
		<table class="table">
			<thead class="table-primary">
				<tr>
					<th scope="col">회원번호</th>
					<th scope="col">대표이름</th>
					<th scope="col">기업번호</th>
					<th scope="col">기업명</th>
					<th scope="col">이용자 수</th>
					<th scope="col">연락처</th>
					<th scope="col">탈퇴 승인 메일</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty withdrawLists }">
					<tr>
						<td colspan="7">탈퇴 신청이 없습니다</td>
					</tr>
				</c:if>
				<c:forEach var="WDdto" items="${withdrawLists }">
					<tr>
						<th scope="row">${WDdto.idx }</th>
						<td>${WDdto.name }</td>
						<td>${WDdto.com_idx }</td>
						<td>${WDdto.com_name }</td>
						<td>${WDdto.usernum }</td>
						<td>${WDdto.tel }</td>

						<td>
							<div class="d-flex align-items-center justify-content-center">
								<span>${WDdto.email}</span>
								<button
									onclick="sendApprovalEmail('${WDdto.email}', '${WDdto.com_idx}')"
									class="btn btn-primary ms-2">메일보내기</button>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="7" align="center">${pageStr }</td>
				</tr>
			</tfoot>
		</table>
	</div>


	<script>
		function sendApprovalEmail(email, com_idx) {
			// 메일 주소와 제목, 내용을 설정합니다.
			var subject = encodeURIComponent("기업 탈퇴 승인 메일");
			var body = encodeURIComponent("기업 탈퇴가 성공적으로 완료되었습니다. 그동안 저희 제품을 이용해주셔서 감사합니다.");

			var mailtoLink = "mailto:" + email + "?subject=" + subject
					+ "&body=" + body;

			// 메일 보내기 링크를 생성하고 클릭합니다.
			var mailLinkElement = document.createElement('a');
			mailLinkElement.href = mailtoLink;
			mailLinkElement.click();

			// 컨트롤러에 com_idx를 전달하고 페이지를 reload 합니다.
			var url = 'acceptWithdraw.do?com_idx=' + com_idx; // 여기에 컨트롤러의 URL을 입력합니다.
			window.location.href = url; // 페이지 reload
		}
	</script>

</body>
</html>
