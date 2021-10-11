<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}\resources\css\myreserveinfo_m.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- bootstrap -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function(){
        $('#movie-modal').modal();
    });

</script>
</head>
<body>
<div id="movie-modal" class="modal fade">
    <div class="modal-dialog modal-lg" role="document" style="width:auto;display:table">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title"><strong>예약번호</strong>
                    <span class="rev_no"><strong>${rev_no}</strong></span>
                </div>
            </div>
            <div class="modal-body">
                <span class="poster" style="text-align: center;">
                    <img src="${image}" alt="img" class="img-thumbnail">
                </span>
                <div class="info">
                    <div class="title"><strong>${movieNm }</strong></div>
                    <div>${show_date } </div>
                    <div class="time"><strong>${show_time } ~ </strong></div>
                    <div class="seat">${seats}</div>
                </div>
            </div>
            <div class="modal-footer">
                <ul class="alarm">
                    <li>
                       	 영화 상영시작시간 20분 전까지 예매 취소가 가능하며 캡쳐화면은 입장이 제한될 수 있습니다.  
                    </li>
                    <br>
                    <li>
                    	입장 지연에 따른 관람 불편을 최소화하기 위해 영화는 10분 후 상영이 시작됩니다.
                    </li>
                </ul>
                <div class="logo">
                    <img src="${pageContext.request.contextPath}\resources\img\footerlogo.png" alt="" width="150px">
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>