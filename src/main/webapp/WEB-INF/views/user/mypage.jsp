<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources\css\mypage.css">
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
	<section>
	<div class="mypage_wrap">
		<div class="info">
			<div class="modify_quit">
				<div id="login_type" style="display: none">${dto.login_type }</div>
				<div onclick="accessCheck()" class="modify">회원정보 수정</div>
				<span class="material-icons">more_vert</span>
				<div class="quit" data-toggle="modal" data-target="#exampleModal">탈퇴</div>
			</div>
			
			<div class="name">${dto.member_name }님</div>

			<div class="point_story">
				<div class="mypoint">
					<p>MY POINT</p>
					<p class="point">${dto.point }</p>
					<button type="button" class="btn btn-dark"
						onclick="pointList()" style="font-size: 15px">내 포인트 내역</button>
				</div>
				<div class="story">
					<p>나의 필름스토리</p>
					<a href="myfilmstory">${fn:length(myfilmlist)}</a>
				</div>
				<div class="m_post">
					<p>무비 포스트</p>
					<a href="myMoviePost">${postCount }</a>
				</div>
			</div>
		</div>
		
		<div class="rsv_wrap">
			<div class="rsv_h">MY 예매내역
				<span class="material-icons" role="button"
					data-toggle="popover" data-trigger="click" title="유의사항" id="alarm"
					data-content="QR 스캔 화면은 휴대폰 기종에 따라 다르게 보일 수 있습니다. 네이버 QR을 사용해주세요">help</span>
			</div>
			<div class="rsv_list_wrap">
				<ul>
				<c:choose>
					<c:when test="${!empty myRsvList }">
						<c:forEach var="item" items="${myRsvList }">
							
							<div style="display: none" class="rev_condition">${item.rev_condition }</div>

							<li class="rsv_list">
								<div class="rsv_no_wrap">
									예매번호 <span class="rsv_no" id="rsv_no">${item.rev_no }</span>
								</div>
								<div class="rsv_info_wrap">
									<img src="${item.image }" width='140px' height='180px'>
									<div class="rsv_info">
										<div class="title" id="title">${item.movieNm }</div>
										<div>
											관람일시
											<p id="date">${item.show_date } ${item.show_time }</p>
										</div>
										<div>
											좌석
											<p id="seat">${item.seats }</p>
										</div>
									</div>
									
									<div class="rsv_btn">
                                    	<span class="material-icons" data-toggle3="tooltip" data-placement="left" title="Click!" id="qr"
											onclick="openPop('${item.rev_no }','${item.image }', '${item.movieNm }', '${item.show_date }'
                                    							, '${item.show_time }', '${item.seats }' )">qr_code_2</span>
										<br>
										<button type="button" class="btn btn-outline-danger" data-toggle="modal" 
											data-toggle2="tooltip" data-placement="bottom" title="예매취소는 상영시작 20분 전까지 가능합니다!" 
											onclick="checkTime('${item.show_time}', '${item.show_date }', '${item.rev_no }')"
											style="font-size: 15px">예매 취소</button>
									</div>
								</div>
							</li>
							
						</c:forEach>
					</c:when>
				
					<c:otherwise>
						<li class="rsv_list">
							<div class="empty_rsv">
								<img src="resources\img\tickets.png" width="90px" height="90px">
								<div>예매 내역이 없습니다</div>
								<div><strong>지금 바로 영화 예매하세요!</strong></div><br>
								<a href="movieList">영화 예매하러가기</a>
							</div>
						</li>
					</c:otherwise>
					
				</c:choose>
				</ul>
			
			</div>	
		</div>
		
		<div class="coupon_wrap">
			<div class="coupon_h">MY 쿠폰</div>
			<div class="coupon_list_wrap">
				<ul class="coupon_list">
				<c:choose>
					<c:when test="${!empty myCouponList }">
						<c:forEach var="item" items="${myCouponList }">
							<div class="oneCoupon">
								<li class="coupon front">
									<p class="category">${item.product_category}</p>
									<span class="have_count">${item.coupon_count }장 보유</span>
									<div class="coupon_title">${item.product_name }</div>
									<p>${item.coupon_lastdate } 까지 사용 가능</p>
									
								</li>
								
	   							<li class="coupon back">
									<c:choose>
										<c:when test="${item.product_category eq 'food' }">
											<span class="material-icons" data-toggle4="tooltip" data-placement="top" title="Click!" 
											onclick="openCouponPop('${item.coupon_no }','${item.product_no }','${item.product_category }', 
																'${item.product_name }', '${item.product_content }' , '${item.coupon_lastdate }' )">qr_code_2</span>    							
											<p> 사용방법 : QR코드 인식 </p>
											<p> 유효기간 : 앞면표기일 </p>	
											<p> 　</p>
										</c:when>
										<c:otherwise>
											<p> 사용방법 : 스토어 결제 전 쿠폰 선택 </p>
											<p> 유효기간 : 앞면표기일 </p>								
											<p> 타 쿠폰과 중복 적용 불가합니다</p>								
										</c:otherwise>
									</c:choose>
									<p>본 쿠폰은 타 계정으로 양도 불가합니다</p>								
								</li>   
							</div>
							
						</c:forEach>	
						
							<div class="clear"></div>
					</c:when>
				
					<c:otherwise>
							<div class="empty_coupon">
								<img src="resources\img\popcorn.png" width="90px" height="90px">
								<div><strong>구매한 쿠폰이 없습니다</strong></div>
								<a href="/store"> 스토어 구경하러가기</a>
							</div>
						<div class="clear"></div>
					</c:otherwise>
					
				</c:choose>
				</ul>
				
			</div>	
		</div>
		
	</div>
		
		<!-- 예매 취소 modal -->
		<div class="modal fade" id="rsvCancelModal" tabindex="-1" role="dialog"
			aria-labelledby="rsvCancelLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="rsvCancelLabel">Filmbox 예매 취소</h5>
							<!-- <span aria-hidden="true">&times;</span> -->
						</button>
					</div>
					<div class="modal-body">예매 취소 하시겠습니까?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" id="confirm">확인</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
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