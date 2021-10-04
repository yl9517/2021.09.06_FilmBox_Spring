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



setInterval(() => {
	let today = new Date();
}, 60000);

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
	
	//qr 관련 
//let rsv_no="";
//let title="";
//let date="";
//let seat="";
//function openPop(param){
//	let popup 
//	= window.open("/showQR"
//			, '팝업'
//			,'width=350px, height=350px');
//
//	console.log(param.getAttribute("id"));
//
//	if(param.getAttribute("id")=="qr1"){
//		rsv_no=$('#rsv_no1').text();
//		title=$('#title').text();
//		date=$('#date').text();
//		seat=$('#seat').text();
//	}else {
//		rsv_no=$('#rsv_no2').text();
//		title=$('#title2').text();
//		date=$('#date2').text();
//		seat=$('#seat2').text();
//	}
//	console.log(num);
//
//	//데이터 전송
//	$.ajax({
//		url: "qrtest"
//			, method: "POST"
//				, data : JSON.stringify({
//					"reserve_num" : rsv_no
//					, "reserve_title" : title
//					, "reserve_date" : date
//					, "reserve_seat" : seat
//				})
//				, dataType : 'text'
//					, cache : false
//					, contentType : "application/json;charset=utf-8"
//						, success: function(data)
//						{
//							//console.log(data);
//						}
//	, error:function(request, error)
//	{
//		console.log("code"+request.status+"\n"+"msg"+request.responseText+"\n"+"error"+error);
//	}
//	});
//}


