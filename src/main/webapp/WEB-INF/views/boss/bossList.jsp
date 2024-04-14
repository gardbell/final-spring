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
	<h1 class="text-center mt-5 text-purple-light">기업 대표 정보</h1>
	<div class="mt-3 d-flex gap-2 justify-content-center">
		<form action="bossListSearch.do">
			<input type="text" id="searchKeyword" name="keyword"
				placeholder="검색어를 입력하세요." style="width: 70%; height: 35px;">
			<button id="Sbt" type="submit" class="btn btn btn-primary">검색</button>
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
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty bossLists }">
					<tr>
						<td colspan="5">등록된 대표 정보가 없습니다</td>
					</tr>
				</c:if>
				<c:forEach var="BLdto" items="${bossLists}">
				    <tr>
				        <th scope="row">${BLdto.idx}</th>
				        <td>
				            <c:choose>
				                <c:when test="${empty BLdto.name}">
				                    데이터 없음
				                </c:when>
				                <c:otherwise>
				                    ${BLdto.name}
				                </c:otherwise>
				            </c:choose>
				        </td>
				        <td>
				            <c:choose>
				                <c:when test="${empty BLdto.com_idx}">
				                    데이터 없음
				                </c:when>
				                <c:otherwise>
				                    ${BLdto.com_idx}
				                </c:otherwise>
				            </c:choose>
				        </td>
				        <td>
				            <c:choose>
				                <c:when test="${empty BLdto.com_name}">
				                    데이터 없음
				                </c:when>
				                <c:otherwise>
				                    ${BLdto.com_name}
				                </c:otherwise>
				            </c:choose>
				        </td>
				        <td>
				            <c:choose>
				                <c:when test="${empty BLdto.usernum}">
				                    데이터 없음
				                </c:when>
				                <c:otherwise>
				                    ${BLdto.usernum}
				                </c:otherwise>
				            </c:choose>
				        </td>
				        <td>
				            <c:choose>
				                <c:when test="${empty BLdto.tel}">
				                    데이터 없음
				                </c:when>
				                <c:otherwise>
				                    ${BLdto.tel}
				                </c:otherwise>
				            </c:choose>
				        </td>
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