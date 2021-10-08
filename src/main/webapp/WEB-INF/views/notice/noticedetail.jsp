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
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>

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
	<a data-toggle="modal" data-target="#noticedelModal" class="write_btn_del">삭제</a>
	<!--<a href="/noticedelete?notice_no=${detail.notice_no }" class="write_btn_del" -->
	</div>
</c:if>
	<div class="write_btns">
	<a href="/notice" class="write_btn">목록으로</a>
	</div>
	
</form>

		<!-- 회원 탈퇴 Modal -->
		<div class="modal fade" id="noticedelModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">공지사항 삭제</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
						</button>
					</div>
					<div class="modal-body">게시글을 삭제하시겠습니까?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							onClick="location.href='/noticedelete?notice_no=${detail.notice_no }'">삭제</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		
		<script type="text/javascript" src="resources/js/notice.js"></script>
</body>
</html>