<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/noticeList.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
 integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
 integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
 crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
 crossorigin="anonymous"></script>
</head>
<body>
<div class="form">
<div class="container">
	<h3 class="notice_title1">FilmBox 공지사항</h3>
	<br>
		<table class="table">
			<thead>
				<tr>
					 <th style="width : 10%">번호</th>
					 <th style="width : 55%">제목</th> 
					 <th style="width : 25%">작성자</th>
					 <th style="width : 10%">조회수</th>
				</tr>
			</thead>
			
			<tbody>
					<c:forEach items="${list }" var="list">
						<tr>
							<td>
								<c:out value="${list.notice_no}"></c:out>
							</td>
							<td>
								<a href="/noticeDetail?notice_no=${list.notice_no }" class="notice_title"><c:out value="${list.notice_title }"></c:out></a>
							</td>
							<td>
								<c:out value="관리자"></c:out>
							</td>
							<td>
								<c:out value="${list.notice_readno }"></c:out>
							</td>
						</tr>
					</c:forEach>				
			 </tbody>
		</table>
</div>

<div class="paging">
 <c:if test="${page2.prev }">
		<a href="notice?currPage=${page2.startBlock-1 }" class="prev">
		<c:out value="<<"></c:out></a>
 </c:if>  
	
	<c:forEach var="index" begin="${page2.startBlock }" end="${page2.endBlock }">
		<c:if test="${index==page2.currPage }">
			<span class="curr"><c:out value="${index }"></c:out></span>
		</c:if>
		
		<c:if test="${index!=page2.currPage }">
			<a href="notice?currPage=${index }" class="num">
			<c:out value="${index }"></c:out>
			</a>
		</c:if>
	</c:forEach>
	
	<c:if test="${page2.next }">
		<a href="notice?currPage=${page2.endBlock+1 }" class="next">
			<c:out value=">>"></c:out>
		</a>
		</c:if>
</div>

<div class="btndiv">
<c:if test="${member_id=='admin' }">
	<a href="/noticeinsert" class="btnwrite">글쓰기</a>
</c:if>
</div>

</div>


</body>
</html>