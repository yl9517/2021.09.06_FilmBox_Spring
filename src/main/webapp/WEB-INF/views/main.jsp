<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>FilmBox</title>
<link rel="shortcut icon" href="resources/favicon.ico">
<link rel="icon" href="resources/favicon.ico">
	<link rel="stylesheet" href="/resources/css/main.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> 
	
	 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>
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
<body>
<div id="main_wrap">
	<div id="header_section">
		<div class="h_menus">
			<div class="menu1">
				<img class="logo" alt="logo" src="resources/img/mainlogo.png">
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
					<li><a href="login">로그인</a></li>
					<li><a href="join">회원가입</a></li>
			</c:when>
			<c:otherwise>
					<li class="user"><a href="/mypage"><img alt="user" src="resources/img/user.png"> </a></li>
					<li><a href="/logout">로그아웃</a></li>
			</c:otherwise>
		</c:choose>				
				</ul>
			</div>
		</div>
	</div>
	
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		  <ol class="carousel-indicators">
		    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		  </ol>
		  <div class="carousel-inner">
		  	  	<div class="carousel-item active">
				   <img class="d-block w-100" src="https://caching2.lottecinema.co.kr/lotte_image/2021/Dune/0917/Dune_1920774.jpg" alt="First slide">
			 	</div>
			   	<div class="carousel-item">
			      <img class="d-block w-100" src="https://caching2.lottecinema.co.kr/lotte_image/2021/Kind/1012/Kind_1920774.jpg" alt="Second slide">
			    </div>
			    <div class="carousel-item">
			      <img class="d-block w-100" src="https://caching2.lottecinema.co.kr/lotte_image/2021/Dual/Dual_1920774.jpg" alt="Second slide">
			    </div>
			   
		  </div>
		  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
	</div>
	
	<div id="back_gradient">
	</div>
	<div class="gallery"> <!-- 박스오피스 -->
	    <div class="gallery-container">
	    <c:forEach var="item" items="${mvList }" varStatus="status" begin="0" end="4">
	    	 <a href="movieInfo/${item.movieCd }">
	    	 	<img class="gallery-item gallery-item-${status.count }" src="${item.image }" data-index="${status.count }">
	    	 </a>
	    </c:forEach>
	    </div>
	     <!--  <img class="gallery-item gallery-item-1" src="https://t1.daumcdn.net/movie/e1285fe4d39de150ca497edf0d91d8b4ad8d8e39" data-index="1">
	      <img class="gallery-item gallery-item-2" src="https://img9.yna.co.kr/photo/cms/2021/07/03/58/PCM20210703000058005_P2.jpg" data-index="2">
	      <img class="gallery-item gallery-item-3" src="https://miro.medium.com/max/800/1*mvnnOAuE0rPTc8E6uYAu8w.jpeg" data-index="3">
	      <img class="gallery-item gallery-item-4" src="https://t1.daumcdn.net/movie/f39274b0acd76f7c66f0a5fb9e5b7222ed37b373" data-index="4">
	      <img class="gallery-item gallery-item-5" src="https://ww.namu.la/s/dde23840757e1474237b5b2b5cf596a3524bb620d4870c8b9bc8fd3739e7b989192d45f836e6909e0226364a282b5611934852cd2cba6d703c213645b95e0501030844821e6637a44694cd5021df820b5025c9d879795c1c9520aa7adb2586f0" data-index="5">
 -->	   
 		 <div class="gallery-controls"></div>
  </div>
	
	
 <%@ include file="footer.jsp" %> 
</div>
	<script src="/resources/js/carousel.js"></script>
	<script src="/resources/js/header.js"></script>
</body>
</html>