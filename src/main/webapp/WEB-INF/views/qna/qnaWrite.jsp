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
<script>
	function goDoubleCheck() {
		if (confirm('문의사항을 작성하시겠습니까?')) {
			return true;
			document.forms[0].submit();
		} else {
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container">

		<h1 class="text-center mt-5 text-purple-light">질의 응답</h1>
		<div class="d-flex justify-content-center align-items-center mt-5">
			<form name="qw" action="qnaWrite.do" method="post">
			<input type="hidden" name="qna_writer" value="${dto.idx }">
				<table class="table">
					<tr>


						<th class="table-primary">작성자</th>
						<td>${dto.name }</td>
						<th class="table-primary">기업번호</th>
						<td>${cdto.com_idx }</td>
					</tr>
					<tr>
						<th class="table-primary">분류</th>
						<td><select class="form-select" style="width: 200px;"
							aria-label="Large select example" id="qna_categorySelect"
							name="qna_category">

								<option value="이용방법">이용방법</option>
								<option value="용어설명">용어설명</option>
								<option value="문제해결">문제해결</option>

						</select></td>
						<th class="table-primary">기업명</th>
						<td>${cdto.com_name }</td>
					</tr>
					<tr>
						<th class="table-primary">제목</th>
						<td colspan="3"><input type="text" class="form-control"
							id="qna_title" name="qna_title"></td>
					</tr>
					<tr height="250">
						<td colspan="4" align="left" valign="top"><div
								class="form-floating" style="position: relative;">
								<textarea class="form-control"
									placeholder="Leave a comment here" id="qna_content"
									name="qna_content" style="height: 300px"></textarea>
								<label for="qna_content">문의 내용</label>

							</div></td>
					</tr>
					<tr>
						<td colspan="4" class="text-center"><button id="writeBtn"
								type="submit" class="btn btn btn-primary" onclick="return goDoubleCheck()">작성하기</button></td>
					</tr>
				</table>
			</form>
		</div>






	</div>
</body>

</html>
