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
//내 포인트내역 버튼
function pointList()
{
	location.href="mypointlist";
}

//회원탈퇴
$("#deluser").on('click', function(){
	$("#exampleModal").modal();
});


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


