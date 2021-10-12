<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources\css\productInsert.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
 integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
 integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
 crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
 crossorigin="anonymous"></script>
</head>
<body>

<div class="pInsert_wrap">

		<!-- content -->
 		<div class="container pt-3">
 			<div class="row">
				<!-- left -->
 				<div class="col-xs-2" id="panel-wrap">
 					<div class="panel panel-default">
						<ul class="list-group">
							<li class="list-group-item list-group-item-secondary"><strong>스토어관리</strong></li>
							<li class="list-group-item list-group-item-action list-group-item-light"><a href="/productInsert">상품 등록</a></li>
							<li class="list-group-item list-group-item-action list-group-item-light"><a href="/productList">상품 목록</a></li>
						</ul>
					</div>
 				</div>
 				
 				<!-- right -->
 				<form method="post" action="productInsertAction" class="col-xs-8" id="product_info" enctype="multipart/form-data">
 					<div class="text-center" id="t_header">상품 등록</div>
 					<table class="table table-striped">
 						<tbody>
 							<tr>
 								<td>
 									<label>상품 분류</label>
 								</td>
 								<td>
 									<select name="product_category" id="product_category" required="required">
 										<option value="">------</option>
 										<option value="coupon">쿠폰</option>
 										<option value="food">팝콘/음료</option>
 									</select>
 								</td>
 							</tr>
 							<tr>
 								<td>
 									<label>상품명</label>
 								</td>
 								<td>
 									<input type="text" id="product_name" name="product_name" required="required">
 								</td>
 							</tr>
 							<tr>
 								<td>
 									<label>상품 가격</label>
 								</td>
 								<td>
 									<input type="text" id="product_price" name="product_price" required="required">
 								</td>
 							</tr>
 							<tr>
 								<td>
 									<label>상품 설명</label>
 								</td>
 								<td>
 									<textarea rows="3" cols="40" id="product_content" name="product_content"></textarea>
 								</td>
 							</tr>
 							<tr>
 								<td>
 									<label>상품 이미지</label>
 								</td>
 								<td>
 									<input type="file" id="productfile" name="productfile">
 								</td>
 							</tr>
 						</tbody>
 					</table>
 					
 					<div class="btns">
 						<button type="reset" class="btn btn-outline-dark btn-sm" id="cancel">취소</button>
						<input type="submit" class="btn btn-danger btn-sm" id="insert" value="등록">
					</div>
 				</form>
			</div>
 		</div>
 </div>
</body>
</html>