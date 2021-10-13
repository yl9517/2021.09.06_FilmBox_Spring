<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="..\resources\css\productDetail.css">
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
				<form class="col-xs-8" id="product_info">
					<div class="text-center" id="t_header">상품 상세보기</div>
						<!-- 테이블-->
						<table class="table table-striped" id="p_table">
 							<tbody>
 								<tr>
 									<td rowspan="5">
 										<img src="${dto.product_img }" alt="img" class="img-thumbnail" id="t_img">
 									</td>
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
 										<c:choose>
 											<c:when test="${dto.product_category eq 'coupon' }">
 												<p>쿠폰</p>
 											</c:when>
 											<c:when test="${dto.product_category eq 'food' }">
 												<p>팝콘/음료</p>
 											</c:when>
 										</c:choose>
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
 			
				</form>
				
			</div>
		</div>
	</div>

</body>
</html>