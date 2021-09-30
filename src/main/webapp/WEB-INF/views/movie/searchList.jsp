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
	<div id="movieList">
	<h2> 검색 결과 </h2>
		<c:choose>
			<c:when test="${searchMv.size() == 0 }">
				<div  class="empty_story">
					<img src="resources\img\clapperboard.png" width="140px" height="140px">
				 	<div> 검색결과가 없습니다</div><br>
				</div>
			</c:when>
			<c:otherwise>
			<ul>
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
			</ul>
			</c:otherwise>
		</c:choose>	
		
		<div id="clear"></div>
	</div>
</div>
</body>
</html>