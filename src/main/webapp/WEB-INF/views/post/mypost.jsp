<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/mypost.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<form name="mypost" method="POST">
<input type="hidden" name="movieNm">
</form>
	<div id="movie_wrap">
		<div id="movieList">
			<h2>무비포스트 작성</h2>
			<ul>
				<c:forEach var="item" items="${list }">
					<li>
					<a href="#" onClick="mypostaddd('/postadd','${item.movieNm}')">
						<%-- <a href="postadd/${item.movieNm}"> --%> 
						<img alt="영화 포스터" src="${item.image }">
					</a>
						<div class="mv_title">
							<h3>${item.movieNm }</h3>
						</div>
						<div class="reservation">
							<form class="moveForm" action="/postadd" method="post">
								<input type="hidden" name="movieNm" value="${item.movieNm}">
								<input type="submit" value="작성하기" class="button gblue">
							</form>
						</div>
					</li>
				</c:forEach>
			</ul>
			<div id="clear"></div>
		</div>
	</div>
	<script>
	function mypostaddd(link, flag) {

		document.mypost.action = link;
		document.mypost.movieNm.value = flag;
		document.mypost.submit()

	}
	</script>
</body>
</html>