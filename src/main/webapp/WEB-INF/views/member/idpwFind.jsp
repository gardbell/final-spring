<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<link rel="stylesheet" type="text/css" href="css/loginLayout.css">
<script src="js/httpRequest.js"></script>
<script>
function show(){
	sendRequest('idpwMemId.do',null,showResult,'GET');
}
function show2(){
	sendRequest('idpwMemPwd.do',null,showResult,'GET');		
}
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			var divNode = document.all.showtab;
			if(divNode.innerHTML==''){
				divNode.innerHTML = data;
			}else{
				divNode.innerHTML = '';
			}
		}		
	}
}

</script>
</head>
<body>
<a href="login.do">
<h2>ACE WORKS</h2>
</a>

<div align="center">
<table>
<tr height="150">
	<th colspan="2">가입한 아이디,<br>또는<br>비밀번호를 잊으셨습니까?</th>
</tr>
<tr height="100">
	<td style="border: 1px solid lightgray;">
		<a href="javascript:show()">아이디 찾기</a></td>
	<td style="border: 1px solid lightgray;">
		<a href="javascript:show2()">비밀번호 찾기</a></td>
</tr>
</table>
</div>

<div id="showtab" align="center"></div>
</body>
</html>