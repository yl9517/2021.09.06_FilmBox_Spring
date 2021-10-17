/**
 * 
 */

$('#toggle-event').change(function() {
  if($(this).prop('checked') == true)
  {
	  location.href="productList";
  }  
});

$('.coupon').hide();

/* 버튼 활성화 */
$('.tab_wrap').children().click(function() {	
	$(this).addClass('act');	
	$(this).siblings().removeClass('act');
	
	let catename = $(this).text().toLowerCase();

	$('.'+catename).show();
	$('.'+catename).siblings("ul").hide();

});