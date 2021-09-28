/**
 * 
 */
//let num="";
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
//		num=$('#myreserve_num').text();
//		title=$('#movie_title').text();
//		date=$('#myreserve_date').text();
//		seat=$('#myreserve_seat').text();
//	}else {
//		num=$('#myreserve_num2').text();
//		title=$('#movie_title2').text();
//		date=$('#myreserve_date2').text();
//		seat=$('#myreserve_seat2').text();
//	}
//	console.log(num);
//
//	//데이터 전송
//	$.ajax({
//		url: "qrtest"
//			, method: "POST"
//				, data : JSON.stringify({
//					"reserve_num" : num
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

function accessCheck()
{
	let login_type=document.getElementById("login_type").innerText;
	console.log(login_type);
	
	if(login_type=="SNS"){
		alert("일반회원만 수정 가능합니다");
	}else{
		location.href="myinfo";
	}
}

function pointList()
{
	location.href="mypointlist";
}
