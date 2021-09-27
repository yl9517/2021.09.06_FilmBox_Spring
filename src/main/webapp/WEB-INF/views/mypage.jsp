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
<section>
	<div class="info">
		<span class="me">${dto.member_name }님
			<span class="myinfo1">
				<div id="session_type" style="display: none">${session }</div>
				<div onclick="accessCheck()" id="myinfo_link">회원정보 수정<div class="glyphicon glyphicon-pencil" aria-hidden="true"></div></div>
			</span>
		</span>
		<div class="point_film">
			<div class="mypoint">
				<p>MY POINT</p>
				<div class="point">${dto.point }</div>
				<button type="button" class="btn btn-default btn-sm" onclick="pointList()"
				style="font-size: 15px">내 포인트 내역</button>
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
				<div>예매번호		<span class="reserve_num" id="myreserve_num">215588-2585</span></div><br>
				<div class="reservelist_movieinfo">
					<img src='resources\img\shang-chi.jpg' width='100px' height='130px'>
					<div class="reservelist_movieinfo2">
						<div class="movie_title" id="movie_title">샹치</div>
						<div>관람일시	<p id="myreserve_date">2021.09.27(월) 18:10</p></div>
						<div>좌석		<p id="myreserve_seat">H2, H3</p></div>
					</div>
					<div class="reservelist_movieinfo2_btn">
					<span class="glyphicon glyphicon-qrcode" aria-hidden="true" id="qr1" onclick="openPop(this)"></span><br>
					<button type="button" class="btn btn-default btn-sm" style="font-size: 15px">예약 취소</button>
					</div>
				</div>
			</div>
			<div class="reservelist_2">
				<div>예매번호		<span class="reserve_num" id="myreserve_num2">215588-252285</span></div><br>
				<div class="reservelist_movieinfo">
					<img src='resources\img\moga.jpg' width='100px' height='130px'>
					<div class="reservelist_movieinfo2">
						<div class="movie_title" id="movie_title2">모가디슈</div>
						<div>관람일시	<p id="myreserve_date2">2021.09.21(금) 18:10</p></div>
						<div>좌석		<p id="myreserve_seat2">F6</p></div>
					</div>
					<div class="reservelist_movieinfo2_btn">
					<span class="glyphicon glyphicon-qrcode" aria-hidden="true" id="qr2" onclick="openPop(this)"></span><br>
					<button type="button" class="btn btn-default btn-sm" style="font-size: 15px">예약 취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
<script type="text/javascript" src="resources\js\mypage.js"></script>
</body>
</html>