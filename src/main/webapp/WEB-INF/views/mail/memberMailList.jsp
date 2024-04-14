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

h3 {
	text-align: center;
}
#Sbt {
	padding-top: 2px;
	height: 30px;
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
</style>
</head>
<body>

<div>

<div class="mb-5">
<h5>${dto.getName()} 님&nbsp;<a class="logout" href="logout.do">로그아웃</a></h5>
</div>

	<div id="left">
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
				<a href="approval.do">결재문서</a> <br> <a href="schedule.do">스케줄</a> <br>
				<a href="insa.do">인사관리</a> <br>
			</div>

<div class="mt-3">

</div>
		</div>
		<div id="right">
		<div class="mt-5 mb-2"><span class="h4">메일</span></div>
		
		<div class="mt-1 mb-3 d-flex gap-2 justify-content-end">
		   <form action="memberMailListSearch.do">
		   <input type="hidden" name="com_idx" value="${dto.getCom_idx()}">
		        <input type="text" id="memberKeyword" name="memberKeyword" placeholder="사원을 검색하세요" style="width:250px; height: 35px;">
		        <button id="Sbt" type="submit" class="btn btn btn-primary">검색</button>
		   </form> 
		</div>

			<table width="1000" cellspacing="0" class="table table-hover">
				<thead>
					<tr align="center">
					<th scope="col">이름</th>
					<th scope="col">전화번호</th>
					<th scope="col">E-mail</th>
					</tr>
				</thead>

				<tbody class="table-group-divider">
					<c:if test="${empty memberList }">
						<tr>
							<td colspan="4" align="center">등록된 사원이 없습니다</td>
						</tr>
					</c:if>

					<c:forEach var="memberList" items="${memberList }">
					<tr class="text-center">
					    <th scope="row">${memberList.name}</th>
					    <th scope="row">${memberList.tel}</th>
					    <th scope="row">${memberList.email}</th>
					    <th><button id="bt" type="button" class="btn btn-outline-primary" onclick="sendEmail('${memberList.email}');">메일 보내기</button></th>
					</tr>
					
					<script>
					function sendEmail(emailAddr) {
					    var subject = encodeURIComponent("aceworks입니다. 제목을 입력해주세요.");
					    var emailBody = encodeURIComponent("내용을 입력해주세요.");
					    var mailtoLink = 'mailto:' + emailAddr + '?subject=' + subject + '&body=' + emailBody;
					    window.location.href = mailtoLink;
					}
					</script>

					</c:forEach>
				</tbody>

				<tfoot>
					<tr>
						<td colspan="4" align="center">${pageStr }</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</body>
</html>