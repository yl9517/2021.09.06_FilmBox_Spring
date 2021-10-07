let store_no = $('#product_no').val();

let initPrice = $('#product_price').val(); //원가
//.replace(",",""); 

// 수량,가격변동
function count(type)  {

  let number = $('#product_count').val();
  let price = $('#product_price').val(); //변동값

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
  $('#product_count').val(number);
  $('#product_price').val(price);
 
}

//결제
$('.pay-button').click(function() {
	document.receipt.submit();
});