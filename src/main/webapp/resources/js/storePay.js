//let last_price = $('.price_final').text();
let before_price = $('.before_price').text();
let after_price = $('.price_final').text(before_price);


let product_name = $('.product_name').text();
console.log(before_price);
console.log(product_name);
$('.reset-button').click(function() {
	location.href="/store"
});
/* 쿠폰 금액 크면 disable*/

let arr = [];
$.each($('#coupons').find("option"), function(index,item){ 
  arr.push(item.value);
  if(before_price < item.value){
	  $(this).attr("disabled",true);
	  $(this).css("color","#D7D7D7");
  }
});


/*쿠폰*/
$('#coupons').on('change',function() {
	let coupon_price =$('#coupons option:selected').val();
	$('.sale').text(coupon_price);
	if(parseInt(before_price) >= parseInt(coupon_price)){
		after_price = parseInt(before_price)-parseInt(coupon_price);
		$('.price_final').text(after_price);
	}else{
		alert('상품 금액보다 큰 금액의 쿠폰은 사용이 불가합니다.');
		$('.sale').text(0);
		after_price = $('.price_final').text(before_price);
	}
});




/* 결제 */
$('.pay-button').click(function() {
	let IMP = window.IMP;
	IMP.init('imp06185701');
	IMP.request_pay({
		pg : 'kakaopay',
        pay_method : 'card',
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : product_name,
		amount : before_price
	}, function(rsp) {
		if ( rsp.success ) {
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
			
			document.final.submit();
			//location.href="/storepaydone"
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			alert(msg);
		}
	});
});