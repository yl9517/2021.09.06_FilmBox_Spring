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
				<li>
					<a href="#">
						<div class="productimg">
							<img alt="상품이미지" src="https://cdn.pixabay.com/photo/2019/06/12/07/12/popcorn-4268489_960_720.jpg">
						</div>
						<div class="productinfo">
							<h3>버블버블 버블팝 콤보</h3>
							<p> 팝콘(R) 2 + 콜라 1 </p>
							<div class="productprice"><b>12,000원</b></div>
						</div>
					</a>	
				</li>
				<li>
					<a href="#">
						<div class="productimg">
							<img alt="상품이미지" src="https://cdn.pixabay.com/photo/2019/06/12/07/12/popcorn-4268489_960_720.jpg">
						</div>
						<div class="productinfo">
							<h3>버블버블 버블팝 콤보</h3>
							<p> 팝콘(R) 2 </p>
							<div class="productprice"><b>12,000원</b></div>
						</div>
					</a>	
				</li>
				<li>
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
				</li>
				<li>
					<a href="#">
						<div class="productimg">
							<img alt="상품이미지" src="https://cdn.pixabay.com/photo/2019/06/12/07/12/popcorn-4268489_960_720.jpg">
						</div>
						<div class="productinfo">
							<h3>버블버블 버블팝 콤보</h3>
							<p> 팝콘(R) 2 </p>
							<div class="productprice"><b>12,000원</b></div>
						</div>
					</a>	
				</li>
		 <%-- 
				<c:forEach var="item" items="${mvList }">
					<li>
						<a href="movieInfo/${item.movieCd}"> 
						<img alt="영화 포스터" src="${item.image }">
					</a>
						<div class="mv_title">
							<h3>${item.movieNm }</h3>
							<span>개봉일 ${item.openDt } </span> 
							<span>별점 ${item.starpoint } </span>
						</div>
						<div class="reservation">
							<form class="moveForm" action="/reservemovie" method="post">
								<input type="hidden" name="movieNm" value="${item.movieNm}">
								<input type="hidden" name="movieCd" value="${item.movieCd}">
								<input type="submit" value="예매하기" class="button gblue">
							</form>
						</div>
					</li>
				</c:forEach> --%>
			</ul>

		</div>

</body>
</html>