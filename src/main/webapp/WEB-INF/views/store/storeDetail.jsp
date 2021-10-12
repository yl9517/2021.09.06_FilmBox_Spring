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
			<input type="hidden" value="${dto.product_img }" id="product_img" name="product_img">
				<img alt="상품이미지" src="${dto.product_img }">
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
						<td> 구매일로부터  일주일 이내 사용 가능 </td>
					</tr>
					<tr>
						<th> 수량 / 금액 </th>
						<td> 
						<input type="hidden" id="product_no" name="product_no" value="${dto.product_no }"> 
						<input type="hidden" id="product_category" name="product_category" value="${dto.product_category }"> 
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
		<div class="clear"></div>
		<div id="precautions">
			<h3>유의사항</h3>
			<ul>
				<li> 쿠폰 구매 후 취소는 불가합니다.</li>
				<li> 구매하신 쿠폰은 일주일 뒤 자정까지 사용가능하며, 유효기간 만료로 소멸된 쿠폰은 사용이 불가합니다.</li>
				<li> 구매하신 쿠폰은 포인트 혹은 현금으로 교환 불가합니다. </li>
			<c:choose>
				<c:when test="${dto.product_category eq 'food' }">
					<li> 마이페이지 > MY쿠폰에서 QR코드로 사용하실 수 있습니다.</li>
				</c:when>
				<c:otherwise>
					<li> 마이페이지 > MY쿠폰에서 확인하실 수 있습니다. </li>
					<li> 본 쿠폰은 food쿠폰 구매 시 결제창에서 사용하실 수 있습니다. </li>
				</c:otherwise>
			</c:choose>
			</ul>
		</div>
	
	</div>
	<script src="/resources/js/storeDetail.js"></script>
</body>
</html>