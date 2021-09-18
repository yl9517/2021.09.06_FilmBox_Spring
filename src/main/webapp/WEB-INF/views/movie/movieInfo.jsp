<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/movieInfo.css">
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>

	<div id="info_wrap">
	
	
		<div id="info_title">
		<div class="bg" style="background-image: url('${dto.image}')"> </div>	
				<div class="info_left">
					<h2> 싱크홀 </h2>	
					<h3> singblla </h3>
					<div id="line"></div>	
				</div>
				<div class="info_bottom">
					<div class="bottom">
						<p class="subtitle">FilmBox 평점</p>
						<p> 8.0 </p>
					</div>
					<div class="bottom">
						<p class="subtitle">박스오피스</p>
						<p> ${dto.rank } </p>
					</div>
					<div class="bottom">
						<p class="subtitle">누적관객 수</p>
						<p> 64,535 </p>
					</div>
				</div>
				<div class="info_right">
					<img alt="영화 포스터" src="${dto.image }">		
				</div>
		</div>
		
		<div>
			<div class="subinfo">
				<p>장르 : </p>
				<p>등급 : </p>
				<p>개봉일 : </p>
				<p>감독 : </p>
				<p>출연진 : 
				<c:forEach var="item" items="${movieInfo.acts }" >
					${item } 
				</c:forEach>
				</p>
			</div>
			<div class="summary">
			
			</div>
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