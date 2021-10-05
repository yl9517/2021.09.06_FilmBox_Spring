<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="resources/css/modifyform.css">

</head>
<style>
	/* email 사용 가능 */
	#email_check1{
		color : skyblue;
		display : none;
		font-size : 12px;
	}
	/* 중복 email 존재 */
	#email_check2{
		color : red;
		display : none;
		font-size : 12px;
	}
</style>
<body>
<div class="mid">
	<h3>회원정보 수정</h3>
	
<form method="post" action="modifyresult">
	<label for="member_id">아이디</label><br> 
    <input type="text" name="member_id" id="member_id" class="w3-input w3-border" value="${dto.member_id}" readonly>
    <br>
    <label for="member_pwd">비밀번호</label>
    <br> 
    <input type="password" id="member_pwd" name="member_pwd" class="w3-input w3-border" minlength='8' maxlength='10' spellcheck="false" required> 
        <i class="far fa-eye" id="eye"></i>
    <br>
    <label for="member_name">이름</label><br> 
    <input type="text" id="member_name" name="member_name" class="w3-input w3-border" value="${dto.member_name}" minlength='1' maxlength='15' spellcheck="false" required> 
    <br>
    <label for="member_phone">연락처</label><br> 
    <input type="text" id="member_phone" name="member_phone" class="w3-input w3-border" value="${dto.member_phone}" maxlength='13' spellcheck="false" required> 
    <br>
    <label for="email">이메일</label><br> 
    <input type="email" id="email" name="email" class="w3-input w3-border" value="${dto.email}" maxlength='30' spellcheck="false" required> 
     			<span id="email_check1">사용가능한 이메일입니다.</span>
				<span id="email_check2">이메일이 이미 존재합니다.</span>
    <br>
    
    <div class="btns">
     <input type="submit" id="usubmit" value="수정 완료">
     <input type="reset" id="ureset" value="취소">
     </div>
</form>
</div>	

<script>
//email 중복 검사
$('#email').on("propertychange change keyup paste input", function(){
	var email = $('#email').val();	
	var data = {email : email}
	
		$.ajax({
			type : "post",
			url : "/emailcheck",
			data : data,
			success : function (result) {
				if(result!='fail'){
					$('#email_check1').css("display", "inline-block");
					$('#email_check2').css("display", "none");
					$("#usubmit").attr("disabled", false);
					
				}
				else{
					$('#email_check1').css("display", "none");
					$('#email_check2').css("display", "inline-block");
					$("#usubmit").attr("disabled", true);
					
				}
			}
		});
});

//연락처 유효성
$(document).on("keyup", "#member_phone", function() {
	$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
});


//비밀번호 확인
$("#eye").on("click", function() {
	  if ($("#member_pwd").attr("type") == "password") {
	    $("#member_pwd").attr("type", "text");

	  } else {
	    $("#member_pwd").attr("type", "password");
	  }
});



</script>
</body>
</html>