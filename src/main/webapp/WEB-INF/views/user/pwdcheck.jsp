<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="resources/css/pwdcheck.css">
</head>
<body>
<div class="mid">
<h2>회원정보 수정</h2>
<br>
<h3>회원님의 개인정보 보호를 위해 비밀번호를 확인합니다.</h3>
<br>
<form method="post" action="myinfo">
    <label for="member_pwd">비밀번호 확인</label><br>
    <input type="password" id="member_pwd" name="member_pwd" class="w3-input w3-border" spellcheck="false"> 
	<br>
	
	<div class="btns">
	<input type="submit" value="확인" id="psubmit">
	<input type="reset" value="취소" id="preset">
	</div>
</form>
</div>


</body>
</html>