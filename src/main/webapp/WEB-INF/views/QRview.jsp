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

<form action="" method="post" name="reserveInfo">
	<img src="${QRurl }" alt="">
	<input type="hidden" name="rev_no" value="${dto.rev_no }"> 
	<input type="hidden" name="image" value="${dto.image }"> 
	<input type="hidden" name="movieNm" value="${dto.movieNm }"> 
	<input type="hidden" name="show_date" value="${dto.show_date }"> 
	<input type="hidden" name="show_time" value="${dto.show_time }"> 
	<input type="hidden" name="seats" value="${dto.seats }"> 
</form> 
</body>
</html>