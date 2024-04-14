<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/style.jsp"%>
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
	margin-left: 300px;
}

#bt {
	width: 150px;
	height: 40px;
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
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress; 
                var extraRoadAddr = '';

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                document.getElementById("sample4_roadAddress").value = roadAddr;

                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");

                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
<script>
function sb(event) {

	var addr2 = document.getElementById('sample4_roadAddress').value;
	var addr4 = document.getElementById('sample4_detailAddress').value;
	var addr5 = document.getElementById('sample4_extraAddress').value;

	var fullAddr = addr2 + '/'+ addr4 + '/' + addr5;
	document.getElementById('event_addr').value = fullAddr;
	document.getElementById('event_addr').submit();
}
</script>
</head>
<body>
	<div>

		<div class="mb-5">
			<h5>${dto.getName()}
				님&nbsp;<a class="logout" href="logout.do">로그아웃</a>
			</h5>
		</div>

		<div id="left">
		<button id="bt" type="button" class="btn btn-outline-primary"
		onclick="confirmNavigation('company_event_List.do?com_idx=${dto.getCom_idx()}')">목록</button>
					<div class="mt-3">
		<a href="javascript:void(0);" onclick="confirmNavigation('goMain.do')"><img id="comimg" src="img/${cdto.com_name}/${cdto.com_img}"></a></div>
			
		<script>
		function confirmNavigation(url) {
		    if (confirm("입력정보가 사라집니다. 이동하시겠습니까?")) {
		        window.location.href = url;
		    }
		}
		</script>	
			
		<div class="mt-3">
    		<a href="javascript:void(0);" onclick="confirmNavigation('company_news_List.do?com_idx=${dto.getCom_idx()}')">회사소식</a> <br>
		    <a href="javascript:void(0);" onclick="confirmNavigation('company_event_List.do?com_idx=${dto.getCom_idx()}')">경조사</a> <br>
		    <a href="javascript:void(0);" onclick="confirmNavigation('memberMailList.do?com_idx=${dto.getCom_idx()}')">메일</a> <br>
		    <a href="javascript:void(0);" onclick="confirmNavigation('approval.do')">결제문서</a> <br>
		    <a href="javascript:void(0);" onclick="confirmNavigation('schedule.do')">스케줄</a> <br>
		    <a href="javascript:void(0);" onclick="confirmNavigation('insa.do')">인사관리</a> <br>
		</div>
			
		</div>
		
		<form name="company_eventWrite" action="company_eventWrite.do" method="post" onsubmit="sb()">
		
		<input type="hidden" name="com_idx" value="${dto.getCom_idx()}">
		<input type="hidden" id="event_addr" name="event_addr">
	
		<div id="right"> 
		<div class="container">
		
		<div class="mt-5 mb-2"><span class="h4">경조사 &gt;&gt; 게시글 작성</span></div>
		
		<div class="mb-2 d-flex gap-2">
		<input type="text" name="event_title" class="form-control" placeholder="제목" autocomplete="off" id="event_title">
		<input type="text" name="event_writer" class="form-control" placeholder="작성자" id="event_writer" value="${dto.getName()}">
		</div>
		

		<div class="mb-2 d-flex gap-2">
		<input type="button" class="btn btn-outline-primary" onclick="sample4_execDaumPostcode()" value="주소검색">
		<input type="text" class="form-control" id="sample4_roadAddress" name="addr2" placeholder="도로명주소">
		
		<span id="guide" style="color:#999;display:none"></span>
		</div>
		<div class="mb-2 d-flex gap-2">
		<input type="text" class="form-control" id="sample4_detailAddress" name="add4" placeholder="상세주소">
		<input type="text" class="form-control" id="sample4_extraAddress" name="addr5" placeholder="참고항목">
		</div>

		 <div>
		 	<textarea id="summernote" name="event_content"></textarea>
		 </div>	
		 
		 <div class="mt-2 d-flex gap-2 justify-content-center">
		<button class="btn btn-primary" id="submit">작성하기</button>
		</div>
		
		</div>
  <script>
      $('#summernote').summernote({
        placeholder: '내용을 입력해 주세요.',
        tabsize: 2,
        height: 400,
        width :875,
        
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],      
          ['view', ['codeview', 'help']]
        ]
      });
      
      $('textarea[name="news_content"]').html($('.summernote').code());
    </script> 
		</div>
</form>
		
	</div>
</body>
</html>