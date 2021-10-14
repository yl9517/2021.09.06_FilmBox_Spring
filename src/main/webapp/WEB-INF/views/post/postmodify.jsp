<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/postadd.css">
</head>
<body>

<h2>Movie Post 작성</h2>
<form class="form" method="post" action="/postmodifyresult" enctype="multipart/form-data" > 
	
	<div class=top_witer>
		<div class="post_witer"> 작성자</div>
		<input type="text" id="member_id" name="member_id" class="member_id" value="${member_id }" readonly>
		<input type="hidden" id="post_no" name="post_no" class="post_no" value="${dto.post_no }" >
	</div>
	<div class=mid_movie>
		<div class="post_movie"> 영화</div>
		<input type="text" id="movieNm" name="movieNm" class="movieNm" value="${dto.movieNm }" readonly>
	</div>
	
	
	<div class="bottom_content">
		<div class="post_content"> 내용</div>
		<textarea class="post_content" id="post_content" name="post_content" spellcheck="false" required>${dto.post_content }</textarea>
		<div>
		<div class="addfile">이미지 추가</div>
		<input type="file" id="image" name="image">
 		</div>
	</div>

	
	<div class="write_btns">
	<input type="submit" class="write_btn" value="확인">
	<input type="reset" class="write_btn" value="취소">
	</div>
</form>
</body>
</html>
