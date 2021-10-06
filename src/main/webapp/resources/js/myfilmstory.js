/**
 * 
 */
//'500P 적립' 툴팁
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



/* 리뷰창 */
$('#review_write').hide();

/*member_id 받아오기*/
let member_id = $('#member_id').val();

//영화 제목 모달창에 불러오기
function sendTitle(movieNm)
{
	let title = "";
	title = movieNm;
	let titleTxt = document.createTextNode(title);
	$('.tit').empty();
	$('.tit').append(titleTxt);
}

/* 관람평 쓰기 창 */
function insertReview(movieNm, rev_condition)
{
	//리뷰 내용, 별점 비우기, 제목 불러오기
	$('#review_content').val("");
	$('#review_starpoint').val(0);
	//별 체크 초기화
	$("input[type=radio]").removeAttr('checked');
	//modal 창 보여주기
	$('.confirm_modify').hide();
	$('.confirm').show();
	$('#review_write').css('box-shadow','rgba(0,0,0,0.8) 0 0 0 9999px');
	$('#review_write').show();

	sendTitle(movieNm);
}
/*등록버튼 눌렀을 때 insert*/
function review_insert(movieCd, rev_no)
{
	$('.confirm').on('click', function(){
	
		let review_content =  $('#review_content').val();
		let review_starpoint =  $('#review_starpoint').val();
		
		let result = checkStar(review_content, review_starpoint);
		console.log(result);
		if(result == false)
		{
			alert("다시 입력해주세요");
		}else {
			$.ajax({
				url: "/reviewInsertAction",
				type: 'post',
				cache: false,
				data: {'rev_no': rev_no
					, 'movieCd': movieCd
					, 'review_content': review_content
					, 'review_starpoint': review_starpoint }
				, success: function(data)
				{
					location.href="myfilmstory";
				}
				, error: function(request, error)
				{
					console.log("code"+request.status+"\n"+"msg"+request.responseText+"\n"+"error"+error);
				}
	
			});
		}
		
	});
}

/* 수정버튼 눌렀을때 기존 댓글 내용 보여주는 창 */
function r_modify_modal(movieCd, movieNm)
{
	//제목 불러오기
	sendTitle(movieNm);

	//기존 댓글 내용 불러오기
	$.ajax({
		url : "/getThisReview"
		, data : {'movieCd': movieCd , 'member_id': member_id}
		, method : 'get'
		,success:function(data) {
			$('#review_content').val("");
			$('#review_content').val(data.review_content);
			$('#review_starpoint').val("");
			$('#review_starpoint').val(data.review_starpoint);
            $("input[type=radio][value="+data.review_starpoint+"]").attr('checked','checked');
		}
		,error:function(data){
			console.log(data);
		}
	});
	$('.confirm').hide();
	$('.confirm_modify').show();
	$('#review_write').css('box-shadow','rgba(0,0,0,0.8) 0 0 0 9999px');
	$('#review_write').show();
	
	
}

/* 수정버튼 눌렀을때 modify */
function review_modify(movieCd){
	
	$('.confirm_modify').on('click', function(){
		
		let review_content =  $('#review_content').val();
		let review_starpoint =  $('#review_starpoint').val();
		//별 체크
		let result = checkStar(review_content, review_starpoint);
		if(result == false)
		{
			alert("다시 입력해주세요");
		}
		else {

			//수정내용 보내기
			$.ajax({
				url : "/reviewModifyAction"
				, data : {'movieCd': movieCd
						, 'member_id': member_id
						, 'review_content': review_content
						, 'review_starpoint': review_starpoint }
				, method : 'post'
				, success: function(data)
				{
					location.href="myfilmstory";
				}
				, error: function(request, error)
				{
					console.log("code"+request.status+"\n"+"msg"+request.responseText+"\n"+"error"+error);
				}
			});
		}
		
		
	});
}

/* 삭제버튼 눌렀을때 confirm창 */
function r_del_modal(p_movieCd)
{
	let movieCd = p_movieCd;
	if(confirm("댓글을 삭제하시겠습니까?")){		  		  
	 		location.href="../reviewDeleteAction2/"+movieCd;
	}else{
		return;	
	}
}

/* 리뷰 별점 */
$('[id^=rate]').click(function() {

	$('#review_starpoint').empty();
		
	let star =  $(this).val();
	$('#review_starpoint').val(star);
});


/* 전송 전 리뷰 별점 선택 확인 = 0점이면 false*/	
function checkStar(review_content, review_starpoint) {

	if(review_content.length <5){
		$('.alarm').empty();
		$('.alarm').append('관람평을 최소 5글자 이상 입력해주세요. ');
		return false;
	}
	
	if(review_starpoint == 0 || review_starpoint ==null){
		$('.alarm').empty();
		$('.alarm').append('이 영화에 대한 별점을 선택해주세요. ');
		return false;
	}
}

/* 리뷰창 닫기 */
$('.reset').click(function() {

	$('#review_write').hide();
	$('#review_write').css('box-shadow','');
	$('.confirm_modify').off('click');
	$('.confirm').off('click');
});
