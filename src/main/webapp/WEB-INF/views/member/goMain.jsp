<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.getName()} 님의 aceworks</title>
<link rel="stylesheet" type="text/css" href="css/comManagerLayout.css">
<script src="js/httpRequest.js"></script>
<script>
function start(){
	   checkLicense();
	}
	function delLicense(){
	   var param="com_idx="+'${dto.com_idx}';
	   sendRequest('delLicense.do',param,delResult,'POST');
	}
	function delResult(){
	   if(XHR.readyState==4){
	        if(XHR.status==200){
	           var data = XHR.responseText;
	            data = JSON.parse(data);
	            var msg = data.msg;
	            if(msg=='라이센스가 만료되었습니다.'){
	                window.alert(msg);
	            }else {
	               show();
	            }
	        } else {
	            window.alert("서버 오류가 발생했습니다.");
	        }
	    }
	}
	function checkLicense(){
	   var param="com_idx="+'${dto.com_idx}';
	   sendRequest('checkLicense.do',param,checkResult,'POST');
	}
	function checkResult(){
	   if(XHR.readyState==4){
	        if(XHR.status==200){
	           var data = XHR.responseText;
	            data = JSON.parse(data);
	            var result = parseInt(data.result);
	            if(result==0){
	               checkCEO();
	            }else{
	               delLicense();
	            }
	        } else {
	            window.alert("서버 오류가 발생했습니다.");
	        }
	    }
	}
	function checkCEO(){
	   var param='com_idx='+'${dto.com_idx}';
	   sendRequest('checkCEO.do',param,check2Result,'POST');
	}
	function check2Result(){
		   if(XHR.readyState==4){
		        if(XHR.status==200){
		           var data = XHR.responseText;
		            data = JSON.parse(data);
		            var ceoidx = parseInt(data.ceoidx);
		            if(ceoidx=='${dto.idx}'){
		               if(confirm("라이센스가 없어 사용 불가능합니다 라이센스 구매페이지로 이동하시겠습니까?")){
		                  location.href="kakaoPay.do";
		               }else{
		                  location.href="logout.do";
		               }
		            }else if('${dto.rank_num}'==1){
		               if(confirm("라이센스가 없어 사용 불가능합니다 라이센스 구매페이지로 이동하시겠습니까?")){
		                  location.href="kakaoPay.do";
		               }else{
		                  location.href="logout.do";
		               }
		            } else{
		               alert('라이센스가 없어 사용 불가능합니다.');
		               location.href="logout.do";
		            }
		        } else {
		            window.alert("서버 오류가 발생했습니다.");
		        }
		    }
		}
	function show(){
	   var a = 'com_idx='+'${cdto.com_idx}';
	   sendRequest('comNews3.do',a,showResult1,'GET');         
	}
	function showResult1(){
	   if(XHR.readyState==4){
	      if(XHR.status==200){
	         var data = XHR.responseText;
	         var divNode = document.all.news;
	            divNode.innerHTML = '';
	            divNode.innerHTML = data;
	            var a = 'com_idx='+'${cdto.com_idx}';
	            sendRequest('comEvent3.do',a,showResult2,'GET');   
	      }      
	   }
	}
	function showResult2(){
	   if(XHR.readyState==4){
	      if(XHR.status==200){
	         var data = XHR.responseText;
	         var divNode = document.all.event;
	            divNode.innerHTML = '';
	            divNode.innerHTML = data;
	      }      
	   }
	}
</script>
</head>
<body onload="start()">
<c:if test="${dto.rank_num == 0 || dto.rank_num == null}">
<script>
	window.alert('승인이 필요합니다.\n자동 로그아웃 됩니다.');
	location.href='logout.do';
</script>
</c:if>

<div>
<c:if test="${dto.rank_num != 0}">
<div align="left" style="display: inline-block;">
<h5>${dto.getName()} 님 접속 중 | <a class="logout" href="logout.do">로그아웃</a></h5>
</div>
</c:if>

<c:if test="${dto.rank_num == 1}">
<div style="display: inline-block; float: right; margin: 30px">
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input class="push1" type="button" value="관리자페이지" onclick="location.href='main_admin.do'">
</div>
</c:if>

<c:if test="${dto.rank_num == 2}">
<div style="display: inline-block; float: right; margin: 30px">
	&nbsp;&nbsp;&nbsp;&nbsp;
	<a class="linksmall"  href="withdrawCompany.do" >기업탈퇴</a> | <a class="linksmall"  href="qnaList.do">문의사항</a>
</div>
</c:if>

</div>

<div class="divcen">
			<c:if test="${cdto.com_img==null}">
			<a href="goMain.do">
			<img class="mainImg" src="img/noImage/noImage.jpg" alt="noImage.jpg"></a><br>
			</c:if>
			<c:if test="${cdto.com_img!=null}">
			<a href="goMain.do">
			<img class="mainImg" src="img/${cdto.com_name}/${cdto.com_img}" alt="${cdto.com_img}"></a><br>
			</c:if>
			<br><hr><br>
<a class="link" href="company_news_List.do?com_idx=${dto.getCom_idx()}">회사소식</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a class="link" href="company_event_List.do?com_idx=${dto.getCom_idx()}">경조사</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a class="link" href="approval.do?idx=${dto.getIdx()}">결재문서</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a class="link" href="schedule.do">스케줄</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a class="link" href="insa.do">인사관리</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a class="link" href="memberMailList.do?com_idx=${dto.getCom_idx()}">메일</a>&nbsp;&nbsp;&nbsp;&nbsp;
<c:if test="${dto.rank_num == 2 || dto.rank_num == 1}">
	<a class="link" href="companyManager.do?com_idx=${dto.getCom_idx()}">기업관리</a>&nbsp;&nbsp;&nbsp;&nbsp;
</c:if>
<c:if test="${dto.rank_num == 2}">
   <a class="link" href="kakaoPay.do?check=1">라이센스관리</a>
</c:if>
</div>
<div align="center">
<div id="news" style="display: inline-block; margin-right: 30px;"></div>
<div id="event" style="display: inline-block"></div>
</div>

</body>
</html>