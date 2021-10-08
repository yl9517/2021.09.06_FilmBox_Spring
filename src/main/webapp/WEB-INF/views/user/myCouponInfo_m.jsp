<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}\resources\css\mycouponinfo_m.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- bootstrap -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$('#movie-modal').modal();
		
		let coupon_no = $('#coupon_no').val();
		
		$("#useCoupon").on('click', function(){
			alert('쿠폰을 사용하였습니다.');
			location.href="/useCoupon/"+coupon_no;
		}); 
	});
</script>
</head>
<body>
	<div id="movie-modal" class="modal fade">
	<input type="hidden" id="coupon_no" name="coupon_no" value="${coupon_no }"> 
		<div class="modal-dialog modal-lg" role="document"
			style="width: -webkit-fill-available; display: table">
			<div class="modal-content">

				<div class="modal-body">
					<span class="productimg"> <img src="${product_img}" alt="img"
						class="img-thumbnail">
					</span>
					<div class="info">
						<div class="title">
							<strong>${product_name }</strong>
						</div>
						<div class="content">${product_content }</div>
						<div class="time">${coupon_lastdate }까지이용 가능</div>
					</div>
				</div>
				<div class="modaal-footer">
					<button type="button" id="useCoupon">사용하기</button>
					<div class="logo">
						<img src="${pageContext.request.contextPath}\resources\img\footerlogo.png"
							alt="logo" width="150px">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>