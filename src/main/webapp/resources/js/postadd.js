
const write_btn = document.querySelector('.write_btn');
const postform = document.querySelector('.form');
write_btn.addEventListener('click', function() {
	var fileCheck = document.getElementById("image").value;
	if(!fileCheck){
        alert("파일을 첨부해 주세요");
    }else{
    	postform.submit();
    }
    
});

    
