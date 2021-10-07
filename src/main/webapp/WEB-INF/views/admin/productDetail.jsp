<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="..\resources\css\productDetail.css">
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
							<li class="list-group-item"><a href="/productInsert">상품 등록</a></li>
							<li class="list-group-item"><a href="/productList">상품 목록</a></li>
						</ul>
					</div>
				</div>
				
				<!-- right -->
				<div class="product_info_wrap">
				<!-- 이미지 center-->
				<div class="col-xs-2">
					<img src="${dto.product_img }" alt="img" class="img-thumbnail" width="300px" height="300px">
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
 								<p id="product_no">${dto.product_no }</p>
 							</td>
 						</tr>
 						<tr>
 							<td>
 								<label>상품 분류</label>
 							</td>
 							<td>
 								<p>${dto.product_category }</p>
 							</td>
 						</tr>
 						<tr>
 							<td>
 								<label>상품명</label>
 							</td>
 							<td>
 								<p>${dto.product_name }</p>
 							</td>
 						</tr>
 						<tr>
 							<td>
 								<label>상품 가격</label>
 							</td>
 							<td>
 								<p>${dto.product_price }</p>
 							</td>
 						</tr>
 						<tr>
 							<td>
 								<label>상품 설명</label>
 							</td>
 							<td>
 								<p>${dto.product_content }</p>
 							</td>
 						</tr>
 					</tbody>
 					</table>
 			
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript" src="..\resources\js\productDetail.js"></script>
</body>
</html>