<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/modifyform.css">
</head>
<body>
<div class="mid">
	<h3>회원정보 수정</h3>
	
<form method="post" action="modifyresult">
	<label for="member_id">아이디</label><br> 
    <input type="text" name="member_id" id="member_id" class="w3-input w3-border" value="${dto.member_id}" readonly>
    <br>
    <label for="member_pwd">비밀번호</label><br> 
    <input type="password" id="member_pwd" name="member_pwd" class="w3-input w3-border" value="${dto.member_pwd}" spellcheck="false"> 
    <br>
    <label for="member_name">이름</label><br> 
    <input type="text" id="member_name" name="member_name" class="w3-input w3-border" value="${dto.member_name}" spellcheck="false"> 
    <br>
    <label for="member_phone">연락처</label><br> 
    <input type="text" id="member_phone" name="member_phone" class="w3-input w3-border" value="${dto.member_phone}" spellcheck="false"> 
    <br>
    <label for="email">이메일</label><br> 
    <input type="text" id="email" name="email" class="w3-input w3-border" value="${dto.email}" spellcheck="false"> 
    <br>
    
    <div class="btns">
     <input type="submit" id="usubmit" value="수정 완료">
     <input type="reset" id="ureset" value="취소">
     </div>
</form>
</div>	

</body>
</html>