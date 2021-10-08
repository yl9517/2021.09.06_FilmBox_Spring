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
<form method="post" action="postinsert" enctype="multipart/form-data" > 
<ul>
	
	<li>
	<label >작성자</label>
	<input type="text" id="member_id" name="member_id" value="${member_id }" readonly>
	</li>
	<li>
	<label>영화</label>
	<input type="text" id="movieNm" name="movieNm" value="${dto.movieNm }" readonly>
	</li>
	
	
	<li>
	<label>내용</label>
	<textarea id="post_contents" name="post_content" rows="15" cols="100" required></textarea>
	</li>
	
	<li>
	<label></label>
	<input type="file" id="image" name="image">
	</li>
	
	<li>
	<input type="submit" id="submit" value="등록">
	<input type="reset" id="reset" value="취소">
	</li>
</ul>

	
</form>
</body>
</html>