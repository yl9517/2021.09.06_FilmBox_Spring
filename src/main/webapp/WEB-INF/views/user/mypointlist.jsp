<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources\css\mypointlist.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
	
</div>

</section>
<script src="resources\js\mypointlist.js"></script>
</body>
</html>