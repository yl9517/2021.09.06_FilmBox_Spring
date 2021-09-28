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
	<c:when test="${member_id!=null && login_type == 'R'}">
		아이디는 <c:out value="${member_id }"/> 입니다
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
<a href="finduserpwd">비밀번호 찾기</a>
<a href="login">로그인하기</a>
</body>
</html>