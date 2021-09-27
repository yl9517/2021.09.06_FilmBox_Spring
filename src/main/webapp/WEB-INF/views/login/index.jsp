<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Insert title here</title>
</head>
<body>

 <center> 
	<c:choose>

	  <c:when test="${loginId != null }">
	  	 <h2> '${loginId }'님 필름박스 로그인 성공하셨습니다!! </h2> 
	  	 <h3><a href="logout">로그아웃</a></h3> 
	  	 <h3><a href="mypage">마이페이지</a></h3>
 	  </c:when>


	  <c:otherwise> 
	   <a href="login">로그인</a>
	   <a href="userjoin">회원가입</a>
	  </c:otherwise> 
	  
	  </c:choose>
     </center>

</body>
</html>