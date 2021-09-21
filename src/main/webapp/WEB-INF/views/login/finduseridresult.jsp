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
	<c:when test="${result!=null }">
		아이디는 <c:out value="${result }"/> 입니다
	</c:when>
	<c:otherwise>
	<script type="text/javascript">
		alert("등록된 이메일이 아닙니다");
		location.href="finduserid";
	</script>
	</c:otherwise>
</c:choose><br>
<a href="finduserpwd">비밀번호 찾기</a>
<a href="login">로그인하기</a>
</body>
</html>