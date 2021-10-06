<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources\css\qrtest.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div id="result"></div>
	<h3>Filmbox 예매내역</h3>
	예약번호 : ${rev_no}<br>
	영화명 : ${seats}<br>
<%--	포스터 :<img alt="img" src=" ${img}"><br>
 	상영날짜 : ${dto.show_date }<br>
	상영시간 : ${dto.show_time }<br>
	좌석 : ${dto.seats } --%>
</body>
</html>