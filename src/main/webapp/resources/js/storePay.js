let last_price = $('.price_final').text();
let product_name = $('.product_name').text();
console.log(last_price);
console.log(product_name);
$('.reset-button').click(function() {
	location.href="/store"
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
		amount : last_price
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