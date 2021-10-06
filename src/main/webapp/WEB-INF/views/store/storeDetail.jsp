<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/storeDetail.css">
</head>
<body>
	<div id="detail_wrap">
	
		<div id="box_product_view">
			<div class="product_img">
				<img alt="상품이미지" src="https://cdn.pixabay.com/photo/2019/06/12/07/12/popcorn-4268489_960_720.jpg">
			</div>
			<div class="product_info">
				<table>
					<tr><th colspan="2"> 버블버블버블팝 콤보 </th></tr>
					<tr>
						<th> 구성품 </th>
						<td> 팝콘(R) 2 + 콜라 1 </td>
					</tr>
					<tr>
						<th> 판매수량 </th>
						<td> 제한없음 / 1인 3개 구매가능</td>
					</tr>
					<tr>
						<th> 유효기간 </th>
						<td> 구매일로부터  2년 이내 사용 가능 </td>
					</tr>
					<tr>
						<th> 수량 / 금액 </th>
						<td> 				
							<input type="number" value="1">
							<div> <strong id="sumMoney">12,000</strong>원</div>
						</td>
					</tr>
				</table>
				<div class="total_box">

					<button type="button" class="pay-button">구매</button>
				</div>
			</div>
		
		</div>
	
	</div>
</body>
</html>