<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face { 
    font-family: 'ONE-Mobile-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/ONE-Mobile-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
*{
	font-family: 'ONE-Mobile-Regular', cursive;
}
</style>
<link rel="stylesheet" href="/resources/css/movieInfo.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<!-- bootstrap table 가져오기 -->
<script src="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table.min.js"></script>

</head>
<body>
<%-- <c:set var="loginId" value="${sessionScope.loginId}"></c:set> --%>
	<div id="info_wrap">

	<!-- 로그인한 아이디 -->
		<input type="hidden" id="member_id" name="member_id" value="${loginId}">
	
		<div id="info_title">
			<div class="bg" style="background-image: url('${dto.image}')">
			</div>
			<div class="info_left">
				<h2>${dto.movieNm }</h2>
				<h3 id="mvEn"></h3>
			</div>
			<div class="info_bottom">
				<div class="bottom">
					<p class="subtitle">FilmBox 평점</p>
					<p class="sub">
						${dto.starpoint }<span>점</span>
					</p>
				</div>
				<div class="bottom">
					<p class="subtitle">박스오피스</p>
					<p class="sub">
						${dto.rank } <span>위</span>
					</p>
				</div>
				<div class="bottom">
					<p class="subtitle">누적관객수</p>
					<p class="sub">
					   <fmt:formatNumber value="${dto.audiAcc }" pattern="#,###"/><span>명</span>
					</p>
				</div>
			</div>
			<div class="info_right">
				<img alt="영화 포스터" src="${dto.image }">
			</div>
		</div>
		
		<!-- update_date가 최근날짜가 아니면 예매 불가 -->
		<fmt:parseDate value="${compare_date}" pattern="yyyy-MM-dd" var="compare"/>	
		<fmt:parseNumber value="${compare.time / (1000*60*60*24)}" integerOnly="true" var="compare_date"/>
		<fmt:parseDate value="${dto.update_date}" pattern="yyyy-MM-dd" var="update"/>	
		<fmt:parseNumber value="${update.time / (1000*60*60*24)}" integerOnly="true" var="update_date"/>
		
		<div class="reserve_screen-type">
		<c:choose>
			<c:when test="${compare_date < update_date }">
				<form class="moveForm" action="/reservemovie" method="post">

					<input type="hidden" name="movieNm" value="${dto.movieNm}">
					<input type="hidden" name="movieCd" value="${dto.movieCd}">
					<input type="submit" value="예매하기" class="reserveBtn">
				</form>
			</c:when>
			<c:otherwise>
				<div class="reserve">
					<input type="button" value="예매불가">
				</div>
			</c:otherwise>
		</c:choose>
		</div>


		<ul class="tab_wrap">
			<li class="act first_btn">영화정보</li>
			<li class="second_btn">실관람평 (<span class="reviewCount"></span>)</li>
		</ul>
		
		<table id="content" class="table table-hover">
		</table>
		<div class="rgyPostIt">
		
		</div>
		

		<input type="hidden" id="rev_no" name="rev_no" value=""> <!-- 예약번호  없으면 댓글 작성창 못뜨게-->
	
		<div class="review_wrap">
			<p>
				총 <b class="reviewCount"></b>건의 관람평이 있습니다.
			</p>
			<div class="line"></div>
			<ul class="review">
			 	<li>
			 	<c:choose>		 	
				 	<c:when test="${myreview.review_starpoint != null }">
				 		<div class="user_info">
							<span class="userName"> 나의 관람평 </span> 
							<span><img alt="star" src="../resources/img/star.png"> ${myreview.review_starpoint } </span>
						</div>
						<div class="review_info myreview">
							<span>${myreview.review_content }</span>
							
							<img class="moreBtn" alt="more" src="../resources/img/moreBtn.png">
							<div class="edit etc">			
					<c:choose>					
						<c:when test="${myreview.review_content eq '신고 된 관람평입니다'}">
								<span id="deleteBtn">삭제</span>
						</c:when>
						<c:otherwise>
								<span id="modifyBtn">수정</span>
								<span id="deleteBtn">삭제</span>
						</c:otherwise>
					</c:choose>
							</div>
						</div>
				 	</c:when>
				 	
				 	<c:otherwise>
						<div class="user_info">
							<span class="userName"> Film Box </span>
						</div>
						<div class="review_info myreview">
							${dto.movieNm } 을/를 재밌게 관람하셨나요? 관람평을 남기시면 <strong>500P</strong>가
							적립됩니다. <strong id="review_window">관람평 쓰기</strong>
								<!-- 댓글작성 시 로그인 필수 안내창 -->
								<div class="loginInfo">
									<p>로그인이 필요한 서비스 입니다. </p>
									<a href="/login">로그인 하러가기 > </a>
								</div>
							</div>
				 	</c:otherwise> 	
			 	</c:choose>
				</li>
			</ul>
			<!-- 댓글목록 반복문 돌리기 -->
			<ul class="review">
 				<!-- <li>
					<div class="user_info">
						<span class="userName">이*름	</span>
						<span><img alt="star" src="../resources/img/star.png"> 8 </span>
						<span class="write_date"> 2021.09.28 </span>
					</div>
					<div class="review_info">
						<span>재밌었어용ㅎㅎ오예~~</span>
						<img class="moreBtn" alt="more" src="../resources/img/moreBtn.png">
						<div class="report etc">
							<p> 스포일러 및 욕설/비방하는 내용이 있습니까?</p>
							<span>신고</span>
						</div>
					</div>
				</li>  -->
			</ul>
					
			<div class="more" id="more_review">
				<div class="more_open">댓글 더보기</div>
				<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>
			</div>
		</div>
		
		<!-- 댓글 작성 창 -->
		<form id="review_write" method="post" action="../reviewInsertAction" onsubmit="return checkStar();">
		
		<input type="hidden" id="movieCd" name="movieCd" value="${dto.movieCd }">
		<input type="hidden" id="rev_no" class="rev_no" name="rev_no" value="${rev_no}">
		
			<header class="window_top">
				<h5>관람평 작성 </h5>
				<img alt="close" class="reset" src="../resources/img/close.png">
			</header>
			<div class="score">
				<h2 class="tit">${dto.movieNm }</h2>
				    <p><input type="text" id="review_starpoint" name="review_starpoint" value="0"> 점</p>
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
				<textarea id="review_content" name="review_content" rows="5" cols="50" placeholder="관람평을 남겨주세요. 스포 및 비방글은 무통보 삭제조치를 받을 수 있습니다."></textarea>
				<br>
				<p class="alarm"> 　</p>
				<input type="reset" class="reset" value="취소">
				<input type="submit" value="등록">
			</div>
		</form>
		
		
		<div class="notice">
			<h5>유의사항</h5>
			<ul>
				<li> 관람하신 영화 당 1회만 작성 가능합니다. </li>
				<li> 관람평 수정 시에는 포인트 적립이 되지 않습니다. </li>
				<li> 관람평 삭제 시에는 지급된 포인트가 회수됩닌다. </li>
				<li> 작성하신 관람평은 마이페이지 > MY필름스토리 에서 확인하실 수 있습니다. </li>
				<li> 해당 평점은 FilmBox 실관람객의 평점입니다. </li>
			</ul>
		</div>
	</div>
	<script src="/resources/js/movieInfo.js"></script>
</body>
</html>