<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/postadd.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	
<h2>Movie Post 작성</h2>
<form class="form" method="post" action="postinsert" enctype="multipart/form-data" > 
	
	<div class=top_witer>
		<div class="post_witer"> 작성자</div>
		<input type="text" id="member_id" name="member_id" class="member_id" value="${member_id }" readonly>
	</div>
	<div class=mid_movie>
		<div class="post_movie"> 영화</div>
		<input type="text" id="movieNm" name="movieNm" class="movieNm" value="${dto.movieNm }" readonly>
	</div>
	
	
	<div class="bottom_content">
		<div class="post_content"> 내용</div>
		<textarea class="post_content" id="post_content" name="post_content" rows="10" cols="200" spellcheck="false" required></textarea>
		<div>
		<div class="addfile">이미지 추가 (이미지 필수 입니다.)</div>
		<input type="file" id="image" name="image" required="required">
 		</div>
	</div>

	
	<div class="write_btns">
	<button class="write_btn" type="button">확인</button>
	<!-- <input type="submit" class="write_btn" value="확인"> -->
	</div>
</form>
	<script src="/resources/js/postadd.js"></script>
</body>
</html>