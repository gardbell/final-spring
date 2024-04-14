<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/style.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ACE WORKS</title>
<script>
	function deleteNews(news_idx) {
	    if (confirm('정말 삭제하시겠습니까?')) {
	        var url = 'company_news_Delete.do?news_idx=' + news_idx;
	        window.location.href = url;
	    }
	}

    function updateNews(news_idx) {
		if(confirm('게시글을 수정 하시겠습니까?')){
	    	var url = 'company_news_UpdateForm.do?news_idx=' + news_idx;
	        window.location.href = url;
		}
    }
</script>
<style>
#left {
	width: 200px;
	height: 700px;
	float: left;
	border-right: 2px solid darkblue;
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
#PNbt {
	width: 75px;
	height: 40px;
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
		
			<div class="container">
				<div class="mt-5 mb-2">
					<span class="h4">회사소식&gt;&gt;${newsDto.news_idx }번 게시글</span>&nbsp;
				</div>
				
				<table width="1000" cellspacing="0" class="table">
					<tr align="center">
						<th class="table-primary">번호</th>
						<td>${newsDto.news_idx }</td>
						<th class="table-primary">작성일</th>
						<td>${newsDto.news_writedate }</td>
						<th class="table-primary">작성자</th>
						<td>${newsDto.news_writer }</td>
					</tr>
					<tr>
						<th class="text-center table-primary">제목</th>
						<td colspan="6">${newsDto.news_title }</td>
					</tr>
					<tr height="400">
						<td colspan="6" align="left" valign="top">${newsDto.news_content }</td>
					</tr>
				</table>
				
				<table width="1000" cellspacing="0" class="table table-hover">
					<tr>
						<c:choose>
						    <c:when test="${empty SearchNextDto.news_title}">
						        <td>다음글이 없습니다.</td>
						    </c:when>
						    <c:otherwise>
						        <td>
						            <c:url var="company_newsSearchContentUrl" value="company_news_SearchContent.do">
						                <c:param name="news_idx">${SearchNextDto.news_idx}</c:param>
						                <c:param name="com_idx">${dto.getCom_idx()}</c:param>
						                <c:param name="keyword">${keyword}</c:param>
						            </c:url>
						            <a href="${company_newsSearchContentUrl}">다음글 : ${SearchNextDto.news_title}</a>
						        </td>
						    </c:otherwise>
						</c:choose>
					</tr>
					
					<tr>
						<c:choose>
						    <c:when test="${empty SearchPreviousDto.news_title}">
						        <td>이전글이 없습니다.</td>
						    </c:when>
						    <c:otherwise>
						        <td>
						            <c:url var="company_newsSearchContentUrll" value="company_news_SearchContent.do">
						                <c:param name="news_idx">${SearchPreviousDto.news_idx}</c:param>
						                <c:param name="com_idx">${dto.getCom_idx()}</c:param>
						                <c:param name="keyword">${keyword}</c:param>
						            </c:url>
						            <a href="${company_newsSearchContentUrll}">이전글 : ${SearchPreviousDto.news_title}</a>
						        </td>
						    </c:otherwise>
						</c:choose>
					</tr>
				</table>
				
				<c:if test="${dto.rank_num == 2 || dto.rank_num == 1}">
					<div class="d-flex justify-content-center">
						<button id="bt" type="button" class="btn btn-outline-primary"
							onclick="location.href='company_news_List.do?com_idx=${dto.getCom_idx()}';">목록</button>
						&nbsp; &nbsp;
						<button id="bt" type="button" class="btn btn-outline-success"
							onclick="updateNews(${newsDto.news_idx});">수정</button>
						&nbsp; &nbsp;
						<button id="bt" type="button" class="btn btn-outline-danger"
							onclick="deleteNews(${newsDto.news_idx});">삭제</button>
					</div>
				</c:if>
				
				<c:if test="${dto.rank_num == 3}">
					<div class="d-flex justify-content-center">
						<button id="bt" type="button" class="btn btn-outline-primary"
							onclick="location.href='company_news_List.do?com_idx=${dto.getCom_idx()}';">목록</button>
	
					</div>
				</c:if>

			</div>
		</div>
	</div>
</body>
</html>