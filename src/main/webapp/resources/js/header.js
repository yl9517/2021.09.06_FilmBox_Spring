function press(f){
	if(f.keyCode == 13){ //엔터키
		searchBox.submit(); 
	}
}

$('.searchSubmit').click(function() {
	searchBox.submit(); 
});

//로고 선택 시 
$('.logo').click(function() {
	location.href="/";
});