<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/noticemodify.css">
</head>
<body>
<form method="post" action="noticemodifyresult" class="form">
	
	<input type="hidden" id="notice_no" name="notice_no" value="${detail.notice_no }"/>
	
			<div class="top_content">
			<div class="notice_title_title">> 제목</div>
			<input type="text" id="notice_title" class="notice_title" name="notice_title" value="${detail.notice_title }" spellcheck="false"/>
		</div>
		
		<div class="bottom_content">
			<div class="notice_content_title">> 내용</div>
			<textarea class="notice_content" id="notice_content" name="notice_content" spellcheck="false"><c:out value="${detail.notice_content }"/></textarea>
		</div>
	
	<div class="write_btns">
	<input type="submit" class="write_btn" value="확인">
	<input type="reset" class="write_btn" value="취소">
	</div>
</form>


</body>
</html>