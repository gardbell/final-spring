<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/style.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ACE WORKS</title>
<script>
    function submitWithdraw() {
        // 폼 가져오기
        var form = document.getElementById("withdrawForm");
        // form의 com_idx 값 가져오기
        var comIdx = "${cdto.com_idx }";
        // com_idx 값을 폼에 추가
        var comIdxInput = document.createElement("input");
        comIdxInput.setAttribute("type", "hidden");
        comIdxInput.setAttribute("name", "com_idx");
        comIdxInput.setAttribute("value", comIdx);
        form.appendChild(comIdxInput);
        // 폼 제출
        form.submit();
    }

    function checkAgreement() {
        var checkbox = document.getElementById("agreementCheckbox");
        var submitButton = document.getElementById("submitButton");
        if (checkbox.checked) {
            submitButton.disabled = false;
        } else {
            submitButton.disabled = true;
        }
    }
</script>
</head>
<body>
    
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <!-- 전체 화면을 차지하고 제목을 중앙에 배치 -->
                <h1 class="mt-5 text-purple-light">기업정보 탈퇴안내</h1>
            </div>
        </div>
        <br>

        <div class="row">
            <div class="col-lg-10 offset-lg-1">
                <!-- 10개의 column을 차지하고 화면 중앙에 위치 -->
                <p class="text-left mt-3">회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
                <br>
                <div class="alert alert-warning mt-3" role="alert">
                    <strong>사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</strong>
                </div>
                <p class="text-left mt-3">
                    <span style="color: orange;">탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가불가</span>하오니
                    신중하게 선택하시기 바랍니다.
                </p>
                <br>
                <div class="alert alert-warning mt-3" role="alert">
                    <strong>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</strong>
                </div>
                <p class="text-left mt-3">회원정보 및 기업 정보는 모두 삭제되며, 삭제된 데이터는 복구되지
                    않습니다. 삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.</p>
                <p class="text-left mt-3" style="color: orange;">탈퇴 후에는 아이디와
                    데이터는 복구할 수 없습니다.</p>
                <p class="text-left mt-3" style="color: orange;">탈퇴 승인에 시간이 소요 될
                    수 있으며 승인 메일을 보내드립니다.</p>
                <br>
                <form id="withdrawForm" action="submitWithdraw.do">
                    <p class="text-left mt-3" style="color: red;">
                        <input type="checkbox" id="agreementCheckbox" onclick="checkAgreement()"> 안내 사항을 모두 확인하였으며, 이에 동의합니다.
                    </p>
                    <div class="col-lg-12 text-center">
                        <button id="submitButton" type="button" class="btn btn-primary" disabled="true" onclick="submitWithdraw()">탈퇴신청</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
