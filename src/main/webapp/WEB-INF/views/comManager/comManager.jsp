<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업관리자 페이지</title>
<link rel="stylesheet" type="text/css" href="css/comManagerLayout.css">
<script src="js/httpRequest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
function show1(){
	var a = 'com_idx='+'${cdto.com_idx}';
	sendRequest('memberList.do',a,showResult,'GET');		
}
function show2(){
	var a = 'com_idx='+'${cdto.com_idx}';
	sendRequest('sales.do',a,showResult,'GET');
}
function show3(cp){
	if(cp==null){
		cp=1;
	}
	var a = 'com_idx='+'${cdto.com_idx}'+'&cp='+cp;
	sendRequest('clientTel.do',a,showResult,'GET');		
}

function sal(){
	var a = 'com_idx='+'${cdto.com_idx}'
	sendRequest('memberSal.do',a,showResult,'GET');		
}
function work() {
	var a = 'com_idx='+'${cdto.com_idx}'
    sendRequest('memworkList.do',a, showResult, 'GET');
}
function benefit() {
	var a = 'com_idx='+'${cdto.com_idx}'
    sendRequest('memBenefitList.do',a, showResult, 'GET');
}

function update(a){
	var x = 'id='+a;
	sendRequest('memberUpdate.do',x,showResult,'GET');
}

function newTel(){
	sendRequest('clientTelWrite.do',null,showResult,'GET');
}

function rewriteTel(a){
	var x = 'client_tel_idx='+a;
	sendRequest('rewriteTel.do',x,showResult,'GET');
}

function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			var divNode = document.all.writer;
				divNode.innerHTML = '';
				divNode.innerHTML = data;
		}		
	}
}

function proof() {
	var b = document.all.proof.value;
	if(b==1){
		show1();
	}else{		
		var a = 'com_idx='+'${cdto.com_idx}'+'&rank_num='+b;
		sendRequest('memberNot.do',a,showResult,'GET');
	}
}

function promotion(a){
	var msg = '승인하시겠습니까?';
	var result = window.confirm(msg);
	if(result){
		alert('승인');
		location.href="memberPromotion.do?idx="+a;
	}
}

function newSales(){
	var a = 'com_idx='+'${cdto.com_idx}';
	sendRequest('salesWrite.do',a,showResult,'GET')
}
function delSale(a,b,c){
	var x = '?com_idx='+'${cdto.com_idx}'+'&year='+a+'&month='+b+'&date='+c;
	location.href="delSale.do"+x;
}
function newProduct(){
	sendRequest('newProduct.do',null,showResult,'GET')
}

function chart(){
	var labels = [];
	var data = [];
		labels.push('${sales[4].writedate}');
		labels.push('${sales[3].writedate}');
		labels.push('${sales[2].writedate}');
		labels.push('${sales[1].writedate}');
		labels.push('${sales[0].writedate}');
		data.push('${sales[4].sales}');
		data.push('${sales[3].sales}');
		data.push('${sales[2].sales}');
		data.push('${sales[1].sales}');
		data.push('${sales[0].sales}');
	var ctx = document.getElementById("myChart").getContext('2d');
	var myChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: labels,
	    datasets: [{
	      label: '# 판매량',
	      data: data,
	      
	      borderWidth: 1
	    }]
	  }, options: {
			responsive: false
	  }
	});
}

function workpromotion(a){
	var msg = '승인하시겠습니까?';
	var result = window.confirm(msg);
	if(result){
		alert('승인');
		location.href="workPromotion.do?idx="+a;
	}
}

function benefitpromotion(a){
	var msg = '승인하시겠습니까?';
	var result = window.confirm(msg);
	if(result){
		alert('승인');
		location.href="benefitPromotion.do?idx="+a;
	}
}

</script>
</head>
<body>
<c:if test="${dto.rank_num != 1 && dto.rank_num != 2}">
<script>
	window.alert('허용되지 않은 접근입니다.');
	location.href='logout.do';
</script>
</c:if>
<h5>${dto.getName()} 님&nbsp;<a class="logout" href="logout.do">로그아웃</a></h5>
<div class="left">
	<ul>
		<c:if test="${cdto.com_img==null}">
		<li><a href="goMain.do">
			<img class="comImg" src="img/noImage/noImage.jpg" alt="noImage.jpg"></a>
		</li>
		</c:if>
		<c:if test="${cdto.com_img!=null}">
		<li><a href="goMain.do">
			<img class="comImg" src="img/${cdto.com_name}/${cdto.com_img}" alt="${cdto.com_img}"></a>
		</li>
		</c:if>
		<li><a class="link" href='javascript:void(0);' onclick="show1();">사원목록</a></li>
		<li><a class="link" href='javascript:void(0);' onclick="show2();">매출현황</a></li>
		<li><a class="link" href='javascript:void(0);' onclick="show3(1);">거래처연락망</a></li>
		<li><a class="link" href='javascript:void(0);' onclick="sal();">사원급여목록</a></li>
		<li><a class="link" href='javascript:void(0);' onclick="work();">사원근태관리</a></li>
		<li><a class="link" href='javascript:void(0);' onclick="benefit();">사원복지관리</a></li>
	</ul>
</div>
<div class="right" id="writer">
	<br><br><br><br>
	<h5>좌측의 메뉴를 클릭해주세요 !!</h5>
</div>
</body>
</html>