<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/myMoviePost.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" 
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
</head>
<body>
<div class="mpost_wrap">
		<div class="mpost">
			<div class="mpost_h">무비 포스트</div>
			<p class="badge bg-danger">${postCount}건</p>
		</div>
		
		<div class="inner-wrap mt30">
			<div class="movie-post-list">
			<c:choose>
				<c:when test="${!empty mypostlist }">
					<c:forEach var="item" items="${mypostlist }">
						<div class="grid-item">
							<div class="wrap">
								<div class="img">
									<a href="/postdetail/${item.post_no}" title="무비포스트 상세보기" class="post-detailPopup btn-modal-open2" >
									<img src="${item.image}"></a>
						
								</div>
								<div class="cont">
									<div class="wrtter">${item.member_name}</div>
									<a href="/postdetail/${item.post_no}">
										<p class="tit">${item.movieNm }</p>
									</a>
									<a href="/postdetail/${item.post_no}" class="link btn-modal-open2 post-detailPopup">
										<p class="txt">${item.post_content }</p>
										<p class="time">${item.post_date }</p>
									</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<div class="post_info">
						<div  class="empty_post">
							<img src="resources\img\caption.png" width="140px" height="140px">
						 	<div>나의 무비 포스트가 없습니다</div>
						 	<div><strong>지금 바로 무비 포스트를 추가해보세요</strong></div><br>
						 	<a href="post" id="post_link">무비 포스트 작성하러가기</a>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
</div>

</body>
</html>