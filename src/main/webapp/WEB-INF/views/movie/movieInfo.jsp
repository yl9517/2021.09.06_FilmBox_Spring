<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>


	<h2>영화상세</h2>	
	<img alt="영화 포스터" src="${dto.image }">
	<input type="text" id="movieCd" value="${dto.movieCd }"> 
	
	<div>
	<p>여기다!!-------java-----</p>
	영화명 : ${movieInfo.movieNm }
	${movieInfo.showTm }
	${movieInfo.openDt }
	배우 :
	<c:forEach var="item" items="${movieInfo.acts }" >
			${item }
	</c:forEach>
	
 	<p>------위!-------!</p>
	</div>
	<div id="result2">
	
	</div>
	
	<script>
		let movie = $('#movieCd').val();
		console.log(movie);
		$.ajax({
			method : "GET",
			url : "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=${key}&movieCd=${dto.movieCd}",
				
		}).done(function(msg) {
			let resultt = "";
			let short_url = msg.movieInfoResult.movieInfo;
				resultt += "<b>영화 제목 : "+short_url.movieNm+"</b>"
				resultt += "<p>영화명 영문: "+short_url.movieNmEn	+"</p>"
				resultt += "<p>제작국가명: "+short_url.nationNm+"</p>"
				resultt += "<p>제작연도: "+short_url.prdtYear+"</p>"
				resultt += "<p>개봉일자: "+short_url.openDt+"</p>"
				resultt += "<p>상영시간 : "+short_url.showTm+"</p>"
				resultt += "<p>영화유형명 : "+short_url.typeNm+"</p>"
				resultt += "<p>장르명 : "+short_url.genreNm+"</p>"
				resultt += "<p>감독: "+short_url.directors+"</p>"
				resultt += "<p>감독명: "+short_url.peopleNm+"</p>"
				
			let acts = short_url.actors;
				 for(let i=0; i<acts.length; i++){
					 resultt += "<i>dd"+acts[i]['peopleNm']+"</i>";
				}  
				/* acts.each(function(index, item) {
					resultt += "<i>dd"+$(item.peopleNm)+"<i>";
				})  */
				
				resultt += "<p>배우 : "+short_url.actors[0]['peopleNm']+"</p>"
				resultt += "<p>배우명: "+short_url.peopleNm+"</p>"
				console.log(short_url.actors[0]);
				resultt += "<p>배역: "+short_url.cast+"</p>"
				resultt += "<p>상영형태: "+short_url.showTypes+"</p>"
				resultt += "<p>상영형태: "+short_url.showTypeGroupNm+"</p>"
				resultt += "<p>관람등급: "+short_url.watchGradeNm+"</p>"
				resultt += "<p>심의정보: "+short_url.audits[0]['watchGradeNm']+"</p>"
				resultt += "<p>스텝: "+short_url.staffs+"</p>"
				
			$("#result2").append(resultt);
		});
	</script> 
</body>
</html>