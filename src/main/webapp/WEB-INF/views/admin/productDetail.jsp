<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources\css\productDetail.css">
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
<div class="pInsert_wrap">
		<!-- content -->
		<div class="container pt-3">
			<div class="row">
				<!-- left -->
				<div class="col-xs-2" id="panel-wrap">
					<div class="panel panel-default">
						<div class="panel-heading">스토어 관리</div>
						<ul class="list-group">
							<li class="list-group-item"><a href="productInsert">상품 등록</a></li>
							<li class="list-group-item"><a href="productList">상품 목록</a></li>
						</ul>
					</div>
				</div>
				
				<!-- right -->
				<div class="product_info_wrap">
				<!-- 이미지 center-->
				<div class="col-xs-2">
					<img src="resources\img\clapperboard.png" alt="img" class="img-thumbnail" width="300px" height="300px">
				</div>
				<table class="table table-striped" class="col-xs-2" id="product_info">
 					<thead>
 						<tr><th colspan="2" class="text-center" id="t_header">상품 상세</th></tr>
 					</thead>
 					<tbody>
 						<tr>
 							<td>
 								<label>상품번호</label>
 							</td>
 							<td>
 								<p id="product_no">2</p>
 							</td>
 						</tr>
 						<tr>
 							<td>
 								<label>상품 분류</label>
 							</td>
 							<td>
 								<select name="product_category" id="product_category">
 									<option value="">------</option>
 									<option value="coupon">쿠폰</option>
 									<option value="popcon">팝콘</option>
 									<option value="drink">음료</option>
 								</select>
 							</td>
 						</tr>
 						<tr>
 							<td>
 								<label>상품명</label>
 							</td>
 							<td>
 								<p>코카 콜라</p>
 							</td>
 						</tr>
 						<tr>
 							<td>
 								<label>상품 가격</label>
 							</td>
 							<td>
 								<p>1500</p>
 							</td>
 						</tr>
 						<tr>
 							<td>
 								<label>상품 설명</label>
 							</td>
 							<td>
 								<p>코카콜라</p>
 							</td>
 						</tr>
 					</tbody>
 			</table>
 			<div class="btns">
					<button type="reset" class="btn btn-default btn-sm" id="update">수정</button>
					<button type="submit" class="btn btn-danger btn-sm" id="delete">삭제</button>
			</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript" src="resources\js\productDetail.js"></script>
</body>
</html>