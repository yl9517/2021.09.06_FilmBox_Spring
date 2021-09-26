/**
 * 
 */
/*function openPopup(){
	let popup 
	= window.open('http://www.naver.com'
					, '네이버팝업'
					,'width=300px, height=300px');
}*/

function pointList(){
	location.href="mypointlist";
}

$('#qr1').click(function(){
	let num=$('#myreserve_num1').text();
	let title=$('#movie_title1').text();
	let date=$('#myreserve_date1').text();
	let seat=$('#myreserve_seat1').text();
	//데이터 전송
	$.ajax({
		url: "qrtest"
		, method: "POST"
		, data : JSON.stringify({
			reserve_num : num
			, reserve_title : title
			, reserve_date : date
			, reserve_seat : seat
		})
		, dataType : 'text'
		, contentType : "application/json;charset=utf-8"
		, success: function(data)
		{
			console.log(data);
			location.href="qrtestresult";
		}
		, error:function(request, error){
            console.log("code"+request.status+"\n"+"msg"+request.responseText+"\n"+"error"+error);
        }
	});
});
$('#qr2').click(function(){
	let num=$('#myreserve_num2').text();
	let title=$('#movie_title2').text();
	let date=$('#myreserve_date2').text();
	let seat=$('#myreserve_seat2').text();
	console.log(title);
	console.log(date);
	console.log(seat);
});