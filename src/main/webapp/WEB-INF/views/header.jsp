<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/header.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div id="header_section">
		<div class="h_menus">
			<div class="menu1">
				<img class="logo" alt="logo" src="/resources/img/mainlogo.png">
				<ul class="menu1_left">
					<li><a href="/movieList">영화</a></li>
					<li><a href="/reservemovie">예매</a></li>
					<li><a href="/store">스토어</a></li>
					<li><a href="/post">포스트</a></li>
					<li><a href="/notice">공지사항</a></li>
				</ul>
			</div>
			<div class="menu2">
				<form class="search__container" method="get" action="/search" name="searchBox">
				    <input class="search__input" name="searchtxt" type="text" placeholder="영화명 검색" onkeypress="JavaScript:press(this.form)">
					<img class="searchSubmit" alt="search" src="data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'%3E%3Cpath d='M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z'/%3E%3Cpath d='M0 0h24v24H0z' fill='none'/%3E%3C/svg%3E">
				</form>
				<ul class="menu2_right">
		<c:choose>
			<c:when test="${loginId == null }">
					<li><a href="/login">로그인</a></li>
					<li><a href="/join">회원가입</a></li>
			</c:when>
			<c:otherwise>
					<li class="user"><a href="/mypage"><img alt="user" src="/resources/img/user.png"> </a></li>
					<li><a href="/logout">로그아웃</a></li>
			</c:otherwise>
		</c:choose>				
				</ul>
			</div>
		</div>
	</div>
	<script src="/resources/js/header.js"></script>
</body>
</html>