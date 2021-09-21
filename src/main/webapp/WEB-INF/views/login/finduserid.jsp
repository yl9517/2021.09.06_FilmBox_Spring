<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>아이디 찾기</div>
<div>가입시 입력하신 이메일을 입력해주세요</div>

<form method="post" action="finduseridresult">
<input type="text" placeholder="이메일" id="email" name="email" required="required"><br>
<input type="submit" value="찾기">
<input type="reset" value="취소">
</form>
<a href="finduserpwd">비밀번호 찾기</a>
<a href="login">로그인하기</a>
</body>
</html>