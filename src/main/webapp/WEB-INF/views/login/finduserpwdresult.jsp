<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${member_id!=null }">
		등록된 이메일로 임시 비밀번호를 발송했습니다
	</c:when>
	<c:otherwise>
	<script type="text/javascript">
		alert("등록된 이메일이 아닙니다");
		location.href="finduserpwd";
	</script>
	</c:otherwise>
</c:choose><br>
<a href="login">로그인하기</a>
</body>
</html>