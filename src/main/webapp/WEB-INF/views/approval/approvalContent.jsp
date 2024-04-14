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
    function deleteApp(ref) {
        var url = 'approvalDelete.do?ref='+ref+'&com_idx='+'${dto.com_idx}';
        window.location.href = url;
    }

    function updateApp(ref) {
    	var url = 'approvalUpdateForm.do?ref='+ref+'&com_idx='+'${dto.com_idx}';
        window.location.href = url;
    }
    function checkApproval(ref){
    	var url = 'checkApproval.do?ref='+ref+'&com_idx='+'${dto.com_idx}';
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

#comimg {
	width: 150px;
	height: 150px;
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

a {
	text-decoration: none;
}
</style>
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
			<div class="container">
				<div class="mt-5 mb-2">
					<span class="h4">결재문서&gt;&gt;${appDto.ref }번 게시글</span>&nbsp;
					&nbsp;
					<c:if
						test="${dto.idx==appDto.approver  && appDto.approval_check==1}">
						<button id="bt" type="button" class="btn btn-outline-primary"
							onclick="checkApproval(${appDto.ref})">결재하기</button>
					</c:if>
				</div>
				<table width="1000" cellspacing="0" class="table">
					<tr align="center">
						<th class="table-primary">번호</th>
						<td>${appDto.ref }</td>
						<th class="table-primary">작성일</th>
						<td>${appDto.writedate }</td>
						<th class="table-primary">작성자</th>
						<td>${appDto.name }</td>
					</tr>
					<tr>
						<th class="text-center table-primary">제목</th>
						<td colspan="6">${appDto.title }</td>
					</tr>
					<tr align="center">
						<th class="table-primary">첨부파일</th>
						<td colspan="6"><c:if test="${!empty app_fileList}">
								<c:forEach var="list" items="${app_fileList}">
									<c:url var="downUrl" value="fileDown.do">
										<c:param name="com_idx">${list.com_idx }</c:param>
										<c:param name="filename">${list.filename }</c:param>
									</c:url>
									<li><a href="${downUrl }">${list.filename}</a></li>
								</c:forEach>
							</c:if></td>
					</tr>
					<tr height="400">
						<td colspan="6" align="left" valign="top">${appDto.content }</td>
					</tr>
				</table>

				<c:if test="${dto.idx == appDto.writer && appDto.approval_check==1}">
					<div class="d-flex justify-content-center">
						<button id="bt" type="button" class="btn btn-outline-success"
							onclick="updateApp(${appDto.ref});">수정</button>
						&nbsp; &nbsp;
						<button id="bt" type="button" class="btn btn-outline-danger"
							onclick="deleteApp(${appDto.ref});">삭제</button>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>