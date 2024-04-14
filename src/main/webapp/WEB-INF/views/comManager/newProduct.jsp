<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="newProduct.do" method="post">
<h1>새 아이템 추가</h1>
<hr>
<input type="hidden" name="com_idx" value="${cdto.com_idx }">
<table style="width:800px">
<tr>
	<th style="width:100px; height: 50px;">상품명</th>
	<td><input class="text2" type="text" name="item_name"></td>
</tr>
<tr>
	<th style="width:100px; height: 50px;">상품 가격</th>
	<td><input class="text2" type="text" name="item_price"></td>
</tr>
<tr>
	<th style="width:100px; height: 50px;">개당 이익</th>
	<td><input class="text2" type="text" name="item_cost"></td>
</tr>
<tr>
	<td></td>
	<td><input class="submit" type="submit" value="저장"></td>
</tr>
</table>
</form>