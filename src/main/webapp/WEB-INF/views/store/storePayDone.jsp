<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/storePayDone.css">
</head>
<body>
	<div id="done_wrap">
		<h2>주문 완료</h2>
		
		<div class="message"> 
			<h1><b>결제가 완료</b> 되었습니다.</h1>
			<p>결제 내역은 마이페이지에서 확인 하실 수 있습니다.</p>
		</div>
		<div class="point_add">
			<p><img alt="point" src="/resources/img/reward.png">
			<span> POINT <strong>${inpoint }</strong>원 적립 </span></p>
		</div>
		<a href="/mypage">마이페이지 바로가기</a>
		<c:choose>
		<c:when test="${resultpage eq 'movie'}">
			<a href="/movieList">영화목록 가기</a>		
		</c:when>
		<c:otherwise>
			<a href="/store">스토어 가기</a>
		</c:otherwise>
		</c:choose>
	</div>
</body>
</html>