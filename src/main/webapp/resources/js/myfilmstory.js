/**
 * 
 */
//tooltip
$('[data-toggle="tooltip"]').tooltip();


//더보기 누르기 전 숨기기
let watched_movie = document.getElementsByClassName("movie_info");

for(let i=0; i<watched_movie.length; i++)
{
	if(i>2)
	{
		watched_movie[i].style.display="none";
	}
}
//더보기 보여주기+삭제
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
$('[id="review_window"]').click(function() {
	$('#review_write').css('box-shadow','rgba(0,0,0,0.8) 0 0 0 9999px');
	$('#review_write').show();
});
$('.reset').click(function() {
	$('#review_write').hide();
	$('#review_write').css('box-shadow','');
});

/* 리뷰 별점 */
$('[id^=rate]').click(function() {

	$('.star').empty();
	
	let star =  $(this).val();
	$('.star').append(star);
});
