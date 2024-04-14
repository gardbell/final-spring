<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업조회</title>
<script>
function show(a, b, c){
	opener.document.all.com_idx_show.value=b;
	opener.document.all.com_idx.value=a;
	updateParentSelect(c);
	self.close();
}


function updateParentSelect(c) {
  var parentSelect = window.opener.document.getElementById('dept');
  
  while (parentSelect.firstChild) {
    parentSelect.removeChild(parentSelect.firstChild);
  }
  
  var positionData = c;
  var items = positionData.split('/');
  
  items.forEach(function(item) {
    var option = document.createElement('option');
    option.value = item;
    option.textContent = item;
    parentSelect.appendChild(option);
  });
}




</script>
</head>
<body>
<form action="companyFind.do" method="post">
<h3>기업 조회</h3>
<div>
조회: <input type="text" name="com_name" placeholder="기업명">
<input type="submit" value="조회">
</div>
</form>
<hr>
<div id="comList">
<table>
<tr>
	<th>번호</th>
	<th>기업명</th>
	<th>확인</th>
</tr>
<c:if test="${!empty comList}">
<c:forEach var="dto" items="${comList}">
<tr>
	<td>${dto.com_idx }</td>
	<td>${dto.com_name }</td>
	<td><input type="button" value="확인" onclick="show('${dto.com_idx}','${dto.com_name }','${dto.dept}')"></td>	
</tr>
</c:forEach>
</c:if>
</table>
</div>
</body>
</html>