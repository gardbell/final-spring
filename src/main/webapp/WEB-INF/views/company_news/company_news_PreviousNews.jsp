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
        var url = 'company_news_Delete.do?news_idx=' + news_idx;
        window.location.href = url;
    }

    function updateNews(news_idx) {
    	var url = 'company_news_UpdateForm.do?news_idx=' + news_idx;
        window.location.href = url;
    }
    
    function previousNews(news_idx,com_idx) {
		var url = 'company_news_PreviousNews.do?news_idx=' + news_idx+'&com_idx='+com_idx;
		window.location.href = url;
	}
    
    function nextNews(news_idx,com_idx) {
		var url = 'company_news_NextNews.do?news_idx=' + news_idx+'&com_idx='+com_idx;
		window.location.href = url;
	}
</script>
<style>
#left {
	width: 200px;
	height: 600px;
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
	width: 180px;
	height: 40px;
}
#PNbt {
	width: 75px;
	height: 40px;
}

h3 {
	text-align: center;
}

a{
	text-decoration: none;
}
</style>
</head>
<body>
	<div>
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
				<a href="company_news_List.do?com_idx=${dto.getCom_idx()}">회사소식</a> <br> <a href="company_event_List.do?com_idx=${dto.getCom_idx()}">경조사</a>
			</div>
		</div>
		<div id="right">
			<div class="container">
				<div class="mt-5 mb-2">
					<span class="h4">회사소식&gt;&gt;${newsDto.news_idx }번 게시글</span>&nbsp;
					&nbsp;
					<button id="PNbt" type="button" class="btn btn-outline-dark"
						onclick="previousNews(${newsDto.news_idx},${dto.getCom_idx()});">이전글</button>
					<button id="PNbt" type="button" class="btn btn-outline-dark"
						onclick="nextNews(${newsDto.news_idx},${dto.getCom_idx()});">다음글</button>
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