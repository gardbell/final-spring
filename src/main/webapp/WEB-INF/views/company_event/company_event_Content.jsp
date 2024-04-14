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
function deleteEvent(event_idx) {
	if(confirm('정말 삭제하시겠습니까?')){
	    var url = 'company_event_Delete.do?event_idx=' + event_idx;
	    window.location.href = url;
	}
}
function updateEvent(event_idx) {
	if(confirm('게시글을 수정 하시겠습니까?')){
		var url = 'company_event_UpdateForm.do?event_idx=' + event_idx;
	    window.location.href = url;
	}
}
</script>
<style>
#left {
	width: 200px;
	height: 1100px;
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

#likebt{
	width: 100px;
	height: 40px;
}
h3 {
	text-align: center;
}
#map {
    width:300px;
    height:300px;
    margin-top:10px;
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
<script src="js/httpRequest.js"></script>	
</head>
<body>
<div>

<div class="mb-5">
<h5>${dto.getName()} 님&nbsp;<a class="logout" href="logout.do">로그아웃</a></h5>
</div>

	<div id="left">
<c:if test="${dto.rank_num == 2 || dto.rank_num == 1 || dto.rank_num == 3}">
    <button id="bt" type="button" class="btn btn-outline-primary" onclick="writeEvent()">글 작성</button>
</c:if>

<script>
    function writeEvent() {
        <c:if test="${dto.rank_num == 3}">
            window.alert('글을 작성할 권한이 없습니다.');
        </c:if>
        <c:if test="${dto.rank_num == 2 || dto.rank_num == 1}">
            location.href = 'company_event_Writeform.do';
        </c:if>
    }
</script>

<div class="mt-3">
<c:if test="${cdto.com_img ==null }">
<a href="goMain.do"><img id="comimg" src="img/noImage/noImage.jpg"></a>		
</c:if>
<c:if test="${cdto.com_img !=null }">
<a href="goMain.do"><img id="comimg" src="img/${cdto.com_name}/${cdto.com_img}"></a>		
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
					<span class="h4">임직원 경조사&gt;&gt;${eventDto.event_idx }번 게시글</span>&nbsp;
				</div>
			
				<table width="1000" cellspacing="0" class="table">
					<tr align="center">
						<th class="table-primary">번호</th>
						<td>${eventDto.event_idx}</td>
						<th class="table-primary">작성일</th>
						<td>${eventDto.event_writedate }</td>
					</tr>
						
					<tr align="center">
						<th class="table-primary">작성자</th>
						<td>${eventDto.event_writer }</td>
						<th class="table-primary">게시기한</th>
						<td>${eventDto.event_period }</td>
					</tr>
					
					<tr>
						<th class="text-center table-primary">제목</th>
						<td colspan="4">${eventDto.event_title }</td>
					</tr>
					
					<tr>
						<th class="text-center table-primary">주소</th>
						<td colspan="4">${eventDto.event_addr }</td>
					</tr>
					<tr height="400">

						<td colspan="3" align="left" valign="top">
						${eventDto.event_content }
						</td>

						<td style="vertical-align: top;">
						
				        <div class="d-flex justify-content-end" style="height: 100%;">
				            <div style="margin-right: 20px;">
				                <h5>찾아오시는 길</h5>
				                <div id="map"></div>
				            </div>
				        </div>
				        
					    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=94d3da3bc59e086f2502c483efb65662&libraries=services"></script>
					    <script>
					        var mapContainer = document.getElementById('map');
					        var mapOption = {
					            center: new daum.maps.LatLng(37.537187, 127.005476),
					            level: 5
					        };
					        var map = new daum.maps.Map(mapContainer, mapOption);
					        var geocoder = new daum.maps.services.Geocoder();
					        var marker = new daum.maps.Marker({
					            position: new daum.maps.LatLng(37.537187, 127.005476),
					            map: map
					        });
					
					        window.onload = function() {
					            var address = "${eventDto.event_addr }";
					            //var mapAddress = address.substring(5);
					            
					            if (address.trim() !== '') {
					                geocoder.addressSearch(address, function(results, status) {
					                    if (status === daum.maps.services.Status.OK) {
					                        var result = results[0];
					                        var coords = new daum.maps.LatLng(result.y, result.x);
					                        mapContainer.style.display = "block";
					                        map.relayout();
					                        map.setCenter(coords);
					                        marker.setPosition(coords);
					                    }
					                });
					            }
					        };
					    </script>
					</td>
					</tr>
				</table>

				<table width="1000" cellspacing="0" class="table table-hover">
					<tr>
					<c:choose>
					    <c:when test="${empty nexteventDto.event_title}">
					        <td>다음글이 없습니다.</td>
					    </c:when>
					    <c:otherwise>
					        <td>
					            <c:url var="company_eventContentUrl" value="company_event_Content.do">
					                <c:param name="event_idx">${nexteventDto.event_idx }</c:param>
					                <c:param name="com_idx">${dto.getCom_idx()}</c:param>
					            </c:url>
					            <a href="${company_eventContentUrl}">다음글 : ${nexteventDto.event_title}</a>
					        </td>
					    </c:otherwise>
					</c:choose>

					</tr>

					<tr>
						<c:choose>
						    <c:when test="${empty previouseventDto.event_title}">
						        <td>이전글이 없습니다.</td>
						    </c:when>
						    <c:otherwise>
						        <td>
						            <c:url var="company_eventContentUrll" value="company_event_Content.do">
						                <c:param name="event_idx">${previouseventDto.event_idx}</c:param>
						                <c:param name="com_idx">${dto.getCom_idx()}</c:param>
						            </c:url>
						            <a href="${company_eventContentUrll}">이전글 : ${previouseventDto.event_title}</a>
						        </td>
						    </c:otherwise>
						</c:choose>

					</tr>
				</table>



	
<form>
<input id="event_writer" type="hidden" name="event_writer" value="${dto.getName()}">
<input id="comment_ref" type="hidden" name="comment_ref" value="${eventDto.comment_ref}">
<input id="comment_sunbun" type="hidden" name="comment_sunbun" value="${eventDto.comment_sunbun}">
<input id="event_idx" type="hidden" name="event_idx" value="${eventDto.event_idx}">
<input id="com_idx" type="hidden" name="com_idx" value="${dto.getCom_idx()}">


<div class="form-floating mb-5" style="position: relative;">
    <textarea class="form-control" name="event_content" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
    <label for="floatingTextarea2">댓글 내용을 입력하세요.</label>
    <button id="button" class="btn btn-primary mt-2" style="position: absolute; bottom: 10px; right: 10px;" onclick="eventReWrite()">작성</button>
</div>
</form>

<script>
    function eventReWrite() {
        var writer = document.getElementById('event_writer').value;
        var ref = document.getElementById('comment_ref').value;
        var sunbun = document.getElementById('comment_sunbun').value;
        var eventIdx = document.getElementById('event_idx').value;
        var comIdx = document.getElementById('com_idx').value;
        var content = document.getElementById('floatingTextarea2').value;

        var params = "event_writer=" + writer + "&comment_ref=" + ref + "&comment_sunbun=" + sunbun + "&event_idx=" + eventIdx + "&com_idx=" + comIdx + "&event_content=" + content;

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "company_eventReWrite.do", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var responseData = JSON.parse(xhr.responseText);
                if (responseData.success) {
                    alert(responseData.msg);
                    location.reload();
                } else {
                    alert(responseData.msg);
                }
            }
        };

        xhr.send(params);
    }
</script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        allReList(${sessionScope.dto.com_idx},${eventDto.comment_ref});
    });

    function allReList(com_idx, comment_ref) {
        var param = 'com_idx=' + com_idx + '&comment_ref=' + comment_ref;
        sendRequest('company_eventReWriteList.do', param, showShowResult, 'GET');
    }
    
    
    function showShowResult() {
        if (XHR.readyState == 4) {
            if (XHR.status == 200) {
                var data = XHR.responseText;
                data = JSON.parse(data);
                var list = data.list;
                var commentListNode = document.getElementById('commentList');
                commentListNode.innerHTML = '';

                if (list != null && list.length != 0) {
                    var tableNode = document.createElement('table');
                    tableNode.className = 'table table-striped'; 
                    var theadNode = document.createElement('thead');
                    var tbodyNode = document.createElement('tbody');

                    var headerRow = document.createElement('tr');
                    var writerHeader = document.createElement('th');
                    writerHeader.textContent = '작성자';
                    var contentHeader = document.createElement('th');
                    contentHeader.textContent = '내용';

                    headerRow.appendChild(writerHeader);
                    headerRow.appendChild(contentHeader);
                    theadNode.appendChild(headerRow);
                    tableNode.appendChild(theadNode);

                    for (var i = 0; i < list.length; i++) {
                        var rowData = list[i];
                        var row = document.createElement('tr');

                        var writerCell = document.createElement('td');
                        writerCell.textContent = rowData.event_writer;

                        var contentCell = document.createElement('td');
                        contentCell.innerHTML = rowData.event_content.replace(/\n/g, '<br>');

                        row.appendChild(writerCell);
                        row.appendChild(contentCell);
                        tbodyNode.appendChild(row);
                    }

                    tableNode.appendChild(tbodyNode);
                    commentListNode.appendChild(tableNode);
                    
                } else {
                    var divNode = document.createElement('div');
                    divNode.innerHTML = '댓글이 없습니다.';
                    commentListNode.appendChild(divNode);
                }
            } else {
                alert('댓글을 불러오는 도중 오류가 발생했습니다.');
            }
        }
    }






</script>
				<c:if test="${dto.rank_num == 2 || dto.rank_num == 1}">
				<div class="d-flex justify-content-center">
					<button id="bt" type="button" class="btn btn-outline-primary"
						onclick="location.href='company_event_List.do?com_idx=${dto.getCom_idx()}';">목록</button>
					&nbsp; &nbsp;
					<button id="bt" type="button" class="btn btn-outline-success"
						onclick="updateEvent(${eventDto.event_idx});">수정</button>
					&nbsp; &nbsp;
					<button id="bt" type="button" class="btn btn-outline-danger"
						onclick="deleteEvent(${eventDto.event_idx});">삭제</button>
				</div>
				</c:if>
				
				<c:if test="${dto.rank_num == 3}">
						<div class="d-flex justify-content-center">
					<button id="bt" type="button" class="btn btn-outline-primary"
						onclick="location.href='company_event_List.do?com_idx=${dto.getCom_idx()}';">목록</button>
						</div>
				</c:if>


<div id="commentView" class="container mt-3"><h5 style="font-weight: bold;">댓글</h5>
	<table id="commentList" width="1000" cellspacing="0" class="table"></table>
</div>


			</div>
		</div>
</div>
</body>
</html>