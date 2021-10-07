<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="..\resources\css\productUpdate.css">
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
 		<form method="post" action="/productUpdateAction" class="col-xs-8" id="product_info">
 			<table class="table table-striped">
 			<thead>
 				<tr><th colspan="2" class="text-center" id="t_header">상품 수정</th></tr>
 			</thead>
 			<tbody>
 				<tr>
 					<td>
 						<label>상품번호</label>
 					</td>
 					<td>
 						<input type="text" id="product_no" name="product_no" 
 							value="${dto.product_no }" readonly="readonly">
 					</td>
 				</tr>
 				<tr>
 					<td>
 						<label>상품 분류</label>
 					</td>
 					<td>
 						<select name="product_category" id="product_category" required="required">
 							<option value="">------</option>
 							<option value="coupon" 
 								${dto.product_category eq "coupon"? 'selected':''}>쿠폰</option>
 							<option value="food"
 								${dto.product_category eq "food"? 'selected':''}>팝콘/음료</option>
 						</select>
 					</td>
 				</tr>
 				<tr>
 					<td>
 						<label>상품명</label>
 					</td>
 					<td>
 						<input type="text" id="product_name" name="product_name" 
 							value="${dto.product_name }" required="required">
 					</td>
 				</tr>
 				<tr>
 					<td>
 						<label>상품 가격</label>
 					</td>
 					<td>
 						<input type="text" id="product_price" name="product_price" 
 							value="${dto.product_price }" required="required">
 					</td>
 				</tr>
 				<tr>
 					<td>
 						<label>상품 설명</label>
 					</td>
 					<td>
 						<textarea rows="3" cols="40" 
 							id="product_content" name="product_content">${dto.product_content }</textarea>
 					</td>
 				</tr>
 				<tr>
 					<td>
 						<label>상품 이미지</label>
 					</td>
 					<td>
 						<img src="" alt="img">
 						<input type="file" id="product_img" name="product_img"
 							value="${dto.product_img }">
 					</td>
 				</tr>

 			</tbody>
 			</table>
 			<div class="btns">
 				<button type="reset" class="btn btn-default btn-sm" id="cancel">취소</button>
				<button type="submit" class="btn btn-danger btn-sm" id="update">확인</button>
			</div>
 		</form>
	</div>
 </div>
 </div>
</body>
</html>