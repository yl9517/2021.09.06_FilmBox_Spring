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
					<li></li>
				</ol>
				
				<div class="add-post">
				<a href="#" onClick="mypostadd('/mypost','${member_id}')" class="button purple">작성하기</a>
				</div>
			</div>
		</div>
	
		<div class="movie-post-list">
			<div class="grid-item">
				<div class="wrap">
					<div class="img">
						<a href="" title="무비포스트 상세보기" class="post-detailPopup btn-modal-open2" >
						<img src="https://img.megabox.co.kr/SharedImg/2021/08/20/RXpJHrGvZZDIKAD5rqJWL4kSzlI2Fy54_230.jpg"></a>
						
					</div>
					<div class="cont">
						<div class="wrtter">test</div>
						<a href="">
							<p class="tit">모가디슈</p>
						</a>
						<a href="" class="link btn-modal-open2 post-detailPopup">
							<p class="txt">saadasd</p>
							<p class="time">ssssssssssss</p>
						</a>
					</div>
				</div>
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

