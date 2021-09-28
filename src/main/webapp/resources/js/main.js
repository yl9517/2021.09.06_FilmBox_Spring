function press(f){
	if(f.keyCode == 13){ //엔터키
		searchBox.submit(); 
	}
}

$('.searchSubmit').click(function() {
	searchBox.submit(); 
});
