<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/movieInfo.css">
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>

	<div id="info_wrap">
	
		<div id="info_title">
			<div class="info_left">
				<h2>${movieInfo.movieNm }</h2>			
			</div>
			<div class="info_bottom">
	
			</div>
			<div class="info_right">
				<img alt="영화 포스터" src="${dto.image }">		
			</div>
		</div>
		<input type="text" id="movieCd" value="${dto.movieCd }"> 
		
		<div>
			<p>여기다!!-------java-----</p>
			영화명 : ${movieInfo.movieNm }
			${movieInfo.showTm }
			${movieInfo.openDt }
			배우 :
			<c:forEach var="item" items="${movieInfo.acts }" >
					${item }
			</c:forEach>
			
		 	<p>------위!-------!</p>
		</div>

	</div>
</body>
</html>