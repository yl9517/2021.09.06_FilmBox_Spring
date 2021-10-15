<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/noticeform.css">
</head>
<body>

<form method="post" action="/noticeinsertresult" class="form" enctype="multipart/form-data">
		<div class="top_content">
			<div class="notice_title_title">> 제목</div>
			<input type="text" id="notice_title" class="notice_title" name="notice_title" spellcheck="false" required/>
		</div>
		
		<div class="bottom_content">
			<div class="notice_content_title">> 내용</div>
			<textarea class="notice_content" id="notice_content" name="notice_content" spellcheck="false" required></textarea>
			<div>
			<div class="addfile">> 첨부</div>
 			<input type="file" id="upload" name="upload">
 			</div>
		</div>

	
	<div class="write_btns">
	<input type="submit" class="write_btn" value="확인">
	<input type="reset" class="write_btn_reset" value="초기화">
	</div>

</form>

</body>
</html>