<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/postDetail.css">
</head>
<body>
<div class="layer-con">
	<div class="post_detail"><%-- 
		<div class="tit-area mb30">
			<p class="tit">${dto.movieNm }</p>
		</div>
		 --%>
		<div class="user-post-box mb40">
			<div class="user-post-case">
				<div class="post-top-area">
					<div class="user-info">
						<p class="user-id">${dto.member_id }</p>
						<p class="user-write-time">${dto.post_date }</p>
					</div>
				</div>
				
				<div class="post-cont-area">
					<div class="section">
						<div class="content">
							<img src="${dto.image }" alt/>
							<p>${dto.post_content }</p>
						</div>
					</div>
				</div>
			</div>
		</div>

			<form class="form" method="post" action="/subpostinsert">

				<div class=top-comment-add>
					<div class="post_witer">댓글</div>
				</div>
				<c:choose>
					<c:when test="${member_id eq null}">
					<div class="bottom_comment-content">
						<textarea class="subcontent" id="subcontent"
						name="subcontent" spellcheck="false"  readonly="readonly">로그인이 필요한 서비스입니다.</textarea>
					</div>
					</c:when>
					<c:otherwise>
					<div class="bottom_comment-content">
						<input type="hidden" name="member_id" value="${member_id}">
						<input type="hidden" name="post_no" value="${dto.post_no}">
						<textarea class="subcontent" id="subcontent"
						name="subcontent" spellcheck="false" required></textarea>
					</div>
					<div class="write_btns">
						<input type="submit" class="write_btn" value="등록">
					</div>
					</c:otherwise>
				</c:choose>
				
			</form>

			<div class="comment-list" id="commentList">
		
		</div>
	</div>
</div>

	
	<script src="/resources/js/postDetail.js"></script>
</body>
</html>
