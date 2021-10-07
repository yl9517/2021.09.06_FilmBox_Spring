<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/noticemodify.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>
<form class="form">

		<div class="top_content">
			<div class="notice_title_title">> 제목</div>
			<input type="text" id="notice_title" class="notice_title" name="notice_title" value="${detail.notice_title }" readonly/>
		</div>

		<div class="bottom_content">
			<div class="notice_content_title">> 내용</div>
			<textarea class="notice_content" id="notice_content" name="notice_content" readonly><c:out value="${detail.notice_content }"/></textarea>
		</div>
		
<c:if test="${member_id=='admin' }">
	<div class="write_btns">
	<a href="/noticemodify?notice_no=${detail.notice_no }" class="write_btn">수정</a>
	<a href="/noticedelete?notice_no=${detail.notice_no }" class="write_btn_del">삭제</a>
	</div>
</c:if>
	<div class="write_btns">
	<a href="/notice" class="write_btn">목록으로</a>
	</div>
	
</form>


</body>
</html>