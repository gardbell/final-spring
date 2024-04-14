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
	height: 700px;
	float: left;
	border-right: 2px solid black;
	margin-left: 50px;
}

#right {
	width: 900px;
	height: 600px;
	margin-left: 330px;
}

#bt {
	width: 150px;
	height: 40px;
}
#Sbt {
	padding-top: 2px;
	height: 30px;
}

h3 {
	text-align: center;
}
#comimg{
	width: 150px;
	height: 150px;
}

.logout:hover{
	text-decoration-line: underline;
	background-color: LightPink;
}

.logout{
	margin: 0 auto;
	color: FireBrick;
	font-size: 20px;
	text-decoration-line: none
}

a{
	text-decoration: none;
}
</style>
</head>
<body>

<div>

<div class="mb-5">
<h5>${dto.getName()} 님&nbsp;<a class="logout" href="logout.do">로그아웃</a></h5>
</div>

	<div id="left">
		<c:if test="${dto.rank_num == 2 || dto.rank_num == 1 || dto.rank_num == 3}">
		    <button id="bt" type="button" class="btn btn-outline-primary" onclick="writeNews()">글 작성</button>
		</c:if>
		
		<script>
		    function writeNews() {
		        <c:if test="${dto.rank_num == 3}">
		            window.alert('글을 작성할 권한이 없습니다.');
		        </c:if>
		        <c:if test="${dto.rank_num == 2 || dto.rank_num == 1}">
		            location.href = 'company_news_Writeform.do';
		        </c:if>
		    }
		</script>
		
		<div class="mt-3">
				<c:if test="${cdto.com_img ==null }">
					<a href="goMain.do"><img id="comimg" src="img/noImage/noImage.jpg"></a>
				</c:if>
				<c:if test="${cdto.com_img !=null }">
					<a href="goMain.do"><img id="comimg"
						src="img/${cdto.com_name}/${cdto.com_img}"></a>
				</c:if>
		</div>
<div class="mt-3">
<a href="company_news_List.do?com_idx=${dto.getCom_idx()}">회사소식</a> <br> 
<a href="company_event_List.do?com_idx=${dto.getCom_idx()}">경조사</a> <br> 
<a href="memberMailList.do?com_idx=${dto.getCom_idx()}">메일</a> <br>
<a href="approval.do?idx=${dto.getIdx()}">결재문서</a> <br>
<a href="schedule.do">스케줄</a> <br>
<a href="insa.do">인사관리</a> <br>
</div>

		</div>
		<div id="right">
		<div class="mt-5 mb-2"><span class="h4">게시판 &gt;&gt; 회사소식</span></div>
		
<div class="mt-1 mb-3 d-flex gap-2 justify-content-end">

   <form action="company_newsSearch.do">
   <input type="hidden" name="com_idx" value="${dto.getCom_idx()}">
        <input type="text" id="searchKeyword" name="keyword" placeholder="검색어를 입력하세요." style="width:250px; height: 35px;">
        <button id="Sbt" type="submit" class="btn btn btn-primary">검색</button>
   </form>
    
</div>
			<table width="1000" cellspacing="0" class="table table-hover">
				<thead>
					<tr align="center">
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">등록자</th>
						<th scope="col">등록일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>

				<tbody class="table-group-divider">
					<c:if test="${empty lists }">
						<tr>
							<td colspan="5" align="center">등록된 게시물이 없습니다</td>
						</tr>
					</c:if>

					<c:forEach var="newsDto" items="${lists }">
						<tr class="text-center">
							<th scope="row">${newsDto.news_idx }</th>
							<c:url var="company_newsContentUrl"
								value="company_news_Content.do">
								<c:param name="news_idx">${newsDto.news_idx }</c:param>
								<c:param name="com_idx">${dto.getCom_idx()}</c:param>
							</c:url>
							<td><a href="${company_newsContentUrl }">${newsDto.news_title }</a></td>
							<td>${newsDto.news_writer }</td>
							<td>${newsDto.news_writedate }</td>
							<td>${newsDto.news_readnum }</td>
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