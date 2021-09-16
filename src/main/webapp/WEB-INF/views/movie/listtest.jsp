<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>안녕하세요</h1>
	
	<h2>박스오피스1</h2>
	<ul id="result">
	</ul>
	<div id="imgResult"></div>

		<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>		
	
	<script>
		$.ajax({
			method : "GET",
			url : "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key=03778b8e03b2f65d0d2c724260f2df8c&targetDt=20210901",
			data : {
				weekGb : "0"
			}
		}).done(function(msg) {
			let resultt ="";
			for(let i=0; i<10; i++){
				let short_url = msg.boxOfficeResult.weeklyBoxOfficeList[i];
				
				resultt += "<li> ";
				resultt += "<a href='/imageView/"+short_url.movieCd+"/"+short_url.movieNm+"'> ";
				
				resultt += "<b>"+i+"</b>"
				resultt += "<b class='movieCd'>영화 코드 : "+short_url.movieCd+"</b><br>"
				resultt += "<b class='title'>영화 제목 : "+short_url.movieNm+"</b>"
				resultt += "<p>개봉일 : "+short_url.openDt+"</p>"
				resultt += "<p>일일 관객 수 : "+short_url.audiCnt+"</p>"

				resultt += "</a></li>"
				
	/* 				$(body).trigger(function() {
						$.ajax({
							url : "/imageList/"+short_url.movieNm
							, dataType : "json"
							, method: "GET"
							, success : function(data) {
								let e = "<div>"
									e +="<img alt='영화포스터' src='"+data+"'"
									e +="</div>"
								$(e).appendTo('#imgResult');
							
							}
							, error:function(data){
								console.log('error'+data);	
							}
								
								
							
						});
					});
 */

			}
			$("#result").append(resultt);
		});
	</script>
	<script>
	$('#title').bind('click', function() { 
		console.log($('#title').val()); 		
	});
	$('#title').trigger('click');

	</script>

</body>
</html>