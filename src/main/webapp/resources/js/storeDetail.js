let store_no = $('#product_no').val();

let initPrice = $('#sumMoney').text(); //원가
//initPrice.replace(",","");

// 수량,가격변동
function count(type)  {

  let number = $('#proCount').val();
  let price = $('#sumMoney').text(); //변동값

  if(type === 'plus') {
    number = parseInt(number) + 1;
    price = parseInt(price)+parseInt(initPrice);
    
  }else if(type === 'minus')  {
	 if(number > 1){
		 number = parseInt(number) - 1;
		 price = parseInt(price)-parseInt(initPrice);
	 }
  }
  
  // 결과 출력
  $('#proCount').val(number);
  $('#sumMoney').text(price);
}

//결제
$('.pay-button').click(function() {
	location.href="/storepay/"+store_no
});
