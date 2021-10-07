<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/storeDetail.css">
</head>
<body>
	<div id="detail_wrap">
		<input type="hidden" id="product_no" value="1">
		<div id="box_product_view">
			<form action="/storepay" method="post" name="receipt">
			
			<div class="product_img">
				<img alt="상품이미지" src="https://cdn.pixabay.com/photo/2019/06/12/07/12/popcorn-4268489_960_720.jpg" id="product_img" name="product_img">
			</div>
			<div class="product_info">
				<table>
					<tr><th colspan="2"> <input type="text" id="product_name" name="product_name" value="${dto.product_name }" readonly="readonly">
								</th></tr>
					<tr>
						<th> 구성품 </th>
						<td> <input type="text" id="product_content" name="product_content" value="${dto.product_content }" readonly="readonly"></td>
					</tr>
					<tr>
						<th> 판매수량 </th>
						<td> 제한 없음 </td>
					</tr>
					<tr>
						<th> 유효기간 </th>
						<td> 구매일로부터  2년 이내 사용 가능 </td>
					</tr>
					<tr>
						<th> 수량 / 금액 </th>
						<td> 
						<input type="hidden" id="product_no" name="product_no" value="${dto.product_no }"> 
							<div class="count">
								<button type="button" onclick='count("minus")'> - </button>
								<input type="text" id="product_count" name="product_count" value="1" min="1" readonly="readonly">
								<button type="button" onclick='count("plus")'> + </button>
							</div>
							<div class="sum">
								<input type="text" id="product_price" name="product_price" value="${dto.product_price }" readonly="readonly" >원
							</div>
						</td>
					</tr>
				</table>
				<div class="total_box">
					<button type="button" class="pay-button">구매</button>
				</div>
			</div>
		
			</form>
		</div>
	
	</div>
	<script src="/resources/js/storeDetail.js"></script>
</body>
</html>