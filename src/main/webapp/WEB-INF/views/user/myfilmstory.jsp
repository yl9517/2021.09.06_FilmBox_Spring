<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources\css\myfilmstory.css">
<!-- <link rel="stylesheet" href="resources\css\myfilmstory2.css"> -->
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
	<header>
		<h2>Filmbox</h2>
	</header>

	<section>
		<div class="myfilmstory">
			<div class="filmstory_header">나의 필름 스토리</div>
			<p class="label label-default">10건</p>
		</div>
		<div class="mymovie_list">
			<ul id="watched_movie">
				<li class="movie_info">
					<div class="poster">
						<!-- 누르면 영화 상세보기로 -->
						<a href="#"> <img src='resources\img\moga.jpg' alt=""
							width='110px' height="155px">
						</a>
					</div>
					<div class="movie_detail">
						<h4 class="title">모가디슈</h4>
						<p class="date">2021-09-10(금) 18:10</p>
						<p class="seat">H4, H5</p>
						<button type="button" class="btn btn-default btn-xs" id="review_window"
							data-toggle="tooltip" data-placement="right" title="500P 적립"
							>관람평 쓰기</button>
					</div>
				</li>
				<li class="movie_info">
					<div class="poster">
						<!-- 누르면 영화 상세보기로 -->
						<a href="#"> <img src='resources\img\shang-chi.jpg' alt=""
							width='110px' height="155px">
						</a>
					</div>
					<div class="movie_detail">
						<h4 class="title">샹치</h4>
						<p class="date">2021-09-05(일) 18:10</p>
						<p class="seat">G8</p>
						<button type="button" class="btn btn-default btn-xs" id="review_window"
							data-toggle="tooltip" data-placement="right" title="500P 적립"
							>관람평 쓰기</button>
					</div>
				</li>
				<li class="movie_info">
					<div class="poster">
						<!-- 누르면 영화 상세보기로 -->
						<a href="#"> <img src='resources\img\miracle.jpg' alt=""
							width='110px' height="155px">
						</a>
					</div>
					<div class="movie_detail">
						<h4 class="title">기적</h4>
						<p class="date">2021-09-04(토) 18:10</p>
						<p class="seat">G8</p>
						<!-- 관람평을 썼다면 -->
						<span class="complete_review"> <img
							src="resources\img\star.png" alt="" width="20px" height="20px">
							<div class="rate">8</div>
							<span class="content">재미있어요ㅎㅎ추천
								<div>
									<a href="#">수정</a>
									<p>|</p>
									<a href="#">삭제</a>
								</div>
							</span>
						</span>
					</div>
				</li>
				<li class="movie_info">
					<div class="poster">
						<!-- 누르면 영화 상세보기로 -->
						<a href="#"> <img src='resources\img\hostage.jpg' alt=""
							width='110px' height="155px">
						</a>
					</div>
					<div class="movie_detail">
						<h4 class="title">인질</h4>
						<p class="date">2021-08-18(수) 18:10</p>
						<p class="seat">G8</p>
						<!-- 관람평을 썼다면 -->
						<span class="complete_review"> <img
							src="resources\img\star.png" alt="" width="20px" height="20px">
							<div class="rate">7</div>
							<span class="content">노잼....ㅠ돈아까움
								<div>
									<a href="#">수정</a>
									<p>|</p>
									<a href="#">삭제</a>
								</div>
							</span>
						</span>
					</div>
				</li>
			</ul>
		</div>
		<div class="more" id="more_movie">
			<div class="more_open" onclick="showMore()" >더보기</div>
			<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>
		</div>
	</section>

	<!-- modal 창 -->
	<form id="review_write" method="post" action="reviewAction">
			<header class="window_top">
				<h5>관람평 작성 </h5>
				<img alt="close" class="reset" src="resources/img/close.png">
			</header>
			<div class="score">
				<h2 class="tit">영화제목</h2>
				    <span><b class="star"> 0 </b> 점</span>
				    <fieldset>
				     	<input type="radio" name="rating" value="10" id="rate1"><label for="rate1">⭐</label>
				        <input type="radio" name="rating" value="9" id="rate2"><label for="rate2">⭐</label>
				        <input type="radio" name="rating" value="8" id="rate3"><label for="rate3">⭐</label>
				        <input type="radio" name="rating" value="7" id="rate4"><label for="rate4">⭐</label>
				        <input type="radio" name="rating" value="6" id="rate5"><label for="rate5">⭐</label>
				        <input type="radio" name="rating" value="5" id="rate6"><label for="rate6">⭐</label>
				        <input type="radio" name="rating" value="4" id="rate7"><label for="rate7">⭐</label>
				        <input type="radio" name="rating" value="3" id="rate8"><label for="rate8">⭐</label>
				        <input type="radio" name="rating" value="2" id="rate9"><label for="rate9">⭐</label>
				        <input type="radio" name="rating" value="1" id="rate10"><label for="rate10">⭐</label>
				    </fieldset>
				    <br>
				<textarea id="reviewContent" name="reviewContent" rows="5" cols="50" placeholder="관람평을 남겨주세요. 스포 및 비방글은 무통보 삭제조치를 받을 수 있습니다."></textarea>
				<br>
				<div class="btn_review">
					<input type="reset" class="reset" value="취소">
					<input type="submit" value="등록">
				</div>
			</div>
		</form>

	<script type="text/javascript" src="resources\js\myfilmstory.js"></script>
</body>
</html>