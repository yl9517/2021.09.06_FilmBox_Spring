<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="shortcut icon" href="/resources/favicon.ico">
<link rel="icon" href="/resources/favicon.ico">
<style>
	@font-face { 
	    font-family: 'ONE-Mobile-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/ONE-Mobile-Regular.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	*{
		font-family: 'ONE-Mobile-Regular', cursive;
	}
</style>
</head>
<body>
	 
	<c:if test="${page != null }">
	<%@ include file="header.jsp" %>
	
	<jsp:include page="${page }"></jsp:include>

	
 <%@ include file="footer.jsp" %> 
	</c:if>
</body>
</html>