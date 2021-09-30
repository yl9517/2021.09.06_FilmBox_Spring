<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html> 
<head> 
<title>LOGIN TEST</title> 
<link rel="stylesheet" href="resources/css/login.css">
</head>

<body>
<div class="mid">

				<form action="loginresult" method="post" name="frm" style="width:470px;"> 
				  <h2>FilmBox</h2> 
				  <input type="text" name="member_id" id="member_id" class="w3-input w3-border" placeholder="아이디" spellcheck="false" required>
				   <br>
				    <input type="password" id="member_pwd" name="member_pwd" class="w3-input w3-border" placeholder="비밀번호" spellcheck="false" required> 
				    <br>
				     <input type="submit" value="로그인" id="lsubmit">
				      <br> 
				      </form>

				<!-- 네이버 로그인 창으로 이동 -->
				<div id="naver_id_login" style="text-align: center">
					<a href="${url}"> <img width="223"
						src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" />
					</a>
				</div>

				<!-- 카카오 로그인 창으로 이동 -->
				<div id="kakao_id_login" style="text-align: center">
					<a
						href="kakaologinview">
						<img width="223" height="48.22"
						src="resources\img\kakao_login_medium_wide.png" alt="">
					</a>
				</div>

				<div class="btns">
					<a href="finduserid" class="btn">아이디 찾기</a>
					<a href="finduserpwd" class="btn">비밀번호 찾기</a>
					<a href="join" class="btn">회원가입</a>
				</div>
</div>
</body>
</html>

