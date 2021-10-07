<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/storeList.css">
</head>
<body>
	<div id="store_wrap">

			<h1>스토어</h1>
			
			<ul id="productList">
			<c:forEach var="item" items="${list }">
				<li>
					<a href="/store/${item.product_no }">
						<div class="productimg">
							<img alt="상품이미지" src="https://cdn.pixabay.com/photo/2019/06/12/07/12/popcorn-4268489_960_720.jpg">
						</div>
						<div class="productinfo">
							<h3>${item.product_name}</h3>
							<p> ${item.product_content } </p>
							<div class="productprice"><b>${item.product_price }원</b></div>
						</div>
					</a>	
				</li>
			</c:forEach>

				<!-- <li>
					<a href="/store/1">
						<div class="productimg">
							<img alt="상품이미지" src="https://cdn.pixabay.com/photo/2019/06/12/07/12/popcorn-4268489_960_720.jpg">
						</div>
						<div class="productinfo">
							<h3>버블버블 버블팝 콤보</h3>
							<p> 팝콘(R) 2 </p>
							<div class="productprice"><b>12,000원</b></div>
						</div>
					</a>	
				</li> -->

			</ul>

		</div>

</body>
</html>