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
</head>
<body>
<form method="post" action="noticemodifyresult" class="form" enctype="multipart/form-data">
	
	<input type="hidden" id="notice_no" name="notice_no" value="${detail.notice_no }"/>
	
			<div class="top_content">
			<div class="notice_title_title">> 제목</div>
			<input type="text" id="notice_title" class="notice_title" name="notice_title" value="${detail.notice_title }" spellcheck="false"/>
		</div>
		
		<div class="bottom_content">
			<div class="notice_content_title">> 내용</div>
			<textarea class="notice_content" id="notice_content" name="notice_content" spellcheck="false"><c:out value="${detail.notice_content }"/></textarea>
		
			<div>
			<c:if test="${detail.notice_img!=null }">
				<div class="addfile">> 첨부 파일</div>
				<img alt="첨부" src="${detail.notice_img }" class="addimg">
			</c:if>
				<input type="file" id="upload" name="upload">
<%-- 				<input type="hidden" name="upload" value="${detail.notice_img }"> --%>
			</div>
		</div>
		
	<div class="write_btns">
	<input type="submit" class="write_btn" value="확인">
	<input type="reset" class="write_btn" value="취소">
	</div>
</form>

<!--  <script>
  $("#upload").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $("#addfile img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script> -->

</body>
</html>