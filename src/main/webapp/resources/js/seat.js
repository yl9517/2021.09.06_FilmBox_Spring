
let selectedSeatsArray = new Array();
const seatWrapper = document.querySelector('.seat-wrapper');
let clicked = '';
let div = '';
let seat = document.querySelectorAll('.seat');
const selectedSeats = document.querySelector('.selected-seats');
const allSeat = document.querySelector('.all-seats');
const remainSeat = document.querySelector('.remain-seats');
const reserveNumber = document.querySelector('.reserve-number');
const selectSeatListNormal = document.querySelectorAll(
    '.select-seat-ul-normal li'
);
const selectSeatListTeen = document.querySelectorAll('.select-seat-ul-teen li');
const selectSeatListOld = document.querySelectorAll('.select-seat-ul-old li');
let selectSeatListUlActive = '';
let normalNumber = 0;
let teenNumber = 0;
let oldNumber = 0;
let allNumber = 0;
let prevNumber = 0;
let normalMoney = 0;
let teenMoney = 0;
let oldMoney = 0;
let allMoney = 0;

const selectNumberNormal = document.querySelectorAll('.select-number-normal');
const selectNumberTeen = document.querySelectorAll('.select-number-teen');
const selectNumberOld = document.querySelectorAll('.select-number-old');

//예약 관련
const selectedMovie = document.querySelector('.selected-movie');
const selectedTheaterPlaceInfo = document.querySelectorAll(
    '.selected-theater-place-info'
);
const theaterTime = document.querySelector('.theater-time');
const theaterDate = document.querySelector('.theater-date');
const ticketPrice = document.querySelector('.ticket-price');
const payMoney = document.querySelector('.payMoney');

const seatForm = document.querySelector('.seatForm');
const reserveButton = document.querySelector('.reserve-button');
const title = document.querySelector('.title');
const selectedTheater = document.querySelector('.selectedTheater');

const reserveDate = document.querySelector('.reserveDate');

const runningTime = document.querySelector('.runningTime');
const ticketNumber = document.querySelector('.ticketNumber');
var selectedSeat =[];
selectedSeat = document.querySelector('.selectedSeat');

const movieNm = document.querySelector('.movieNm');
const movieCd = document.querySelector('.movieCd');
const screenTime = document.querySelector('.screenTime');
const ousepoint = document.querySelector('.ousepoint');
let arrays = [];
$('.thiss').each(function(index,item){
  arrays.push($(item).text());
});

/* 금액 초기화*/
let firstprice = $('.ticket-price').text();
let usepoint = $('#usePoint').val();
let havepoint = $(".havePoint").val();

toastr.options = {
    positionClass: 'toast-top-right',
    progressBar: true,
    timeOut: 1000,
    preventDuplicates: true,
};

//버튼클릭시 다른 class 추가 초기화해주기
function selectSeatList(list) {
    allNumber = 0;
    allMoney = 0;
    list.forEach(li => {
        //클릭시에 다른 class초기화해주기
        initList(list, li);
    });
}

function initList(list, li) {
    li.addEventListener('click', function() {
        list.forEach(li => {
            li.classList.remove('select-seat-ul-active');
        });
        li.classList.add('select-seat-ul-active');
        selectSeatListUlActive = document.querySelectorAll(
            '.select-seat-ul-active'
        );
        selectListUiFunction(selectSeatListUlActive);
    });
}

function selectListUiFunction(selectSeatListUlActive) {
    selectSeatListUlActive.forEach(li => {
        if (li.parentNode.classList.contains('select-seat-ul-normal')) {
            normalNumber = Number(li.innerHTML);
            normalMoney = 11000 * normalNumber;
            allMoney = normalMoney + teenMoney + oldMoney;
            allNumber = normalNumber + teenNumber + oldNumber;
            ticketPrice.innerHTML = allMoney + '원';
            if (allNumber > 16) {
                li.classList.remove('select-seat-ul-active');
                allMoney -= normalMoney;
                allNumber = allNumber - normalNumber;

                selectNumberNormal[0].classList.add('select-seat-ul-active');
                ticketPrice.innerHTML = allMoney + '원';
            }
        } else if (li.parentNode.classList.contains('select-seat-ul-teen')) {
            teenNumber = Number(li.innerHTML);
            teenMoney = 8000 * teenNumber;
            allMoney = normalMoney + teenMoney + oldMoney;
            allNumber = normalNumber + teenNumber + oldNumber;
            ticketPrice.innerHTML = allMoney + '원';
            if (allNumber > 16) {
                li.classList.remove('select-seat-ul-active');
                //normalNumber = teenNumber = oldNumber = 0;
                allMoney -= teenMoney;
                allNumber = allNumber - teenNumber;

                selectNumberTeen[0].classList.add('select-seat-ul-active');
                ticketPrice.innerHTML = allMoney + '원';
            }
        } else if (li.parentNode.classList.contains('select-seat-ul-old')) {
            oldNumber = Number(li.innerHTML);
            oldMoney = 8000 * oldNumber;
            allMoney = normalMoney + teenMoney + oldMoney;
            allNumber = normalNumber + teenNumber + oldNumber;
            ticketPrice.innerHTML = allMoney + '원';
            if (allNumber > 16) {
                li.classList.remove('select-seat-ul-active');

                allMoney -= oldMoney;
                allNumber = allNumber - oldNumber;

                selectNumberOld[0].classList.add('select-seat-ul-active');
                ticketPrice.innerHTML = allMoney + '원';
 
            }
        }

        ticketPrice.innerHTML = allMoney;
        $(".last-price").text(allMoney);
        firstprice = $('.ticket-price').text();
        let finalprice = firstprice-usepoint;
    	$(".last-price").text(finalprice);

    	if(parseInt(finalprice) != 0){
    		$(".reserve-button").css({
    			"background-color":"#8A2E26",
    				"cursor":"pointer"			
    		});
    	}else{
    		$(".reserve-button").css({
    			"background-color":"#ccc",
    				"cursor":"auto"			
    		});
    	}
    	
        if (allNumber > 16) {
            li.classList.remove('select-seat-ul-active');
            toastr.error(
                '<div style="color:white">지정한 인원수를 넘었습니다(최대 8명)</div>',
                '<div style="color:white">인원수 확인</div>', {
                    timeOut: 4000,
                }
            );
        }
        payMoney.value = finalprice;
    });
}

selectSeatList(selectSeatListNormal);
selectSeatList(selectSeatListTeen);
selectSeatList(selectSeatListOld);

function mapping(input, i, j) {
    if (i === 0) {
        input.value = 'A' + j;
    } else if (i === 1) {
        input.value = 'B' + j;
    } else if (i === 2) {
        input.value = 'C' + j;
    } else if (i === 3) {
        input.value = 'D' + j;
    } else if (i === 4) {
        input.value = 'E' + j;
    } else if (i === 5) {
        input.value = 'F' + j;
    } else if (i === 6) {
        input.value = 'G' + j;
    } else if (i === 7) {
        input.value = 'H' + j;
    } else if (i === 8) {
        input.value = 'I' + j;
    } else if (i === 9) {
        input.value = 'J' + j;
    } else if (i === 10) {
        input.value = 'K' + j;
    }
}
for (let i = 0; i < 10; i++) {
    div = document.createElement('div');
    div.classList = 'seatButtonWrapper';
    seatWrapper.append(div);

    for (let j = 0; j < 12; j++) {
        const input = document.createElement('input');
        input.type = 'button';
        input.name = 'seats';
        input.classList = 'seat';
        mapping(input, i, j);
        input.id=input.value;
        div.append(input);
        inputClickEvent(input);
    }

    seat = document.querySelectorAll('.seat');
    remainSeat.innerHTML = seat.length-arrays.length;
    allSeat.innerHTML = seat.length;
}

seat.forEach(data => {
    
    if (data.value.substring(1, data.value.length) === '2') {
        data.classList.add('left-margin');
    } else if (data.value.substring(1, data.value.length) === '9') {
        data.classList.add('right-margin');
    }
    
    if (
        data.value.substring(0, data.value.length - 1) === 'E' ||
        data.value.substring(0, data.value.length - 2) === 'E'
    ) {
        data.classList.add('top-margin');
    }
    /* 이선좌 선택 불가능 */
    for(let i=0; i<arrays.length; i++){
        if(data.value==arrays[i]){
        	var id=data.id;
        	$(document).ready(function(){
        		$("#"+id).attr("disabled",true);
        		$("#"+id).val('×');
        		$("#"+id).css({
        			"background-color":"#B0B0B0",
        			"cursor" : "auto",
        			"font-size": "20px"
        		});
            });
        }
    }
});


function inputClickEvent(input) {
    input.addEventListener('click', function(e) {
        
        selectedSeatsArray = selectedSeatsArray.filter(
            (element, index) => selectedSeatsArray.indexOf(element) != index
        );

        if (input.classList.contains('clicked')) {
            input.classList.remove('clicked');
            clicked = document.querySelectorAll('.clicked');

            selectedSeatsArray.splice(selectedSeatsArray.indexOf(e.target.value), 1);
            clicked.forEach(data => {
                selectedSeatsArray.push(data.value);
            });
        } else {
            input.classList.add('clicked');
            clicked = document.querySelectorAll('.clicked');

            if (clicked.length > allNumber) {
                input.classList.remove('clicked');
                toastr.error(
                    '<div style="color:white">지정한 인원수를 넘었습니다</div>',
                    '<div style="color:white">인원수 확인</div>', {
                        timeOut: 4000
                    }
                );
                return;
            }

            clicked.forEach(data => {
                selectedSeatsArray.push(data.value);
            });
        }

        selectedSeats.innerHTML = selectedSeatsArray;
        reserveNumber.innerHTML = selectedSeatsArray.length;
        remainSeat.innerHTML = seat.length - selectedSeatsArray.length
        -arrays.length;
        selectedSeat.value=selectedSeatsArray;

    });
}


reserveButton.addEventListener('click', function() {
	movieNm.value = selectedMovie.innerHTML;
    reserveDate.value = theaterDate.innerHTML;
    screenTime.value = theaterTime.innerHTML;
    ticketNumber.value = reserveNumber.innerHTML;
    selectedSeat=selectedSeatsArray;
    ousepoint.value=usepoint;
    
    if (
        Number(ticketNumber.value) === allNumber &&
        ticketNumber.value !== '0' &&
        ticketNumber.value !== 0
    ) {
        seatForm.submit();
    } else {
        alert('좌석을 모두선택해 주세요!');
    }
});

/*최종결제 금액*/
$('#usePoint').keyup(function() { 
	usepoint = $('#usePoint').val();

	if( parseInt(havepoint) < parseInt(usepoint)){ //보유 포인트보다 높게 작성
		alert('보유포인트 이상 사용은 불가능 합니다.');
		usepoint = havepoint; //보유포인트
		$('#usePoint').val(havepoint);			
	}
	if(parseInt(firstprice) < parseInt(usepoint)){// 결제금액보다 높게 작
		alert('결제금액 이상 사용은 불가능 합니다.');
		usepoint = firstprice; //보유포인트
		$('#usePoint').val(firstprice);	
	}
	
	
	finalprice = firstprice-usepoint;
    payMoney.value = finalprice;
    
	$(".last-price").text(finalprice);
	if(finalprice != 0){
		$(".reserve-button").css({
			"background-color":"#8A2E26",
				"cursor":"pointer"			
		});
	}
	
});
finalprice = firstprice-usepoint;

if(finalprice == 0){
	$(".reserve-button").css({
		"background-color":"#ccc",
			"cursor":"auto"			
	});
}


/* 이전페이지 */
$('.before-button').click(function() {
	history.go(-1);
});


