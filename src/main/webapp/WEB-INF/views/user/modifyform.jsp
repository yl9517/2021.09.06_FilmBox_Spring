<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원정보 수정 화면</h2>
	
<form method="post" action="modifyresult">
	<label for="member_id">아이디</label> 
    <input type="text" name="member_id" id="member_id" class="w3-input w3-border" value="${dto.member_id}" readonly>
    <br>
    <label for="member_pwd">비밀번호</label>
    <input type="password" id="member_pwd" name="member_pwd" class="w3-input w3-border" value="${dto.member_pwd}" > 
    <br>
    <label for="member_name">이름</label>
    <input type="text" id="member_name" name="member_name" class="w3-input w3-border" value="${dto.member_name}" > 
    <br>
    <label for="member_phone">연락처</label>
    <input type="text" id="member_phone" name="member_phone" class="w3-input w3-border" value="${dto.member_phone}" > 
    <br>
    <label for="email">이메일</label>
    <input type="text" id="email" name="email" class="w3-input w3-border" value="${dto.email}" > 
    <br>
    
     <input type="submit" value="수정 완료">
</form>
<br>
    <button class="userquit" type="button" onclick="location.href='/filmbox/userquit'">회원탈퇴</button>

</body>
</html>