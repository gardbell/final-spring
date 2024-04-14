<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/include/style.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ACE WORKS</title>
<style>
th.table-primary {
	width: 100px;
}
</style>
<script src="js/httpRequest.js"></script>
<script>
	function submitComment() {
		var comment = document.getElementById('comment').value;
		var qna_idx = document.getElementsByName("qna_idx")[0].value;
		var qna_ref = document.getElementsByName("qna_ref")[0].value;
		var qna_title = document.getElementsByName("qna_title")[0].value;
		var qna_category = document.getElementsByName("qna_category")[0].value;
		var qna_writer = document.getElementsByName("qna_writer")[0].value;

		var param = 'qna_idx=' + encodeURIComponent(qna_idx) +'&qna_content=' + encodeURIComponent(comment) + '&qna_ref='
				+ encodeURIComponent(qna_ref) + '&qna_title='
				+ encodeURIComponent(qna_title) + '&qna_category='
				+ encodeURIComponent(qna_category) + '&qna_writer='
				+ encodeURIComponent(qna_writer);
		sendRequest('saveComment.do', param, handleCommentSubmit, 'GET');
	}

	function handleCommentSubmit() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = XHR.responseText;
				var commentList = JSON.parse(data).lists; // 'lists'에 저장된 댓글 목록만 가져옴
				displayComments(commentList);

				location.reload();
			} else {
				alert('댓글 작성 완료.');
				location.reload();
			}
		}
	}

	function displayComments(commentList) {
		var commentListDiv = document.getElementById('commentList');
		var newCommentDiv = document.createElement('div');
		newCommentDiv.classList.add('comment');
		newCommentDiv.innerHTML = '<p>' + comment.qna_content + '</p>';
		commentListDiv.insertBefore(newCommentDiv, commentListDiv.firstChild);
	}
</script>
</head>
<body>
	<div class="container mt-3">
		<form action="qnaList.do">

			<button id="Sbt" type="submit" class="btn btn btn-primary">뒤로가기</button>
		</form>
	</div>
	<div class="container">

		<h1 class="text-center mt-5 text-purple-light">질의 응답</h1>
		<div class="d-flex justify-content-center align-items-center mt-5">
			<table class="table">
				<tr>

					<th class="table-primary">질문번호</th>
					<td>${qnaDto.qna_idx}</td>
					<th class="table-primary">작성자</th>
					<td>${writerName}</td>
				</tr>
				<tr>
					<th class="table-primary">분류</th>
					<td>${qnaDto.qna_category}</td>
					<th class="table-primary">기업명</th>
					<td>${companyName}</td>
				</tr>
				<tr>
					<th class="table-primary">제목</th>
					<td colspan="3">${qnaDto.qna_title}</td>
				</tr>
				<tr height="250">
					<td colspan="4" align="left" valign="top">${qnaDto.qna_content}</td>
				</tr>

			</table>

		</div>

		<div id="commentList">
			<!-- 기존에 등록된 댓글들 -->
			<c:forEach var="comment" items="${commentList}">
				<div class="comment">
					<p>${comment.qna_content}</p>
				</div>
			</c:forEach>
		</div>
		<c:if test="${dto.rank_num == 1 }">
			<div class="form-floating" style="position: relative;">
				<textarea class="form-control" placeholder="Leave a comment here"
					id="comment" name="comment" style="height: 150px"></textarea>
				<label for="comment">답글 달기</label>
				<button type="button" class="btn btn-primary"
					style="position: absolute; bottom: 0; right: 0;"
					onclick="submitComment()">답변 등록</button>
			</div>
		</c:if>


	</div>
	<input type="hidden" name="qna_idx" value="${qnaDto.qna_idx }">
	<input type="hidden" name="qna_ref" value="${qnaDto.qna_ref }">
	<input type="hidden" name="qna_title" value="${qnaDto.qna_title }">
	<input type="hidden" name="qna_category"
		value="${qnaDto.qna_category }">
	<input type="hidden" name="qna_writer" value="${dto.idx }">
</body>

</html>
