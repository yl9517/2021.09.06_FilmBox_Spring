<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="" method="post" name="revInfo">
	<img src="${QRurl }" alt="">
	<input type="hidden" name="rev_no" value="${rev_no }"> 
	<input type="hidden" name="image" value="${image }"> 
	<input type="hidden" name="movieNm" value="${movieNm }"> 
	<input type="hidden" name="show_date" value="${show_date }"> 
	<input type="hidden" name="show_time" value="${show_time }"> 
	<input type="hidden" name="seats" value="${seats }"> 
	
	<input type="hidden" name="coupon_no" value="${coupon_no }"> 
	<input type="hidden" name="product_no" value="${product_no }"> 
	<input type="hidden" name="product_category" value="${product_category }"> 
	<input type="hidden" name="product_name" value="${product_name }"> 
	<input type="hidden" name="product_content" value="${product_content }"> 
	<input type="hidden" name="coupon_lastdate" value="${coupon_lastdate }"> 
</form> 
</body>
</html>