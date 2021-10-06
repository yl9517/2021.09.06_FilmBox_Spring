/**
 * 
 */
//회원정보수정
function accessCheck()
{
	let login_type=document.getElementById("login_type").innerText;
	
	if(login_type=="SNS") 
		alert("일반회원만 수정 가능합니다");
	else 
		location.href="myinfo";
}
//내 포인트내역 페이지 이동 버튼
function pointList()
{
	location.href="mypointlist";
}

//회원탈퇴
$("#deluser").on('click', function(){
	$("#exampleModal").modal();
});

//'예매취소는 상영시작 20분 전까지!' 툴팁
$('[data-toggle2="tooltip"]').tooltip();

//QR click 툴팁
$('[data-toggle3="tooltip"]').tooltip();

//유의사항 팝오버
$('#alarm').popover();

//상영시간
function checkTime(p_time, p_date, p_rev_no)
{
	//날짜 format 맞추기
	let date_ex_day = p_date.split("(");	//요일 자르기
	console.log(date_ex_day);
	
	//년도/월/일
	let show_date = date_ex_day[0].split(".");
	let show_date_year = show_date[0];	//년도
	let show_date_month = show_date[1]-1;	//월
	let show_date_day = show_date[2]; 	//일
	
	//시/분/초
	let show_time = p_time.split(":");
	let show_time_hours = show_time[0];		//시
	let show_time_minutes = show_time[1];	//분
	let show_time_seconds = show_time[2];	//초
	
	//상영시간  Date로 만들기
	let movie_date = new Date(show_date_year, show_date_month, show_date_day, show_time_hours, show_time_minutes, show_time_seconds);
	
	let today = new Date();
	let gap = movie_date.getTime()-today.getTime();
	let min_gap = gap/1000/60;
	console.log(min_gap);
	console.log("예약번호: "+p_rev_no);
	
	if(min_gap<20)
	{
		alert("예매취소는 상영시작 20분 전까지 가능합니다");
	}
	else 
	{
		cancelModal(p_rev_no);
	}
}

//예매 취소 modal
function cancelModal(rev_no)
{
	console.log("예약번호"+rev_no);
	$("#rsvCancelModal").modal('show');
	
		$('#confirm').click(function(){
			$.ajax({
				url: "/rsvcancel",
				type: 'post',
				cache: false,
				data: {rev_no: rev_no},
				success: function(data)
				{
					location.href="mypage";
				}
				, error: function(request, error)
				{
					console.log("code"+request.status+"\n"+"msg"+request.responseText+"\n"+"error"+error);
				}
		
			});
		});
}

//let formm = document.forms;
//console.log(formm[1]);
//console.log(formm[2]);
//for(let i=1; i<formm.length; i++)
//{
//	formm[i].name += 'revInfo' + i
//}

//예약정보 보내기
function goData() {
	let target =  'pop';
	window.open('' , target,'width=340px, height=340px');
	
	let form = document.rev_test;
	form.action = '/showQR';
	form.target = target;
	form.submit();
}
