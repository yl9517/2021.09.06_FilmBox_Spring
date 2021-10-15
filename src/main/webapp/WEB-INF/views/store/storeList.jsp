<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/storeList.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>

<link href="//cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.4.0/css/bootstrap4-toggle.min.css" rel="stylesheet">  
<script src="//cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.4.0/js/bootstrap4-toggle.min.js"></script>
</head>
<body>

	<div id="store_wrap">
			
			<div id="console-event"></div>
			<h2>스토어</h2>
			<c:if test="${member_id == 'admin' }">
				<div class="t-switch">
					<input id="toggle-event" type="checkbox" data-toggle="toggle" data-onstyle="danger" data-size="sm">
				</div>
				<p class="t-switch-h">상품 관리</p>
			</c:if>
			
		<div>
			<ul class="tab_wrap">
				<li class="act first_btn">FOOD</li>
				<li class="second_btn">COUPON</li>
			</ul> 
		</div>	
		
		
			<ul class="productList food">
				<c:forEach var="item" items="${foodlist }">					
					<li>
						<a href="/store/${item.product_no }">
							<div class="productimg">
								<img alt="상품이미지" src="${item.product_img }">
							</div>
							<div class="productinfo">
								<h3>${item.product_name}</h3>
								<p> ${item.product_content } </p>
								<div class="productprice"><b>${item.product_price }원</b></div>
							</div>
						</a>	
					</li>
				</c:forEach>
			</ul>
			
			<ul class="productList coupon">
				<c:forEach var="item" items="${couponlist }">					
					<li>
						<a href="/store/${item.product_no }">
							<div class="productimg">
								<img alt="상품이미지" src="${item.product_img }">
							</div>
							<div class="productinfo">
								<h3>${item.product_name}</h3>
								<p> ${item.product_content } </p>
								<div class="productprice"><b>${item.product_price }원</b></div>
							</div>
						</a>	
					</li>
				</c:forEach>
			</ul>
			
		</div>
<script type="text/javascript" src="resources\js\storeList.js"></script>
</body>
</html>