const date = new Date();
const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
const reserveDate = document.querySelector('.reserve_date');
const timewrapper = document.querySelector('.time_wrapper');
let movietime = document.querySelectorAll('.movietime');
const reserveDay = document.querySelector('.reserveDate');
const screenTime = document.querySelector('.screenTime');

const moveSeatForm = document.querySelector('.moveSeatForm');
const moveSeatButton = document.querySelector('.moveSeatButton');
const movieSelector= document.querySelectorAll('.movielist');
const timeSelector= document.querySelectorAll('.movietime');
let selectmovie = document.querySelector('.selectmovie');
const mvlmage = document.createElement('img');

let clickdate=document.querySelector('.clickdate');
let movieListAge = '';
let year = 0;
let month = 0;
document.addEventListener('DOMContentLoaded', () => {
    addDate();
});

let days = date.getDate();

function addDate() {
    const weekOfDay = ['일', '월', '화', '수', '목', '금', '토'];
    year = date.getFullYear();
    month = date.getMonth()+1;

    reserveDate.append(year + '/' + month);
    var j = date.getDay();
    for (i = date.getDate(); i <= lastDay.getDate(); i++) {
    	const button = document.createElement('button');
        const spanWeekOfDay = document.createElement('span');
        const spanDay = document.createElement('span');

        button.classList = 'movie-date-wrapper';
        spanWeekOfDay.classList = 'movie-week-of-day';
        spanDay.classList = 'movie-day';
        button.id=j;spanDay.id=j;spanWeekOfDay.id=j;
        const dayOfWeek =
            weekOfDay[new Date(year + '-' + month + '-' + i).getDay()];

        if (dayOfWeek === '토') {
            spanWeekOfDay.classList.add('saturday');
            spanDay.classList.add('saturday');
        } else if (dayOfWeek === '일') {
            spanWeekOfDay.classList.add('sunday');
            spanDay.classList.add('sunday');
        }
        spanDay.innerHTML = i;
        button.append(spanDay);
        spanWeekOfDay.innerHTML = dayOfWeek;
        button.append(spanWeekOfDay);
        
        reserveDate.append(button);

        dayClickEvent(button);
        if(j>7){
        	button.disabled="disabled";
        	$("#"+j).addClass("disdate");
        	/*$("#"+j).css({
        		"color":"#7d7d7d",
        			"cursor":"auto"
        	});*/
        }
        j++;
    }
   
}


function dayClickEvent(button) {
	
    button.addEventListener('click', function() {
    	$(this).siblings().not(".disdate").css({"background-color":"transparent",
            					"font-weight": "normal",
								"color": "white"});
        const movieDateWrapperActive = document.querySelectorAll(
            '.movie-date-wrapper-active'
        );
        $(this).css({"background-color": "#f1f1f1",
            "font-weight": "bolder",
			"color": "black"});

   	 
        movieDateWrapperActive.forEach(list => {
            list.classList.remove('movie-date-wrapper-active');
        });
        button.classList.add('movie-date-wrapper-active');
       // console.log(button.childNodes[1].innerHTML);
        reserveDay.value =
	            year +'.' + month + '.' + 
	       button.childNodes[0].innerHTML + '(' +
	       button.childNodes[1].innerHTML + ')';
     //   console.log(reserveDay.value);
        clickdate = button.childNodes[0].innerHTML;
     //   console.log(clickdate);
        
        $(".choose_result_date").text(reserveDay.value);
        

    });
   
}

//선택한 날짜(년+월+일+요일+시간)
movietime.forEach(list => {
    list.addEventListener('click', function() {

    	 
        const reserveTimeActive = document.querySelectorAll('.reserve-time-active');
        reserveTimeActive.forEach(li => {
            li.classList.remove('reserve-time-active');
        });
        list.classList.add('reserve-time-active');

        screenTime.value = list.innerHTML;
    });
}); 

//선택한 영화제목 가져오기
movieSelector.forEach(mvlist => {

    mvlist.addEventListener('click', function() {
    	$(this).siblings().css({"background-color":"transparent",
								"font-weight": "normal",
								"color": "white"});
        const selMovie = document.querySelectorAll('.selMovie');
        selMovie.forEach(li => {
            li.classList.remove('selMovie');
        });
        mvlist.classList.add('selMovie');
    	
        selectmovie.value = mvlist.value;
  
        $(".choose_result_title").text("");
        $(this).clone().appendTo(".choose_result_title").css({"text-align":"center",
        		"background-color":"transparent","font-weight": "normal", "color": "white"});
        $(this).css({"background-color": "#f1f1f1",
        "font-weight": "bolder",
        "color": "black"});
    });
    
}); 

//선택한 영화 이미지 가져오기
function mvclick(s) {
	$(".choose_result_img").text("");
    var img = document.createElement('img')
    img.src=s;
    $(".choose_result_img").append(img);
	
}
moveSeatButton.addEventListener('click', function() {
    if (!!reserveDay.value && !!screenTime.value) {
    	let today = new Date();   
    	let selectday = new Date(reserveDay.value+screenTime.value);
    	
    	if(selectday <= today ){
    		alert("이미 지난 시간은 예매 불가능합니다.");
    		
    	}else{
    		moveSeatForm.submit();
    	}

    } else {
    	alert("날짜와 시간을 선택하세요")
    }
});
/*


/*선택한 시간 가져오기*/
timeSelector.forEach(timelist => {

	timelist.addEventListener('click', function() {
		$(this).parent().siblings().children().css({"background-color":"transparent",
			"font-weight": "normal",
			"color": "white"});
	
		$(".choose_result_time").text("");
		$(this).clone().appendTo(".choose_result_time").css({"background-color":"transparent", 
			"font-weight": "normal",  "color": "white"});
	      $(this).css({"background-color": "#f1f1f1",
	          "font-weight": "bolder",
	          "color": "black"});

	});
});

