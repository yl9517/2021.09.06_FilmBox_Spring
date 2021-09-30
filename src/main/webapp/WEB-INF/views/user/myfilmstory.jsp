<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources\css\myfilmstory.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>

	<section>
	<div class="story_wrap">
		<div class="story">
			<div class="story_h">나의 필름 스토리</div>
			<p class="label label-default">${fn:length(myfilmlist)}건</p>
		</div>
		<div class="story_list_wrap">
			<ul id="story_list">
			<c:choose>
				<c:when test="${!empty myfilmlist }">
					<c:forEach var="item" items="${myfilmlist }">
						<li class="movie_info">
							<div class="poster">
							<!-- 누르면 영화 상세보기로 -->
								<a href="#"> <img src="${item.image }" alt=""
											width="110px" height="155px">
								</a>
							</div>
							<div class="movie_detail">
								<h4 class="title">${item.movieNm }</h4>
								<p class="date">${item.show_date } ${item.show_time }</p>
								<p class="seat">${item.seatno }</p>
								<!-- 댓글이 있으면 댓글 보여주고 없으면 관람평쓰기 버튼 표시 -->
								<c:choose>
									<c:when test="${item.review_content!=null }">
										<div class="complete_review"> 
											<img src="resources\img\star.png" alt="" width="30px" height="30px">
											<div class="rate">${item.review_starpoint }</div>
											<div class="content">
												<p>${item.review_content }</p>
												<div>
													<a href="#">수정</a>
													<p>|</p>
													<a href="#">삭제</a>
												</div>
											</div>
										</div>
									</c:when>
									
									<c:otherwise>
										<button type="button" class="btn btn-default btn-sm" id="review_window"
											data-toggle="tooltip" data-placement="right" title="500P 적립"
											style="font-size: 15px">관람평 쓰기</button>
									</c:otherwise>
									
								</c:choose>
								
							</div>
						</li>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<li class="movie_info">
						<div  class="empty_story">
							<img src="resources\img\clapperboard.png" width="140px" height="140px">
						 	<div>나의 필름 스토리가 없습니다</div>
						 	<div><strong>지금 바로 필름 스토리를 추가해보세요!</strong></div><br>
						 	<a href="movieList">영화 예매하러가기</a>
						</div>
					</li>
				</c:otherwise>
				
			</c:choose>
			</ul>
		</div>
		
		<div class="more" id="more_movie">
			<div class="more_open" onclick="showMore()" >더보기</div>
			<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>
		</div>
	</div>
	</section>

	<!-- modal 창 -->
	<form id="review_write" method="post" action="reviewAction">
			<header class="window_top">
				<h5>관람평 작성 </h5>
				<img alt="close" class="reset" src="../resources/img/close.png">
			</header>
			<div class="score">
				<h2 class="tit">${item.movieNm }</h2>
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