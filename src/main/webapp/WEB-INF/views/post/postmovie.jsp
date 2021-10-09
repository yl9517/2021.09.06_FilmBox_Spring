<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/postmovie.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<form name="mypost" method="POST">
<input type="hidden" name="member_id">
</form>
	<div class="contents" class="pt00 location-fixed">
		<div class="movie-box">
			<div class="inner-wrap">
				<h2 class="tit">MoviePost</h2>
				<ol class="post-lank">
				<c:forEach var="item" items="${postlist }">
					<li>
						<a href="#" class="top5Btn" title="${item.movieNm } 무비포스트보기">
							<p class="lank">1</p>
							<div class="post-count">
								<p class="tit">POST</p>
								<p class="count">${item.post_count }</p>
							</div>
							<p class="img">
								<img src="${item.image}">
							</p>
						</a>
					</li>
				</c:forEach>
				</ol>
				<div class="add-post">
				<a href="#" onClick="mypostadd('/mypost','${id}')" class="button purple">작성하기</a>
				</div>
			</div>
		</div>
	
		<div class="movie-post-list">
			<div class="grid-item">
			<c:forEach var="item" items="${list }">
				<div class="wrap">
					<div class="img">
						<a href="" title="무비포스트 상세보기" class="post-detailPopup btn-modal-open2" >
						<img src="${item.image}"></a>
						
					</div>
					<div class="cont">
						<div class="wrtter">${item.member_id}</div>
						<a href="">
							<p class="tit">${item.movieNm }</p>
						</a>
						<a href="" class="link btn-modal-open2 post-detailPopup">
							<p class="txt">${item.post_content }</p>
							<p class="time">ssssssssssss</p>
						</a>
						</div>
				</div>
			</c:forEach>
			</div>
		</div>
	</div>
	<script>
		function mypostadd(link, flag) {

			document.mypost.action = link;
			document.mypost.member_id.value = flag;
			document.mypost.submit()

		}
	</script>
</body>
</html>

