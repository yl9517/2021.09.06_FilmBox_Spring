<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h4>회원님의 개인정보 보호를 위해 비밀번호를 확인합니다.</h4>
<form method="post" action="myinfo">
    <label for="member_pwd">비밀번호 확인</label><br> 
    <input type="password" id="member_pwd" name="member_pwd" class="w3-input w3-border" spellcheck="false"> 
	<br>
	<input type="submit" value="확인">
	<input type="reset" value="취소">
</form>

</body>
</html>