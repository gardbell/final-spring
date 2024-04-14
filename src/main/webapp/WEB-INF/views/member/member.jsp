<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ACE WORKS 회원가입</title>
<link rel="stylesheet" type="text/css" href="css/memberLayout.css">
<script src="js/httpRequest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function combine(event){
	var front = document.getElementById('hum_num1').value;
	var back = document.getElementById('hum_num2').value;
	
	var addr1 = document.getElementById('sample4_postcode').value;
	var addr2 = document.getElementById('sample4_roadAddress').value;
	var addr3 = document.getElementById('sample4_jibunAddress').value;
	var addr4 = document.getElementById('sample4_detailAddress').value;
	var addr5 = document.getElementById('sample4_extraAddress').value;
	
	var email1 = document.getElementById('email1').value;
	var email2 = document.getElementById('email2').value;
	
	var fullNumber = front + '-' + back;
	var fullAddr = addr1 + '/' + addr2 + '/' + addr3 + '/' + addr4 + '/' + addr5;
	var fullEmail = email1 + '@' + email2;
	
	document.getElementById('hum_num').value = fullNumber;
	document.getElementById('addr').value = fullAddr;
	document.getElementById('email').value = fullEmail;
	document.getElementById('hum_num').submit();
	document.getElementById('addr').submit();	
	document.getElementById('email').submit();	
	
}

function email_change(){
	if(document.join.emails.value == '1'){
		document.join.email2.disabled = false;
		document.join.email2.value = "";
		document.join.email2.focus();
	} else{
		document.join.email2.disabled = true;
		document.join.email2.value = document.join.emails.value;
	}
}

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
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
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

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}

function show(){
	sendRequest('memberJoin.do',null,showResult,'GET');		
}
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			var divNode = document.all.memberJoin;
				divNode.innerHTML = '';
				divNode.innerHTML = data;
		}		
	}
}
function show2(){
	sendRequest('companyJoin.do',null,showResult,'GET');		
}

function idCheckMsg(){
	var id = document.join.id.value;
	if(id==''||id==null){
		window.alert('아이디를 입력해주세요~');
		return false;
	}
	var param = 'id='+id;
	sendRequest('idCheck.do',param,idCheckShow,'GET');	
}

function idCheckShow(){
	if(XHR.readyState==4){		
		if(XHR.status==200){
			var data = XHR.responseText;
			var msgspan = document.all.idCheckMsg;
			msgspan.innerHTML=data;					
		
		}
	}
}

function com_show(){
	window.open("companyFind.do","기업 조회","width=400, height=300, top=10, left=10");
}

function comCheck(){
	var com_name = document.join.com_name.value;
	if(com_name==''||com_name==null){
		window.alert('기업명을 입력해주세요~');
		return;
	}
	var param = 'com_name='+com_name;
	sendRequest('comCheck.do',param,comCheckShow,'GET');	
}

function comCheckShow(){
	if(XHR.readyState==4){		
		if(XHR.status==200){
			var data = XHR.responseText;
			var msgspan = document.all.comCheck;
			msgspan.innerHTML=data;
		}
	}
}

function fileUp(a) {
    var fkind = a.value.lastIndexOf('.');
    var fname = a.value.substring(fkind + 1, a.length);
    var ftype = fname.toLowerCase();
    var check_ftype = ['jpg', 'png', 'jpeg'];

    if (check_ftype.indexOf(ftype) == -1) {
        alert('jpg, jpeg, png 파일만 선택할 수 있습니다.');
        var newInput = a.cloneNode(true);
        newInput.onchange = fileUp; 
        var parent = a.parentNode;
        parent.replaceChild(newInput, a);
        newInput.value = '';
        return false;
    }
}

</script>
</head>
<body>
<a href="login.do">
<h2>ACE WORKS</h2>
</a>
<div align="center">
		<input class="push1" type="button" value="회원등록" onclick="show()">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input class="push1" type="button" value="기업등록" onclick="show2()">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input class="push1" type="button" value="돌아가기" onclick="location.href='login.do'">
</div>
<div id="memberJoin"></div>

</body>
</html>