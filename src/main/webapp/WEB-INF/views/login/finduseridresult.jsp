<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/finduserinforesult.css">
</head>
<body>
<div class="mid">
<c:choose>

	<c:when test="${member_id!=null && login_type == 'R'}">
		<div id="result_notice1">사용하시는 아이디는</div>
		<div id="result_id">${member_id }</div>
		<div id="result_notice2">입니다</div>
	</c:when>

	<c:when test="${member_id!=null && login_type == 'SNS' }">
		<script type="text/javascript">
			alert("소셜로그인 회원입니다. 연동한 소셜 서비스 사이트에서 아이디를 찾아주세요");
			location.href="finduserid";
		</script>
	</c:when>

	<c:otherwise>
		<script type="text/javascript">
			alert("등록된 이메일이 아닙니다");
			location.href="finduserid";
		</script>
	</c:otherwise>
</c:choose><br>

<div class="addbtns">
<a href="finduserpwd">비밀번호 찾기</a>
<a href="login">로그인하기</a>
</div>
</div>
</body>
</html>