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
    var url = 'company_event_Delete.do?event_idx=' + event_idx;
    window.location.href = url;
}
function updateEvent(event_idx) {
	var url = 'company_event_UpdateForm.do?event_idx=' + event_idx;
    window.location.href = url;
}
function previousEvent(event_idx,com_idx) {
	var url = 'company_event_PreviousEvent.do?event_idx=' + event_idx+'&com_idx='+com_idx;
	window.location.href = url;
}
function nextEvent(event_idx,com_idx) {
	var url = 'company_event_NextEvent.do?event_idx=' + event_idx+'&com_idx='+com_idx;
	window.location.href = url;
}
</script>
<style>
#left {
	width: 200px;
	height: 1000px;
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

#map {
	width: 300px;
	height: 300px;
	margin-top: 10px;
}
a{
	text-decoration: none;
}
</style>
</head>
<body>
<div>
	<div id="left">
		<button id="bt" type="button" class="btn btn-outline-primary"
				onclick="location.href='company_event_Writeform.do';">글 작성</button>
		<div class="mt-3"><a href="company_news_List.do?com_idx=${dto.getCom_idx()}">회사소식</a> <br> <a href="company_event_List.do?com_idx=${dto.getCom_idx()}">경조사</a> <br><a href="fileUploadForm.do">파일업로드</a></div>
	</div>

		<div id="right">
		
			<div class="container">
				<div class="mt-5 mb-2">
					<span class="h4">임직원 경조사&gt;&gt;${eventDto.event_idx }번 게시글</span>&nbsp;
					&nbsp;
					<button id="PNbt" type="button" class="btn btn-outline-dark"
						onclick="previousEvent(${eventDto.event_idx},${dto.getCom_idx()});">이전글</button>
					<button id="PNbt" type="button" class="btn btn-outline-dark"
						onclick="nextEvent(${eventDto.event_idx},${dto.getCom_idx()});">다음글</button>
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

						<td>
						<h5>찾아오시는 길</h5>
						<div id="map" class="d-flex justify-content-center"></div>
					
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
			</div>
		</div>

</div>
</body>
</html>