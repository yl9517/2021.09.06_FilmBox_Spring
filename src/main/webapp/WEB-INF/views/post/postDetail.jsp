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
<script>
	function subDelete(subno,post_no)
	{
		location.href="/subDelete/"+subno+"/"+post_no;
	}
	function postmodify(post_no)
	{
		location.href="/postModify/"+post_no;
	}
	function postdelete(post_no)
	{
		location.href="/postDelete/"+post_no;
	}
</script>
</head>
<body>
<div class="layer-con">
	<div class="post_detail">
		<div class="user-post-box mb40">
			<div class="user-post-case">
				<div class="post-top-area">
					<div class="user-info">
						<p class="user-id">${dto.member_name }</p>
						<p class="user-write-time">${dto.post_date }</p>
					
					</div>
					<c:if test="${member_id eq dto.member_id}">
					<div class="user-control">
						<input type="button" class="postmodify" id="postmodify" value="수정" onclick="postmodify(${post_no })">
						<input type="button" class="postdelete" id="postdelete" value="삭제" onclick="postdelete(${post_no })">
					</div>
					</c:if>
				</div>
				
				<div class="post-cont-area">
					<div class="section">
						<div class="content">
							<img src="${dto.image }" alt=""/>
							<p>${dto.post_content }</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="form" id="commentList">
			<form class="form_" method="post" action="/subpostinsert">

				<div class="top-comment-add">
					<div class="post_witer">댓글작성</div>
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

			<ul class="postsub">
			<li>
			<div class="subpost_list">댓글 (${subcount })</div>
			</li>
			<c:choose>
				<c:when test="${subcount eq 0}">
				<li class="postsub_li">
					<span>첫번째 댓글의 주인공이 되어보세요!</span>
				</li>
				</c:when>
				
				<c:otherwise>
			<c:forEach var="item" items="${sublist }">
				<li class="postsub_li">
					<div class="user_info">
						<span class="userName">${item.member_name }</span>
						<span class="write_date">${item.sub_date }</span>
					</div>
					<div>
						<span>${item.subcontent }</span>
					<c:if test="${member_id eq item.member_id}">
						<input type="button" class="subdelete" id="subdelete" value="X" onclick="subDelete(${item.subno },${item.post_no })">
					</c:if>
				
					</div>
				</li>
				

			</c:forEach>
				
				</c:otherwise>
			</c:choose>
			
			</ul>
			<div class="paging">
 				<c:if test="${subpage.prev }">
					<a href="/postdetail/${post_no }/?currPage=${subpage.startBlock-1 }" class="prev">
					<c:out value="<<"></c:out></a>
 				</c:if>  
	
				<c:forEach var="index" begin="${subpage.startBlock }" end="${subpage.endBlock }">
					<c:if test="${index==subpage.currPage }">
						<span class="curr"><c:out value="${index }"></c:out></span>
					</c:if>
					
					<c:if test="${index!=subpage.currPage }">
						<a href="/postdetail/${post_no }/?currPage=${index }" class="num">
						<c:out value="${index }"></c:out>
						</a>
					</c:if>
				</c:forEach>
	
				<c:if test="${subpage.next }">
					<a href="/postdetail/${post_no }/?currPage=${subpage.endBlock+1 }" class="next">
						<c:out value=">>"></c:out>
					</a>
					</c:if>
				</div>
		</div>
	</div>
</div>
	<script src="/resources/js/postDetail.js"></script>
</body>
</html>
