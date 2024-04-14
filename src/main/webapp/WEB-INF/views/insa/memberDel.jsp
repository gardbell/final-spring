<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }

    .container {
        width: 400px;
        margin: 100px auto; /* 페이지 중앙에 위치 */
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #f9f9f9;
    }

    h2 {
        text-align: center;
    }

    table {
        margin: 0 auto; /* 테이블 가운데 정렬 */
    }

    input[type="password"],
    input[type="submit"] {
        padding: 8px;
        width: 100%;
        margin-bottom: 10px;
        box-sizing: border-box;
    }
</style>
</head>
<body>
<div class="container">
    <h2>회원탈퇴</h2>
    <form name="delete" action="delete.do?pwd=${dto.pwd }&id=${dto.id}" method="post">
        <table>
            <tr>
                <td style="text-align: center; white-space: nowrap;" colspan="2">비밀번호를 입력하시면 회원탈퇴가 완료됩니다.</td>
         </tr>
         <tr>   
             <th style="text-align: center;"><br>비밀번호 입력&nbsp;&nbsp;<input type="password" name="pwd" style="width: 30%;"></th>
         </tr>

        </table>
        <input type="hidden" name="id" value="${dto.id}">
    </form>
</div>
</body>
</html>
