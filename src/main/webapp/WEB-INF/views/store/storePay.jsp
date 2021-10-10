<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" href="/resources/css/storePay.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<div id="pay_wrap">
		<h2>결제</h2>
	
		<div id="box_product">	
		<h3> 주문 정보 </h3>	
			<table class="table">
				<thead>
					<tr>
						<th colspan="2">주문상품</th>
						<th>구매수량</th>
						<th>총 금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td width="150px"><img alt="상품이미지" src="https://cdn.pixabay.com/photo/2019/06/12/07/12/popcorn-4268489_960_720.jpg"></td>
						<td class="store_name"><p class="product_name">${dto.product_name }</p><p>${dto.product_content }</p></td>
						<td width="150px">${count }</td>
						<td width="200px">${dto.product_price }</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<h3>쿠폰 </h3>	
		<div id="box_coupon">
			<label>쿠폰 <span> (사용 가능한 쿠폰 <b>3장</b>) </span></label>
				<select id="coupons" name="coupons" class="coupons">
					<option value="" selected>-- 쿠폰을 선택하세요 --</option>
					<c:forEach var="item" items="${map }">
						<option value="${item.product_price }">${item.product_name }</option>
					</c:forEach>
<!-- 					<option value="1000">1000원 할인권</option>
					<option value="4000">4000원 할인권</option>
					<option value="2000">2000원 할인권</option>
					<option value="3000">3000원 할인권</option> -->
				</select>
				<ul>
					<li> 1개의 결제건 당 1개의 쿠폰만 사용 가능합니다 </li>
					<li> 상품금액보다 큰 금액의 쿠폰은 사용 불가능합니다. </li>
					<li> 본 쿠폰과 상이한 제품변경 및 사이즈업 불가합니다. </li>
				</ul>
		</div>
		
		
		
		
		
		<h3> 최종 결제 </h3>	
		<div id="box_price">
			<ul>
				<li>
					<div>
						<p class="price_title">총 상품금액</p>
						<b class="price_content before_price">${dto.product_price } </b>
					</div>				
				</li>
				<li class="sign">-</li>
				<li>
					<div>
						<p class="price_title">할인 금액</p>
						<b class="price_content sale"> 0 </b>
					</div>				
				</li>
				<li class="sign">=</li>
				<li>
					<div>
						<p class="price_title">최종 결제 금액</p>
						<b class="price_final">${dto.product_price }</b> 원
					</div>				
				</li>
			</ul>
		</div>
		<form action="/storepaydone" method="post" name="final">
			<input type="hidden" name="product_no" value="${dto.product_no }">
			<input type="hidden" name="coupon_count" value="${count }">
			<input type="hidden" name="coupon_price" value="${dto.product_price }">
		</form>
		<div class="box_pay">
			<button type="button" class="reset-button">취소</button>
			<button type="button" class="pay-button">구매</button>
		</div>		
	</div>
	<script src="/resources/js/storePay.js"></script>
</body>
</html>