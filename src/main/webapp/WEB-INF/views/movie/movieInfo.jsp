<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/movieInfo.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> <!-- bootstrap table 가져오기 --> <script src="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table.min.js"></script>

</head>
<body>

	<div id="info_wrap">
	
	<input type="hidden" id="mvCd" value="${dto.movieCd }">
		<div id="info_title">
		<div class="bg" style="background-image: url('${dto.image}')"> </div>	
				<div class="info_left">
					<h2> ${dto.movieNm } </h2>	
					<h3 id="mvEn"> </h3>
					<div id="line"></div>	
				</div>
				<div class="info_bottom">
					<div class="bottom">
						<p class="subtitle">FilmBox 평점</p>
						<p class="sub"> 8.0 <span>점</span></p>
					</div>
					<div class="bottom">
						<p class="subtitle">박스오피스</p>
						<p class="sub"> ${dto.rank } <span>위</span></p>
					</div>
					<div class="bottom">
						<p class="subtitle">누적관객 수</p>
						<p class="sub"> 64,231 <span>명</span></p>
					</div>
					
				</div>
				<div class="info_right">
					<img alt="영화 포스터" src="${dto.image }">		
					
				</div>
				<div class="reserve_screen-type">
					<div class="reserve">
						<input type="button" value="예매하기" 
					onclick="location.href='/reservemovie/${dto.movieCd }/${dto.movieNm }'">
					</div>
				</div>
					
				
		</div>		
		
		<ul>
			<li></li>
		</ul>
		 
		<table id="content" class="table table-hover">
		</table>		

	</div>
	<script src="../resources/js/movieInfo.js"></script>
</body>
</html>