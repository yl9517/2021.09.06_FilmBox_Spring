<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<div class="date">
		<div class="reserve_day">날짜</div>
		<div class="reserve_date"></div>
	</div>
	<div class="time">
		<div class="time_table">시간</div>
		<div class="movie_time">
			<div class="time_wrapper">
				<button class="reserve_button">
					<span class="movietime">12:00</span>
				</button>
				<button class="reserve_button">
					<span class="movietime">14:00</span>
				</button>
				<button class="reserve_button">
					<span class="movietime">16:00</span>
				</button>
				<button class="reserve_button">
					<span class="movietime">18:00</span>
				</button>
			</div>
		</div>
		<div>
			<form class="moveSeatForm" action="/seatchoice" method="post">
				<input type="hidden" name="movieNm" value="${dto.movieNm}">
				<input type="hidden" name="movieCd" value="${dto.movieCd}">
				<input type="hidden" class="reserveDate" name="reserveDate"> 
				<input type="hidden" class="screenTime" name="screenTime">
				<button class="moveSeatButton" type="button">예약하기</button>
				<!-- <input type="submit" value="좌석선택하기"> -->
			</form>
		</div>
	</div>
	<script src="/resources/js/reserve.js"></script>


</body>
</html>