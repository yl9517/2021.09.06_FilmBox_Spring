<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources\css\mypointlist.css">
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
<div class="mypointlist">
	<div class="mypointlist_header">
		<h3><strong>내 포인트 내역</strong></h3>
	</div>
	<div class="mypointlist_total">
		<div>현재 사용가능 포인트</div>
		<span><strong>1,500</strong></span>
	</div>
	<div class="point_animation">
		<img src="resources\img\reward.png" width="30px" height="30px" class="point_img">
		<img src="resources\img\reward.png" width="20px" height="20px" class="point_img2">
	</div>
	<div class="table-wrap">
		<table class="table table-striped" style="margin: 0 auto; width: 1100px; font-size:18px;">
			<thead>
				<tr><th>일자</th><th>내용</th><th>포인트</th></tr>
			</thead>
			<tbody class="point_detail">
				<tr><td>2021-09-10</td>
					<td>(모가디슈)영화 결제 적립</td>
					<td class="plus_minus">+1500</td></tr>
				<tr><td>2021-09-02</td>
					<td>(샹치)영화 예매 포인트 사용</td>
					<td class="plus_minus">-1000</td></tr>
				<tr><td>2017-05-31</td>
					<td>회원가입 적립</td>
					<td class="plus_minus">+1000</td></tr>
			</tbody>
		</table>
	</div>
	
</div>

</section>
<script src="resources\js\mypointlist.js"></script>
</body>
</html>