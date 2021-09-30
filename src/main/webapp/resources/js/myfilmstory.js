/**
 * 
 */

//let json = document.getElementById('j').innerText;
//let p = JSON.parse(json);
//console.log(json);
//console.log(p);


//tooltip
$('[data-toggle="tooltip"]').tooltip();


//더보기 누르기 전 스토리 숨기기
let watched_movie = document.getElementsByClassName("movie_info");

for(let i=0; i<watched_movie.length; i++)
{
	if(i>2)
	{
		watched_movie[i].style.display="none";
	}
}
//더보기 누르면 스토리 보여주기+ 더보기 버튼 삭제
let more_movie = document.getElementById("more_movie");

function showMore()
{
	for(let i=0; i<watched_movie.length; i++)
	{
		if(i>2)
		{
			watched_movie[i].style.display="flex";
			more_movie.remove();
		}	
	}
}
//스토리가 3개 이하일때 더보기 안보이게
if(watched_movie.length<=3)
{
	more_movie.remove();
}

//관람평 쓰기 버튼 누른 영화 -> 영화 제목 모달창에 불러오기
function sendTitle(param)
{
	console.log(param);
	let title = param;
	let titleTxt = document.createTextNode(title);
	$('.tit').empty();
	$('.tit').append(titleTxt);
}


/* 리뷰창 */
$('#review_write').hide();
$('.loginInfo').hide();
$('#review_window').click(function() {
	if(member_id == null || member_id ==''){ //로그인하시오
		$('.loginInfo').show();
	}
	else if(rev_no == null || rev_no == 0){ //예매하시오
		alert('관람평을 실관람 이후 작성 가능합니다.')
	}
	else{ //관람평 작성
		$('#review_write').css('box-shadow','rgba(0,0,0,0.8) 0 0 0 9999px');
		$('#review_write').show();
	}
});

/* 수정버튼 눌렀을때 리뷰 창 */
//$('#modifyBtn').click(function() {
//	
//	$('#review_write').attr('action','../reviewModifyAction');
//	$.ajax({
//		url : "/getThisReview"
//		, data : {'movieCd': movieCd , 'member_id': member_id}
//		, method : 'get'
//		,success:function(data) {			
//			$('#review_content').append(data.review_content);
//            $('#review_starpoint').val(data.review_starpoint);
//            $("input[type=radio][value="+data.review_starpoint+"]").attr('checked','checked');
//		}
//		,error:function(data){
//			console.log(data);
//		}
//	});
//	$('#review_write').css('box-shadow','rgba(0,0,0,0.8) 0 0 0 9999px');
//	$('#review_write').show();
//});
/* 삭제버튼 눌렀을때 confirm창 */

//$('#deleteBtn').click(function() {
//	if(confirm("댓글을 삭제하시겠습니까?")){		  		  
// 		 location.href="../reviewDeleteAction/"+movieCd;
//	}else{
//		return;	
//	}
//});

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
