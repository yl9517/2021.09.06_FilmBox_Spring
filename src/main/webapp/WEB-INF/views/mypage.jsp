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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<section>
	<div class="wrap">
		<div class="info">
			<div class="name">${dto.member_name }님</div>
			
			<div class="modify_quit">
				<div id="login_type" style="display: none">${dto.login_type }</div>
				<div onclick="accessCheck()" class="modify">회원정보 수정</div>
				<div class="glyphicon glyphicon-option-vertical" aria-hidden="true"></div>
				<div class="quit" data-toggle="modal" data-target="#exampleModal">탈퇴</div>
			</div>

			<div class="point_story">
				<div class="mypoint">
					<p>MY POINT</p>
					<span class="point">${dto.point }</span>
					<button type="button" class="btn btn-default btn-sm"
						onclick="pointList()" style="font-size: 15px">내 포인트 내역</button>
				</div>
				<div class="story">
					<p>나의 필름스토리</p>
					<a href="myfilmstory">10</a>
				</div>
				<div class="etc">
					<p>무엇을 넣을까요</p>
				</div>
			</div>
		</div>

		<!-- <div class="back"></div> -->

		<div class="rsv_wrap">
			<div class="rsv_h">MY 예매내역</div> 
			<span><a href="myreservelist">더보기</a></span>
			
			<div class="rsv_list_wrap">
				<div class="rsv_list_1">
					<div>
						예매번호 <span class="rsv_no" id="rsv_no1">215588-2585</span>
					</div>
					<br>
					<div class="rsv_info_wrap">
						<img src='resources\img\shang-chi.jpg' width='100px'
							height='130px'>
						<div class="rsv_info">
							<div class="title" id="title">샹치</div>
							<div>
								관람일시
								<p id="date">2021.09.27(월) 18:10</p>
							</div>
							<div>
								좌석
								<p id="seat">H2, H3</p>
							</div>
						</div>
						<div class="rsv_btn">
							<span class="glyphicon glyphicon-qrcode" aria-hidden="true"
								id="qr1" onclick="openPop(this)"></span><br>
							<button type="button" class="btn btn-default btn-sm"
								style="font-size: 15px">예약 취소</button>
						</div>
					</div>
				</div>
				<div class="rsv_list_2">
					<div>
						예매번호 <span class="rsv_no" id="rsv_no2">215588-252285</span>
					</div>
					<br>
					<div class="rsv_info_wrap">
						<img src='resources\img\moga.jpg' width='100px' height='130px'>
						<div class="rsv_info">
							<div class="title" id="title2">모가디슈</div>
							<div>
								관람일시
								<p id="date2">2021.09.21(금) 18:10</p>
							</div>
							<div>
								좌석
								<p id="seat2">F6</p>
							</div>
						</div>
						<div class="rsv_btn">
							<span class="glyphicon glyphicon-qrcode" aria-hidden="true"
								id="qr2" onclick="openPop(this)"></span><br>
							<button type="button" class="btn btn-default btn-sm"
								style="font-size: 15px">예약 취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
		
		<!-- 회원 탈퇴 Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Filmbox</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<!-- <span aria-hidden="true">&times;</span> -->
						</button>
					</div>
					<div class="modal-body">회원 탈퇴 하시겠습니까?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							onClick="location.href='userquit'">탈퇴하기</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>

	</section>
	<script type="text/javascript" src="resources\js\mypage.js"></script>
</body>
</html>