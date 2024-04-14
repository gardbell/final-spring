<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ACE WORKS</title>
<script>
	function goDoubleCheck() {
		var selectedIdxs = [];
		var checkboxes = document.querySelectorAll('.btn-check:checked');
		checkboxes.forEach(function(checkbox) {
			selectedIdxs.push(checkbox.name);
		});

		if (selectedIdxs.length > 0) {
			if (confirm('선택한 글들을 삭제하시겠습니까?')) {
				var selectedIdxsParam = selectedIdxs.join(',');
				window.location.href = 'deleteQna.do?selectedIdxs='
						+ selectedIdxsParam;
				return true;
			} else {
				return false;
			}
		} else {
			alert('체크박스를 선택해주세요.');
			return false;
		}
	}
</script>

</head>
<body>
	<div class="container mt-3">
	<c:if test="${dto.rank_num == 1 }">
		<form action="main_admin.do">
			<button id="Sbt" type="submit" class="btn btn btn-primary">메인으로</button>
		</form>
	</c:if>
	<c:if test="${dto.rank_num != 1 }">
		<form action="goMain.do">
			<button id="Sbt" type="submit" class="btn btn btn-primary">메인으로</button>
		</form>
	</c:if>
	
	</div>
	<h1 class="text-center mt-5 text-purple-light">질의 응답</h1>
	<div class="mt-3 d-flex gap-2 justify-content-center">
		<form action="qnaListSearch.do">
			<input type="text" id="searchKeyword" name="keyword"
				placeholder="검색어를 입력하세요." style="width: 70%; height: 35px;">
			<button id="Sbt" type="submit" class="btn btn btn-primary">검색</button>
		</form>
	</div>
	<div class="container text-center mt-3">
		<table class="table">
			<thead class="table-primary">
				<tr>
					<th scope="col">질문번호</th>
					<th scope="col">분류</th>
					<th scope="col">제목</th>
					<th scope="col">답변여부</th>
					<c:if test="${dto.rank_num == 1 }">
						<th scope="col"><a href="deleteQna.do"
							onclick="return goDoubleCheck()">삭제하기</a></th>
					</c:if>
					<c:if test="${dto.rank_num == 2 }">
						<th scope="col"><a href="qnaWrite.do">글쓰기</a></th>
					</c:if>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty qnaLists }">
					<tr>
						<td colspan="5">등록된 문의 정보가 없습니다</td>
					</tr>
				</c:if>
				<c:forEach var="qdto" items="${qnaLists }">
					<tr>
						<th scope="row">${qdto.qna_idx }</th>

						<td>${qdto.qna_category }</td>

						<c:url var="contentUrl" value="qnaContent.do">
							<c:param name="qna_idx">${qdto.qna_idx }</c:param>
						</c:url>

						<td><a href="${contentUrl }">${qdto.qna_title }</a></td>
						<c:if test="${qdto.qna_answer == 1 }">
							<td>답변완료</td>
						</c:if>
						<c:if test="${qdto.qna_answer == 0 }">
							<td>x</td>
						</c:if>
						<c:if test="${dto.rank_num == 1 }">
							<td><div class="btn-group" role="group"
									aria-label="Basic checkbox toggle button group">
									<input type="checkbox" name="${qdto.qna_idx }"
										class="btn-check" id="btncheck${qdto.qna_idx }"
										autocomplete="off"> <label
										class="btn btn-outline-primary" for="btncheck${qdto.qna_idx }">선택</label>
								</div>
							</td>
						</c:if>
						<c:if test="${dto.rank_num == 2 }">
							<td></td>
						</c:if>

					</tr>
				</c:forEach>

			</tbody>
			<tfoot>
				<tr>
					<td colspan="6" align="center">${pageStr }</td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>