let movieCd = $('#movieCd').val();
let member_id = $('#member_id').val();
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

/* 리뷰창 */
$('#review_write').hide();
$('#review_window').click(function() {
	$('#review_write').css('box-shadow','rgba(0,0,0,0.8) 0 0 0 9999px');
	$('#review_write').show();
});

/* 수정버튼 눌렀을때 리뷰 창 */
$('#modifyBtn').click(function() {
	$('#review_write').attr('action','../reviewModifyAction');
	$.ajax({
		url : "/getThisReview"
		, data : {'movieCd': movieCd , 'member_id': member_id}
		, method : 'get'
		,success:function(data) {			
			$('#review_content').append(data.review_content);
            $('#review_starpoint').val(data.review_starpoint);
            $("input[type=radio][value="+data.review_starpoint+"]").attr('checked','checked');
		}
		,error:function(data){
			console.log(data);
		}
	});
	$('#review_write').css('box-shadow','rgba(0,0,0,0.8) 0 0 0 9999px');
	$('#review_write').show();
});

/* 리뷰창 닫기 */
$('.reset').click(function() {
	$('#review_write').hide();
	$('#review_write').css('box-shadow','');
});


/* 리뷰 별점 */
$('[id^=rate]').click(function() {

	$('#review_starpoint').empty();
	
	let star =  $(this).val();
	$('#review_starpoint').val(star);
});
	
/* 전송 전 리뷰 별점 선택 확인 = 0점이면 false*/	
function checkStar() {

	let content =  $('#review_content').val();	
	if(content.length <5){
		$('.alarm').empty();
		$('.alarm').append('관람평을 최소 5글자 이상 입력해주세요. ');
		return false;
	}
	
	let starval =  $('#review_starpoint').val();
	if(starval == 0 || starval ==null){
		$('.alarm').empty();
		$('.alarm').append('이 영화에 대한 별점을 선택해주세요. ');
		return false;
	}
} 

$('.etc').hide();
$('.moreBtn').click(function() {
	$(this).next().toggle();
});
  