<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function goDoubleCheck() {
		var selectedIdxs = [];
		var checkboxes = document.querySelectorAll('.btn-check:checked');
		checkboxes.forEach(function(checkbox) {
			selectedIdxs.push(checkbox.name);
		});

		if (selectedIdxs.length > 0) {
			if (confirm('선택한 대표을 승인하시겠습니까?')) {
				var selectedIdxsParam = selectedIdxs.join(',');
				window.location.href = 'approveMember.do?selectedIdxs='
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
		<form action="main_admin.do">

			<button id="Sbt" type="submit" class="btn btn btn-primary">메인으로</button>
		</form>
	</div>
	<h1 class="text-center mt-5 text-purple-light">대표 가입 승인</h1>
	<div class="mt-3 d-flex gap-2 justify-content-center">
		
	</div>
	<div class="container text-center mt-3">
		<table class="table">
			<thead class="table-primary">
				<tr>
					<th scope="col">회원번호</th>
					<th scope="col">대표이름</th>
					<th scope="col">기업번호</th>
					<th scope="col">기업명</th>
					
					<th scope="col"><a href="approveMember.do"
							onclick="return goDoubleCheck()">승인</a></th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty approveLists }">
					<tr>
						<td colspan="5">미승인 대표 정보가 없습니다</td>
					</tr>
				</c:if>
				<c:forEach var="apdto" items="${approveLists}">
				    <tr>
				        <th scope="row">${apdto.idx}</th>
				        <td>
				            <c:choose>
				                <c:when test="${empty apdto.name}">
				                    데이터 없음
				                </c:when>
				                <c:otherwise>
				                    ${apdto.name}
				                </c:otherwise>
				            </c:choose>
				        </td>
				        <td>
				            <c:choose>
				                <c:when test="${empty apdto.com_idx}">
				                    데이터 없음
				                </c:when>
				                <c:otherwise>
				                    ${apdto.com_idx}
				                </c:otherwise>
				            </c:choose>
				        </td>
				        <td>
				            <c:choose>
				                <c:when test="${empty apdto.com_name}">
				                    데이터 없음
				                </c:when>
				                <c:otherwise>
				                    ${apdto.com_name}
				                </c:otherwise>
				            </c:choose>
				        </td>
				        
				        <td>
				        	<div class="btn-group" role="group"
									aria-label="Basic checkbox toggle button group">
									<input type="checkbox" name="${apdto.idx }"
										class="btn-check" id="btncheck${apdto.idx}"
										autocomplete="off"> <label
										class="btn btn-outline-primary" for="btncheck${apdto.idx }">선택</label>
							</div>
						</td>
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
</body>
</html>