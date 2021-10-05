<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../resources/css/reset.css">
<link rel="stylesheet" href="../resources/css/header.css">
<link rel="stylesheet" href="../resources/css/seat.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
<script src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
</head>

<body>
	
	<%-- <c:forEach var="item" items="${slist }">
		<c:out value="${item.seats }"></c:out>
	</c:forEach>
	 --%>

   <div id="seat_wrap"> 
   <div id="select_wrap">
		<div class="select-container">
			<div class="select-wrapper">
				<div class="select-title">인원/좌석</div>
				<div class="select-seat-container">
					<div class="select-seat-number-container">
						<div class="select-seat-number-wrapper">
							<div class="select-seat">
								<div class="select-seat-age">일반</div>
								<div class="select-seat-number">
									<ul class="select-seat-ul select-seat-ul-normal">
										<li class="select-number-normal">0</li>
										<li class="select-number-normal">1</li>
										<li class="select-number-normal">2</li>
										<li class="select-number-normal">3</li>
										<li class="select-number-normal">4</li>
										<li class="select-number-normal">5</li>
									</ul>
								</div>
							</div>
							<div class="select-seat">
								<div class="select-seat-age">청소년</div>
								<div class="select-seat-number">
									<ul class="select-seat-ul select-seat-ul-teen">
										<li class="select-number-teen">0</li>
										<li class="select-number-teen">1</li>
										<li class="select-number-teen">2</li>
										<li class="select-number-teen">3</li>
										<li class="select-number-teen">4</li>
										<li class="select-number-teen">5</li>
									</ul>
								</div>
								</div>
							<div class="select-seat">
								<div class="select-seat-age">우대</div>
								<div class="select-seat-number">
									<ul class="select-seat-ul  select-seat-ul-old">
										<li class="select-number-old">0</li>
										<li class="select-number-old">1</li>
										<li class="select-number-old">2</li>
										<li class="select-number-old">3</li>
										<li class="select-number-old">4</li>
										<li class="select-number-old">5</li>
									</ul>
								</div>
								</div>
							</div>
							<div class="reserve-number-wrapper">
								<div class="reserve-number-title">선택된 좌석 수</div>
								<div class="reserve-number">0</div>
							</div>
							<div class="select-theater-place">
								<span>남은좌석</span><span class="remain-seats"></span>
								/<span class="all-seats"></span>
							</div>
						</div>
					<!-- <div class="select-seat-information">
						<div class="select-seat-information-wrapper">						
							<div class="select-theater-place">
								<span>남은좌석</span><span class="remain-seats"></span>
								/<span class="all-seats"></span>
							</div>
						</div>
					</div> -->
				</div>
						
				</div>
	
				</div>
				<div class="seat-container">
	
					<div class="seat-wrapper">
						<div class="screen-view-wrapper">
							<div class="screen-view">SCREEN</div>
							
						</div>
					</div>
				</div>
	
	   <c:forEach var="item" items="${slist }">
	      <div class="thiss">${item.seats }</div>
	      
	   </c:forEach>
	   </div>
	   <div id="check_wrap">
		   <div class="select-theater-date">
	   	   	    <div class="selected-movie">${reserve.movieNm}</div>
				<div class="theater-date">${reserve.reserveDate}</div>
				<div class="theater-time">${reserve.screenTime} </div>
			<div class="selected-seats-wrapper">
				<span class="selected-seats-title">좌석번호</span> 
				<span class="selected-seats">선택한 좌석이 없습니다.</span>
			</div>
		</div>
			<div class="ticket-price-wrapper">
				<span class="ticket-price-title">금액</span>
				<span class="ticket-price">0</span> 원
				
				<div class="point-wrap">
					<label class="ticket-price-title">사용 포인트 </label>
					<input type="text" id="usePoint" value="0" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"> P
					<p class="mypoint"> ( 보유 : <fmt:formatNumber value="${user.point }" pattern="#,###"/> P )</p>
					<input type="hidden" class="havePoint" value="${user.point }"> 
				</div>
				
				<span class="ticket-price-title">최종 결제 금액</span>
				<span class="last-price">0 </span> 원
			</div>
				<form action="/kakaojsp" class="seatForm" method="get">
					<input type="hidden" class="movieNm" name="movieNm" value="${reserve.movieNm}">
					<input type="hidden" class="movieCd" name="movieCd" value="${reserve.movieCd}">
					<input type="hidden" class="reserveDate" name="reserveDate" value="${reserve.reserveDate}"> 
					<input type="hidden" class="screenTime" name="screenTime" value="${reserve.screenTime}">
					<!-- 티켓의수(선택한 좌석) -->
					<input type="hidden" class="ticketNumber" name="ticketNumber">
					<input type="hidden" class="selectedSeat" name="selectedSeat">
					<!-- 결제 정보 -->

					<input type="hidden" class="payMoney" name="payMoney" >
					<input type="hidden" class="ousepoint" name="ousepoint">
					<button type="button" class="before-button finalBtn">이전</button>
					<button type="button" class="reserve-button finalBtn">결제하기</button>
<!-- 					<button type="button" class="reserve-button">
						결제하기<img src="../resources/image/payment_icon_yellow_medium.png">
					</button> -->
				</form>
		   </div>
   </div>

<script src="../resources/js/seat.js"></script>

</body>
</html>