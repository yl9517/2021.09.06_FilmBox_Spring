<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources\css\mypointlist.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
<section>
<div class="point_list_wrap">
	
	<div class="point_h">
		<h3><strong>내 포인트 내역</strong></h3>
	</div>
	
	<div class="total_point">
		<div>현재 사용가능 포인트</div>
		<img src="resources\img\reward.png" width="30px" height="30px" class="coin">
		<span><strong>${dto.point }</strong></span>
	</div>
	<div class="ptable-wrap">
		<table class="table table-striped" style="margin: 0 auto; width: 1100px; font-size:18px;">
			<thead>
				<tr><th>일자</th><th>내용</th><th>포인트</th></tr>
			</thead>
			<tbody class="point_detail">
				<c:forEach var="item" items="${pointList }">
					<tr><td>${item.point_date }</td>
						<td>${item.point_content }</td>
						<td class="plus_minus">${item.point }</td></tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
<nav>
<div class="paging-wrap">
	<c:if test="${ppage.prev }">
		<span>
			<a href="mypointlist?currPage=${ppage.startBlock-1 }">
				<span class="material-icons" id="prev">keyboard_double_arrow_left</span>
			</a>
		</span>
	</c:if>
	
	<c:forEach var="index" begin="${ppage.startBlock }" end="${ppage.endBlock }">
		<c:if test="${index==ppage.currPage }">
				<span class="now_page">
					<c:out value="${index }"/>
				</span>
		</c:if>
		<c:if test="${index!=ppage.currPage }">
			<span class="etc_page">
				<a href="mypointlist?currPage=${index }">
					<c:out value="${index }"/>
				</a>
			</span>
		</c:if>
	</c:forEach>
	
	<c:if test="${ppage.next }">
		<span>
			<a href="mypointlist?currPage=${ppage.endBlock+1 }">
				<span class="material-icons" id="next">keyboard_double_arrow_right</span>
			</a>
		</span>
	</c:if>
</div>
</nav>
		<div class="notice">
			<h5>포인트 적립 안내</h5>
			<div class="notice-table-wrap">
			<table class="table table-bordered table-sm">
				<thead class="thead-light">
					<tr>
						<th>구분</th>
						<th>내용</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>회원가입</td>
						<td>일반 회원으로 회원가입시 3000 포인트 적립</td>
						<td></td>
					</tr>
					<tr>
						<td>예매</td>
						<td>영화 예매시 결제 금액의 5% 포인트 적립</td>
						<td>예매 취소시 적립 포인트 회수, 예매시 사용한 포인트 회수</td>
					</tr>
					<tr>
						<td>관람평</td>
						<td>관람평 작성시 500 포인트 적립</td>
						<td>관람평 삭제시 500 포인트 회수</td>
					</tr>
					<tr>
						<td>쿠폰</td>
						<td>쿠폰 구매시 결제 금액의 5% 포인트 적립</td>
					</tr>
				</tbody>
			</table>
				
				<ul class="notice_more">
					<li class="notice_more_h">✻참고하세요✻</li>
					<li>예매 취소는 영화 상영 시작 20분 전까지 가능합니다</li>
					<li>동일 영화 관람평은 1개만 작성 가능합니다</li>
				
				</ul>
			</div>
		</div>
</div>

</section>
<script src="resources\js\mypointlist.js"></script>
</body>
</html>