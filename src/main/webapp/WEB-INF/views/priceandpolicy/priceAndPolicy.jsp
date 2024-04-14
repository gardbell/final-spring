<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ACE WORKS</title>
<style>
</style>
<script>
	//셀렉트값 선택시 텍스트영역(priceArea)의 밸류 변경
	var nowPricesort = null;
	var nowPrice = null;

	var nowTitleIdx = null;
	var nowTitle = null;
	var nowContent = null;
	function changeSort(price_sort) {
		var priceArea = document.getElementById("priceArea");
		var priceSortSelect = document.getElementById("priceSortSelect");
		var selectedOption = priceSortSelect.options[priceSortSelect.selectedIndex];
		var selectedPrice = selectedOption.getAttribute("data-price");
		priceArea.value = selectedPrice;
		nowPrice = selectedPrice;

	}
	// 페이지 로드 시 첫 번째 옵션의 가격을 표시하기 위한 함수
	window.onload = function() {
		// 첫 번째 옵션의 가격을 표시
		var firstOptionPrice = document.querySelector(
				'#priceSortSelect option:first-child').getAttribute(
				'data-price');
		var priceArea = document.getElementById("priceArea");
		priceArea.value = firstOptionPrice;
		nowPrice = firstOptionPrice;
		// 초기 약관 제목과 내용 설정
		var initialPolicyTitle = document.getElementById("initialPolicyTitle").value;
		var initialPolicyContent = document
				.getElementById("initialPolicyContent").value;
		var policyTitle = document.getElementById("policyTitle");
		var policyContent = document.getElementById("policyContent");
		policyTitle.value = initialPolicyTitle;
		policyContent.value = initialPolicyContent;
		nowTitle = initialPolicyTitle;
		nowContent = initialPolicyContent;

	};
	// priceArea에 숫자만 입력할 수 있도록 제한하는 함수
	function allowOnlyNumbers(event) {
		var key = event.keyCode || event.which;
		if (!(key >= 48 && key <= 57) && key != 8 && key != 9 && key != 37
				&& key != 39) {
			event.preventDefault();
		}
	}
	//셀렉트값(policyIdxSelect) 선택시 제목텍스트영역(policy_title)의 밸류 변경
	function changePidx(policy_idx) {
		var policyTitle = document.getElementById("policyTitle");
		var policyContent = document.getElementById("policyContent");
		var policyIdxSelect = document.getElementById("policyIdxSelect");
		var selectedOption = policyIdxSelect.options[policyIdxSelect.selectedIndex];
		var selectedTitle = selectedOption.getAttribute("data-title");
		var selectedContent = selectedOption.getAttribute("data-content");
		policyTitle.value = selectedTitle;
		policyContent.value = selectedContent;
		nowTitle = selectedTitle;
		nowContent = selectedContent;

	}
	function goDoubleCheck() {
		if (confirm('요금 :' + nowPrice + '\n약관제목 : ' + nowTitle + '\n수정하시겠습니까?')) {
			return true;
			document.forms[0].submit();
		} else {
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container mt-3">
		<form action="main_admin.do">

			<button id="Sbt" type="submit" class="btn btn btn-primary">메인으로</button>
		</form>
	</div>
	<h1 class="text-center mt-5 text-purple-light">요금 / 약관 관리</h1>

	<div class="d-flex justify-content-center align-items-center mt-5">
		<form action="priceAndPolicyUpdate.do">
			<table class="table">
				<tr>
					<th><h3>요금 번호</h3></th>
					<td><select class="form-select" style="width: 100px;"
						aria-label="Large select example" id="priceSortSelect"
						name="price_sort" onchange="changeSort(this.value)">
							<c:forEach var="dto" items="${price_lists }">
								<option value="${dto.price_sort }" data-price="${dto.price }">${dto.price_sort }</option>
							</c:forEach>
					</select></td>

					<th><h3>이용요금</h3></th>
					<td><input type="text" class="form-control" id="priceArea"
						name="price" onkeypress="allowOnlyNumbers(event)"></td>
					<td><h3>원</h3></td>
				</tr>
				<tr>
					<td><br> <br></td>
				</tr>
				<tr>
					<th><h3>약관 번호</h3></th>
					<td><select class="form-select" style="width: 100px;"
						aria-label="Large select example" id="policyIdxSelect"
						name="policy_idx" onchange="changePidx(this.value)">
							<c:forEach var="dto" items="${policylists }">
								<option value="${dto.policy_idx }"
									data-title="${dto.policy_title }"
									data-content="${dto.policy_content }">${dto.policy_idx }</option>
							</c:forEach>
					</select></td>
					<th colspan="2" style="text-align: right;"><h3>약관 제목</h3></th>
					<td><input type="text" class="form-control" id="policyTitle"
						name="policy_title"></td>
				</tr>
				<tr>
					<td colspan="5"><div class="form-floating">
							<textarea class="form-control" placeholder="Leave a comment here"
								id="policyContent" name="policy_content" style="height: 300px"></textarea>
							<label for="policyContent">약관 내용</label>
						</div></td>
				</tr>
				<tr>
					<td><br></td>
				</tr>
				<tr>
					<td colspan="5" class="text-center"><button id="updateBtn"
							type="submit" class="btn btn btn-primary"
							onclick="return goDoubleCheck()">수정하기</button></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 초기 데이터를 담는 hidden input 요소들 -->
	<input type="hidden" id="initialPolicyTitle"
		value="${policylists[0].policy_title}" />
	<input type="hidden" id="initialPolicyContent"
		value="${policylists[0].policy_content}" />
</body>
</html>