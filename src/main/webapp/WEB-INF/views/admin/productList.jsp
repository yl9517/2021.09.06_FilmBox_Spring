<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources\css\productList.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
 integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
 integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
 crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
 crossorigin="anonymous"></script>

</head>
<body>
	<div class="pInsert_wrap">
		<!-- content -->
		<div class="container pt-3">
			<div class="row">
				<!-- left -->
				<div class="col-xs-2" id="panel-wrap">
					<div class="panel panel-default">
						<ul class="list-group">
							<li class="list-group-item list-group-item-secondary"><strong>스토어관리</strong></li>
							<li class="list-group-item list-group-item-action list-group-item-light"><a href="/productInsert">상품 등록</a></li>
							<li class="list-group-item list-group-item-action list-group-item-light"><a href="/productList">상품 목록</a></li>
						</ul>
					</div>
				</div>
				<!-- right -->
			<div id="product_info" class="col-xs-8">
				<div class="text-center" id="t_header">상품 목록</div>
				<form method="get" action="/productList" class="search-tab">
					<select name="search" class="form-control form-control" style="width:140px">
						<option selected>-상품 종류-</option>
						<option value="coupon">쿠폰</option>
						<option value="food">팝콘/음료</option>
					</select>
					<input type="submit" value="검색" class="btn btn-secondary btn-sm">
				</form>
				<table class="table table-hover" id="p_table">
					<thead>
						<tr>
							<th class="text-center">상품번호</th>
							<th class="text-center">상품명</th>
							<th class="text-center">수정/삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${productlist }">
						<tr>
							<td><label>${item.product_no }</label></td>
							<td><a href="productDetail/${item.product_no }">${item.product_name }</a></td>
							<td>
								<div class="btns">
									<button type="reset" class="btn btn-outline-secondary btn-sm" id="update"
											onclick="location.href='productUpdate/${item.product_no}'">수정</button>
									<button type="submit" class="btn btn-danger btn-sm" id="delete"
											data-toggle="modal"
											onclick="delModal('${item.product_no}')">삭제</button>
								</div>
							</td>
						</tr>
						</c:forEach>
						

					</tbody>
					</table>
				
				
				<!-- 페이징 -->

				<div class="paging-wrap">
					<c:if test="${plpage.prev }">
						<span>
							<a href="productList?currPage=${plpage.startBlock-1 }&search=${search}">
								<c:out value="이전"/>
							</a>
						</span>
					</c:if>

					<c:forEach var="index" begin="${plpage.startBlock }" end="${plpage.endBlock }">
						<c:if test="${index==plpage.currPage }">
							<span class="now_page">
								<c:out value="${index }"/>
							</span>
						</c:if>
						<c:if test="${index!=plpage.currPage }">
							<span class="etc_page">
								<a href="productList?currPage=${index }&search=${search}">
									<c:out value="${index }"/>
								</a>
							</span>
						</c:if>
					</c:forEach>

					<c:if test="${plpage.next }">
						<span>
							<a href="productList?currPage=${plpage.endBlock+1 }&search=${search}">
								<c:out value="다음"/>
							</a>
						</span>
					</c:if>
				</div>

				</div>
				
			</div>
		</div>
		
		
		
		
	</div>
	
	<!-- 상품 삭제 modal -->
		<div class="modal fade" id="productDelModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">스토어 상품 삭제</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<!-- <span aria-hidden="true">&times;</span> -->
						</button>
					</div>
					<div class="modal-body">상품을 삭제 하시겠습니까?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" id="confirm">확인</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	<script type="text/javascript" src="resources\js\productList.js"></script>
</body>
</html>