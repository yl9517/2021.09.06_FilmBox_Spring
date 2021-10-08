/**
 * 
 */
function delModal(product_no)
{
	console.log("상품번호"+product_no);
	$("#productDelModal").modal('show');
	
		$('#confirm').click(function(){
			location.href="productDelete/"+product_no;
		});
}