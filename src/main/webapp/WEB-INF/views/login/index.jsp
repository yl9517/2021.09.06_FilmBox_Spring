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

<h1>Filmbox 메인 페이지</h1>
<a href="nav1">영화</a>
<a href="nav2">예매</a>
<hr>

 <center> 
	<c:choose>
	
 	  <c:when test="${sessionId != null}"> 
	 	 <h2> 네이버 아이디 로그인 성공하셨습니다!! </h2> 
	 	 <h3>'${sessionId}' 님 환영합니다! </h3> 
	 	 <h3><a href="logout">로그아웃</a></h3> 
	  </c:when> 
  
	  <c:when test="${sessionScope.login != null }">
	  	 <h2> '${sessionScope.login }'님 필름박스 정회원 로그인 성공하셨습니다!! </h2> 
	  	 <h3><a href="logout">로그아웃</a></h3> 
	  	 <h3><a href="modify">마이페이지</a></h3>
 	  </c:when>


	  <c:otherwise> 
	   <a href="login">로그인</a>
	   <a href="userjoin">회원가입</a>
	  </c:otherwise> 
	  
	  </c:choose>
     </center>



	<hr>
</body>
</html>