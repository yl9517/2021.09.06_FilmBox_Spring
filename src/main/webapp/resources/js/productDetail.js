/**
 * 
 */
//수정버튼 눌렀을 때 수정페이지
$('#update').click(function(){
	
	let product_no = document.getElementById('product_no').innerText;
	console.log(product_no);
	//location.href="productUpdate/"
});

//삭제버튼 눌렀을 때 삭제
$('#delete').click(function(){
	
	let product_no = document.getElementById('product_no').val;
	console.log(product_no);
	//location.href="productUpdate/"
});