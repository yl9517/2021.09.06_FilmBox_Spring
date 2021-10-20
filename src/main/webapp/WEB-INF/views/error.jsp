<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/error.css">
</head>
<body>
	<div id="error_wrap">
		<img alt="error" src="/resources/img/error.png">
		
		<h1>이용에 불편을 드려 죄송합니다.</h1>
		<div class="error_explain">
			<p> 방문하시려는 웹 페이지의 주소가 잘못 입력되었거나 변경 또는 삭제되어 요청하신 페이지를 찾을수 없습니다.</p>
			<p> 입력하신 주소가 정확한지 다시 한 번 확인해 주시기 바랍니다. 감사합니다.</p>
		</div>
		<button type="button" class="gobefore"> 이전 페이지로 이동 </button>
		<button type="button" class="gomain"> FILM BOX 메인으로 이동 </button>
	</div>
	
	<script>
		$(".gobefore").click(function() {
			history.go(-1);
		});
		$(".gomain").click(function() {
			location.href="/";
		});
	</script>
</body>
</html>