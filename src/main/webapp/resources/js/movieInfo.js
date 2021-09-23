/* 버튼 활성화 */
$('.tab_wrap').children().click(function() {	
	$(this).addClass('act');	
	$(this).siblings().removeClass('act');
});

/* 줄거리 <br> 추가 */
function replaceAll(str) {
	let result1 = str.split(".").join(". <br>"); 
	    result1 = result1.split("!").join("! <br>"); 
	
	/*  ... 같은거 있으면 붙여주기  */
	
	while(result1.indexOf(". <br>. <br>") !== -1){ 
		result1 = result1.split(". <br>. <br>").join(".."); 
	}
	return result1;
}

/*영화 정보*/
if($('.first_btn').hasClass('act')){
	let movieCd = $('#mvCd').val();
	$.ajax({
		url : "/content"
		, data : {'movieCd': movieCd}
		, method : 'get'
		, dataType:'json'
		,success:function(data) {
				let movEn = data.movieNmEn;
				$('#mvEn').append(movEn);
				
		         let resultt =  "<tr>";
	              resultt += "<th>장르</th>"
	              resultt += "<td>"+data.genres+"</td>"
	              resultt += "<th>상영시간</th>"
	              resultt += "<td>"+data.showTm+"</td>"
	              resultt += "</tr>";
	               
	              resultt += "<tr>";
	              resultt += "<th>등급</th>"
	              resultt += "<td>"+data.audits+"</td>"
	              resultt += "<th>개봉일</th>"
	              resultt += "<td>"+data.openDt+"</td>"
	              resultt += "</tr>";
	               
	              resultt += "<tr>";
	              resultt += "<th>감독</th>"
	              resultt += "<td colspan='3'>"+data.directors+"</td>"
	              resultt += "</tr>";
	              
	              resultt += "<tr>";
	              resultt += "<th>출연진</th>"
	              resultt += "<td colspan='3'>"+data.actors+"</td>"
	              resultt += "</tr>";
	               	              
				$("#content").append(resultt);
				
				let replace_text = replaceAll(data.plotText,".",". <br>")
				$(".rgyPostIt").append(replace_text);
		}
		,error:function(data){
			console.log(data);
		}
	});
}