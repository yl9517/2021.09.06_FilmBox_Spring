/**
 * 
 */
function delModal(product_no)
{
	$("#productDelModal").modal('show');
	
		$('#confirm').click(function(){
			location.href="productDelete/"+product_no;
		});
}