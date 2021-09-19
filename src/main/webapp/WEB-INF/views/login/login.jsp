<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">


<html> 
<head> 
<title>LOGIN TEST</title> 
</head>

<body>
<h1>FilmBox</h1>
<hr>
<br>


	<center>
		<c:choose>
			<c:when test="${sessionId != null}">
				<h2>네이버 아이디 로그인 성공하셨습니다!!</h2>
				<h3>'${sessionId}' 님 환영합니다!</h3>
				<h3>
					<a href="logout">로그아웃</a>
				</h3>
			</c:when>
			<c:when test="${member_id !=null }">
				<h2>카카오 계정으로 로그인 성공하셨습니다!!</h2>
				<h3>'${member_name}' 님 환영합니다!</h3>
				<h3>
					<a href="kakaologout">로그아웃</a>
				</h3>
			</c:when>

			<c:otherwise>
				<form action="login.userdo" method="post" name="frm"
					style="width: 470px;">
					<h2>로그인</h2>
					<input type="text" name="id" id="id" class="w3-input w3-border"
						placeholder="아이디" value="${id}"> <br> <input
						type="password" id="pwd" name="pwd" class="w3-input w3-border"
						placeholder="비밀번호"> <br> <input type="submit"
						value="로그인" onclick="#"> <br>
				</form>
				<br>

				<!-- 네이버 로그인 창으로 이동 -->
				<div id="naver_id_login" style="text-align: center">
					<a href="${url}"> <img width="223"
						src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" />
					</a>
				</div>

				<!-- 카카오 로그인 창으로 이동 -->
				<div id="kakao_id_login" style="text-align: center">
					<a
						href="https://kauth.kakao.com/oauth/authorize?client_id=3ea0a4c7321aaef0c7c905c5d4ec6413&redirect_uri=http://localhost:8080/filmbox/kakaologin&response_type=code">
						<img width="223" height="48.22"
						src="resources\img\kakao_login_medium_wide.png" alt="">
					</a>
				</div>


			</c:otherwise>
		</c:choose>
	</center>
	<a href="userJoin">회원가입</a>
</body>
</html>
