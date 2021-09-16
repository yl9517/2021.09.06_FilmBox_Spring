<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<c:forEach var="item" items="${mvList }">
			<li>
				<p>순위 : ${item.rank }</p>
				<p>영화 코드 : ${item.movieCd }</p>
				<p>영화명 : ${item.movieNm }</p>
				<p>개봉일 :${item.openDt }</p>
				<p><img alt="영화포스터" src="${item.image }"></p>
			</li>
		</c:forEach>
	</ul>
</body>
</html>