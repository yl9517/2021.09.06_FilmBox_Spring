<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/movieList.css">
</head>
<body>
<div id="movie_wrap">
	<h2> 검색 결과 </h2>
	<div id="movieList">
		<ul>
		<c:choose>
			<c:when test="${searchMv.size() == 0 }">
				<p class="nosearch">검색 결과가 없습니다.</p>
			</c:when>
			<c:otherwise>
				<c:forEach var="item" items="${searchMv }">
					<li>
						<a href="movieInfo/${item.movieCd}">
							<img alt="영화 포스터" src="${item.image }">
						</a>
						<div class="mv_title">
							<h3>${item.movieNm } </h3>
							<span>개봉일 ${item.openDt } </span>
							<span> 별점 ${item.starpoint} </span>
						</div>		
					</li>
				</c:forEach>
			</c:otherwise>
		</c:choose>	
		</ul>
		
		<div id="clear"></div>
	</div>
</div>
</body>
</html>