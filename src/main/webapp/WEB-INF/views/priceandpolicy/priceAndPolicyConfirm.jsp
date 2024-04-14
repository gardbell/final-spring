<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
    // 사용자에게 확인 또는 취소를 물어서 확인을 누르면 gourl
    if (confirm('${msg}')) {
        location.href = "${gourl}";
    } else {
        // 사용자가 취소를 누르면 경고창이 뜨기 전 화면으로
        history.back();
    }
</script>