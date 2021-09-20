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
						<p class="subtitle">누적관객수</p>
						<p class="sub"> 64,231 <span>명</span></p>
					</div>
				</div>
				<div class="info_right">
					<img alt="영화 포스터" src="${dto.image }">	
				</div>
		</div>		
		
		<ul class="tab_wrap">
			<li class="act first_btn">영화정보</li>
			<li class="second_btn">실관람평 (5,762)</li>
		</ul>
		 
		<table id="content" class="table table-hover">				
		</table>		
		
		<div class="review_wrap">
			<p>총 <b>1,256</b>건의 관람평이 있습니다.</p>
			<div class="line"></div>		
			<ul class="review">
				<li>
					<div class="user_info">
						<span class="userName">이*름</span>
						<span><img alt="star" src="../resources/img/star.png"> 8 </span>
					</div>
					<div class="review_info">
						재밌었어용 ㅎㅎ
					</div>
				</li>
			</ul>
		</div>
		
		
	</div>
	<script src="../resources/js/movieInfo.js"></script>
</body>
</html>