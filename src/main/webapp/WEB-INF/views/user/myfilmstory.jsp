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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" 
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

</head>
<body>

	<div class="story_wrap">
		<div class="story">
			<div class="story_h">나의 필름 스토리</div>
			<p class="badge bg-danger" data-toggle="popover" data-placement="top"
				title="유의사항" data-content="동일 영화 관람평은 1개만 작성 가능합니다">
				${fn:length(myfilmlist)}건
			</p>
		</div>
		
		<div class="story_list_wrap">
			<ul id="story_list">
			<c:choose>
				<c:when test="${!empty myfilmlist }">
					<c:forEach var="item" items="${myfilmlist }">
						
						<li class="movie_info">
							<div class="poster">
							<!-- 누르면 영화 상세보기로 -->
								<a href="movieInfo/${item.movieCd }"> 
									<img src="${item.image }" alt="" width="140px" height="180px">
								</a>
							</div>
							<div class="movie_detail">
								<h4 class="title" id="title">${item.movieNm }</h4>
								<p class="date">${item.show_date } ${item.show_time }</p>
								<p class="seat">${item.seats }</p>
								<!-- 댓글이 있으면 댓글 보여주고 없으면 관람평쓰기 버튼 표시 .....-->
								<c:choose>
									<c:when test="${item.review_content!=null }">
										<div class="write_date">${item.review_date }</div>
										<div class="complete_review"> 
											<img src="resources\img\star.png" alt="" width="30px" height="30px">
											<div class="rate">${item.review_starpoint }</div>
											<div class="content">
												<p>${item.review_content }</p>
												<div>
													<c:choose>
														<c:when test="${item.review_content eq '신고 된 관람평입니다' }">
															<p class="r_del" onclick="r_del_modal('${item.movieCd}')">삭제</p>
														</c:when>
														
														<c:otherwise>
															<p class="r_modify" onclick="r_modify_modal('${item.movieCd}', '${item.movieNm }'); review_modify('${item.movieCd}');">수정</p>
															<p class="bar">|</p>
															<p class="r_del" onclick="r_del_modal('${item.movieCd}')"><span class="material-icons">clear</span></p>
														</c:otherwise>
													
													</c:choose>
												</div>
											</div>
											
										</div>
									</c:when>
									
									<c:otherwise>
										<button type="button" class="btn btn-outline-dark"
											data-toggle="tooltip" data-placement="bottom" title="500P 적립" style="font-size: 15px" 
											onclick="insertReview('${item.movieNm }', '${item.rev_condition }'); review_insert('${item.movieCd}', '${item.rev_no}');"
											>관람평 쓰기</button>
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
			<span class="material-icons">expand_more</span>
		</div>
	
	
		
	<!-- 댓글 작성 창 -->
		<!-- <form id="review_write" method="post" action="../reviewInsertAction" onsubmit="return checkStar();"> -->
		<div id="review_write">
		<input type="hidden" id="member_id" name="member_id" value="${sessionScope.loginId}">
			<header class="window_top">
				<h4>관람평 작성 </h4>
				<img alt="close" id="reset_x" src="../resources/img/close.png">
			</header>
			<div class="score">
				<span class="tit" id="tit"></span>
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
				<button type="button" id="reset" class="btn btn-outline-secondary">취소</button>
				<button type="button" id="confirm" class="btn btn-outline-danger">등록</button>
				<button type="button" id="confirm_modify" class="btn btn-outline-danger">수정</button>
			</div>
		</div>
		<!-- </form> -->
		
	</div>

	<script type="text/javascript" src="resources\js\myfilmstory.js"></script>
</body>
</html>