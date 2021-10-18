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
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
   crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
   integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" 
   crossorigin="anonymous"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
   integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
   crossorigin="anonymous"></script>
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
						<a href="movieInfo/${item.movieCd}" class="top5Btn" title="${item.movieNm } 무비포스트보기">
							<p class="lank">${item.post_no }</p>
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
				<a href="#" onClick="mypostadd('/mypost','${id}')" class="button purple" style="color:white;">작성하기</a>
				</div>
			</div>
		</div>
		<div class="inner-wrap mt30">
			<div class="movie-post-list">
			<c:forEach var="item" items="${list }">
			<div class="grid-item">
				<div class="wrap">
					<div class="img">
						<a href="/postdetail/${item.post_no}" title="무비포스트 상세보기" class="post-detailPopup btn-modal-open2" >
						<img src="${item.image}"></a>
						
					</div>
					<div class="cont">
						<div class="wrtter">${item.member_name}</div>
						<a href="/postdetail/${item.post_no}">
							<p class="tit">${item.movieNm }</p>
						</a>
						<a href="/postdetail/${item.post_no}" class="link btn-modal-open2 post-detailPopup">
							<p class="txt">${item.post_content }</p>
							<p class="time">${item.post_date }</p>
						</a>
						</div>
				</div>
			</div>
			</c:forEach>
		
		</div>
		<div class="more" id="more_post">
			<div class="more_open" onclick="showMore()" >더보기</div>
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
	<script type="text/javascript" src="resources\js\postmovie.js"></script>
</body>
</html>

