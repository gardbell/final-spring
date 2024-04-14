<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ACE WORKS</title>
<link rel="stylesheet" type="text/css" href="css/loginLayout.css">
</head>
<body>
<c:if test="${!empty dto}">
<script>
	location.href='goMain.do';
</script>
</c:if>
<h2>ACE WORKS</h2>
<form name="fm" action="login.do" method="post">
<input class="text" type="text" name="userid" value="${cookie.saveid.value }" placeholder="ID" autocomplete="off" required>
<input class="text" type="password" name="userpwd" placeholder="Password" autocomplete="off" required>
<label>
	<input type="checkbox" name="saveid" value="on" 
	${empty cookie.saveid.value?'':'checked' }> ID 저장하기
	<br><br>
</label>
	<input class="submit" class="submit" type="submit" value="로그인">
</form>
<br><hr><br>
<div class="tcenter">
<a href="member.do">새 계정 만들기</a><br>
</div>
<br>
<div class="tcenter">
<a href="idpwFind.do">계정을 잊으셨나요?</a>
</div>
<br><hr><br>
</body>
</html>