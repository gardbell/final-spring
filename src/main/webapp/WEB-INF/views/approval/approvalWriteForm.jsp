<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/style.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ACE WORKS</title>
<style>
#left {
	width: 200px;
	height: 600px;
	float: left;
	border-right: 2px solid darkblue;
	margin-left: 50px;
}

#right {
	width: 900px;
	height: 600px;
	margin-left: 260px;
}

#comimg {
	width: 150px;
	height: 150px;
}

#bt {
	width: 180px;
	height: 40px;
}

a {
	text-decoration: none;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="js/httpRequest.js"></script>
<script>
	function selectApprover() {
		var param = 'com_idx=' + '${dto.com_idx}';
		sendRequest('selectApprover.do', param, listResult, 'POST');
	}

	function listResult() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = XHR.responseText;
				data = JSON.parse(data);
				var list = data.list;
				var selectNode = document.getElementById('approver');
				for (var i = 0; i < list.length; i++) {
					if ('${dto.idx}' != list[i].idx) {
						var optionNode = document.createElement('option');
						optionNode.setAttribute('value', list[i].idx);
						optionNode.innerHTML = list[i].name;
						selectNode.appendChild(optionNode);
					}
				}
				var formNode = document.getElementById('approvalWriteForm');
				var refNode = document.createElement('input');
				refNode.setAttribute('type', 'hidden');
				refNode.setAttribute('name', 'ref');
				refNode.setAttribute('value', data.ref);
				formNode.appendChild(refNode);
			}
		}
	}
	var count = 1;
	function addFile() {
		var fileId = 'file' + count;

		var newListNode = document.createElement('li');
		newListNode.setAttribute('id', fileId);

		var newLabelNode = document.createElement('label');
		var newLabelText = document.createTextNode('파일선택');
		newLabelNode.appendChild(newLabelText);
		var newInputNode = document.createElement('input');
		newInputNode.setAttribute('type', 'file');
		newInputNode.setAttribute('name', 'upload');

		var newInputNode2 = document.createElement('input');
		newInputNode2.setAttribute('type', 'button');
		newInputNode2.setAttribute('value', '삭제');
		newInputNode2.setAttribute('onclick', 'delFile(' + count + ')');

		newListNode.appendChild(newLabelNode);
		newListNode.appendChild(newInputNode);
		newListNode.appendChild(newInputNode2);

		var ulNode = document.getElementById('fileUpload');
		ulNode.appendChild(newListNode);

		count += 1;

	}
	function delFile(num) {
		var fileId = 'file' + num;
		var ulNode = document.getElementById('fileUpload');
		var listNode = document.getElementById(fileId);
		ulNode.removeChild(listNode);
	}
	function writeNews() {
		location.href = 'approvalWriteForm.do';
	}
</script>
</head>
<body onload="javascript:selectApprover()">
	<div>
		<div id="left">
			<button id="bt" type="button" class="btn btn-outline-primary"
				onclick="javascript:location.href='approval.do?idx=${dto.idx}';">결재메인</button>
			<div class="mt-3">
				<c:if test="${cdto.com_img ==null }">
					<a href="goMain.do"><img id="comimg"
						src="img/noImage/noImage.jpg"></a>
				</c:if>
				<c:if test="${cdto.com_img !=null }">
					<a href="goMain.do"><img id="comimg"
						src="img/${cdto.com_name}/${cdto.com_img}"></a>
				</c:if>
			</div>

			<div class="mt-3">

				<a href="company_news_List.do?com_idx=${dto.getCom_idx()}">회사소식</a>
				<br> <a
					href="company_event_List.do?com_idx=${dto.getCom_idx()}">경조사</a> <br>
				<a href="memberMailList.do?com_idx=${dto.getCom_idx()}">메일</a> <br>
				<a href="approval.do?idx=${dto.getIdx()}">결재문서</a> <br> <a
					href="schedule.do">스케줄</a> <br> <a href="insa.do">인사관리</a> <br>
			</div>
		</div>
		<form id="approvalWriteForm" name="approvalWriteForm"
			action="approvalWriteForm.do" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="com_idx" value="${dto.getCom_idx()}">
			<input type="hidden" name="writer" value="${dto.getIdx()}">
			<div id="right">
				<div class="container">

					<div class="mt-5 mb-2">
						<span class="h4">결재문서 &gt;&gt; 게시글 작성</span>
					</div>

					<div class="mb-2 d-flex gap-2">
						<input type="text" name="title" class="form-control"
							placeholder="제목" autocomplete="off" id="title"> <select
							name="approver" class="form-select form-select-sm" id="approver"
							style="width: 200px;">
							<option value="0">결재자 선택</option>
						</select>
					</div>
					<div>
						<input type="button" value="파일추가" onclick="addFile()">
						<ul id="fileUpload">
						</ul>
					</div>
					<div>
						<textarea id="summernote" name="content"></textarea>
					</div>

					<div class="mt-2 d-flex gap-2 justify-content-center">
						<input type="submit" class="btn btn-primary" id="submitqq"
							value="저장">
					</div>
				</div>

			</div>
		</form>
		<script>
			$('#summernote').summernote(
					{
						placeholder : '내용을 입력해 주세요.',
						tabsize : 2,
						height : 300,
						width : 875,
						toolbar : [ [ 'style', [ 'style' ] ],
								[ 'font', [ 'bold', 'underline', 'clear' ] ],
								[ 'color', [ 'color' ] ],
								[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
								[ 'table', [ 'table' ] ],
								[ 'view', [ 'codeview', 'help' ] ] ]
					});
			$('textarea[name="content"]').html($('.summernote').code());
		</script>
	</div>
</body>
</html>