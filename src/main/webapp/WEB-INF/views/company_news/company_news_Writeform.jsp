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
</head>
<body>
	<div>
	
	<div class="mb-5">
	<h5>${dto.getName()} 님&nbsp;<a class="logout" href="logout.do">로그아웃</a></h5>
	</div>

		<div id="left">
		<button id="bt" type="button" class="btn btn-outline-primary"
		onclick="confirmNavigation('company_news_List.do?com_idx=${dto.getCom_idx()}')">목록</button>
		
					
		<div class="mt-3">
		<a href="javascript:void(0);" onclick="confirmNavigation('goMain.do')"><img id="comimg" src="img/${cdto.com_name}/${cdto.com_img}"></a>

		<script>
		function confirmNavigation(url) {
		    if (confirm("입력정보가 사라집니다. 이동하시겠습니까?")) {
		        window.location.href = url;
		    }
		}
		</script>

		
		</div>
			
		<div class="mt-3">
    		<a href="javascript:void(0);" onclick="confirmNavigation('company_news_List.do?com_idx=${dto.getCom_idx()}')">회사소식</a> <br>
		    <a href="javascript:void(0);" onclick="confirmNavigation('company_event_List.do?com_idx=${dto.getCom_idx()}')">경조사</a> <br>
		    <a href="javascript:void(0);" onclick="confirmNavigation('memberMailList.do?com_idx=${dto.getCom_idx()}')">메일</a> <br>
		    <a href="javascript:void(0);" onclick="confirmNavigation('approval.do')">결제문서</a> <br>
		    <a href="javascript:void(0);" onclick="confirmNavigation('schedule.do')">스케줄</a> <br>
		    <a href="javascript:void(0);" onclick="confirmNavigation('insa.do')">인사관리</a> <br>
		</div>
	
			
		</div>
		
		<form name="company_newsWrite" action="company_newsWrite.do" method="post">
		<input type="hidden" name="com_idx" value="${dto.getCom_idx()}">
		<div id="right"> 
		<div class="container">
		
		<div class="mt-5 mb-2"><span class="h4">회사소식 &gt;&gt; 게시글 작성</span></div>
		
		<div class="mb-2 d-flex gap-2">
		<input type="text" name="news_title" class="form-control" placeholder="제목" autocomplete="off" id="news_title">
		<input type="text" name="news_writer" class="form-control" placeholder="작성자" id="news_writer" value="${dto.getName()}">
		</div>
		
		
		 <div>
		 	<textarea id="summernote" name="news_content"></textarea>
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