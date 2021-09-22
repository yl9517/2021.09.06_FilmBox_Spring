<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources\css\mypage.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- bootstrap -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<header>
<h2>Filmbox</h2>
</header>
<section>
	<div class="info">
		<span class="me">ooo님
			<span class="myinfo1">
				<a href="myinfo">회원정보 수정<div class="glyphicon glyphicon-pencil" aria-hidden="true"></div></a>
			</span>
		</span>
		<div class="point_film">
			<div class="mypoint">
				<p>MY POINT</p>
				<div class="point">2500</div>
				<button type="button" class="btn btn-default btn-xs" onclick="pointList()">내 포인트 내역</button>
			</div>
			<div class="filmstory">
				<p>나의 필름스토리</p>
				<a href="myfilmstory">10</a>
			</div>
			<div class="etc">
				<p>무엇을 넣을까요</p>
			</div>
		</div>
	</div>
	<div class="back">
	</div>
	<div class="myreserve">
		<span class="myreservelist_h">MY 예매내역
			<span class="myreservelist1">
				<a href="myreservelist"><div class="glyphicon glyphicon-plus" aria-hidden="true"></div> 더보기</a>
			</span>
		</span>
		<div class="reservelist">
			<div class="reservelist_1">
				<div>예매번호		<span class="reserve_num">215588-2585</span></div><br>
				<div class="reservelist_1_movieinfo">
					<img src='resources\img\shang-chi.jpg' width='100px' height='120px'>
					<div class="reservelist_1_movieinfo2">
						<div class="movie_title">샹치</div>
						<div>관람일시	<p>2021.09.10(금) 18:10</p></div>
						<div>좌석		<p>H2, H3</p></div>
					</div>
					<div class="reservelist_1_movieinfo2_btn">
					<button type="button" class="btn btn-info btn-xs" onclick="openPopup()">QR 보기</button><br>
					<button type="button" class="btn btn-default btn-xs">예약 취소</button>
					</div>
				</div>
			</div>
			<div class="reservelist_2">
				<div>예매번호		<span class="reserve_num">215588-252285</span></div><br>
				<div class="reservelist_2_movieinfo">
					<img src='resources\img\moga.jpg' width='100px' height='120px'>
					<div class="reservelist_2_movieinfo2">
						<div class="movie_title">인질</div>
						<div>관람일시	<p>2021.09.10(금) 18:10</p></div>
						<div>좌석		<p>F6</p></div>
					</div>
					<div class="reservelist_2_movieinfo2_btn">
					<button type="button" class="btn btn-info btn-xs" onclick="openPopup()">QR 보기</button><br>
					<button type="button" class="btn btn-default btn-xs">예약 취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
<script type="text/javascript" src="resources\js\mypage.js"></script>
</body>
</html>