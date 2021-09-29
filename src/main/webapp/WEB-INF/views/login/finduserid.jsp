<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/finduserinfo.css">
</head>
<body>
<div class="mid">
 <h2 class="title">아이디 찾기</h2> 
	<h3 class="subtitle">가입시 등록하신 이메일을 입력해주세요</h3>

<form method="post" action="finduseridresult" class="form_body">
<input type="email" placeholder="이메일" id="email" name="email" required="required" spellcheck="false"><br>
<div class="btns">
	<input type="submit" class="findsubmit" value="찾기">
	<input type="reset" class="findreset" value="취소">
</div>
</form>

<div class="addbtns">
	<a href="finduserpwd" >비밀번호 찾기</a>
	<a href="login">로그인하기</a>
</div>

</div>
</body>
</html>