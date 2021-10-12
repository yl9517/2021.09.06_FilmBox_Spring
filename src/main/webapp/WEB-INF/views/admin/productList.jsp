<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources\css\productList.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="pInsert_wrap">
		<!-- content -->
		<div class="container pt-3">
			<div class="row">
				<!-- left -->
				<div class="col-xs-2" id="panel-wrap">
					<div class="panel panel-default">
						<div class="panel-heading">스토어 관리</div>
						<ul class="list-group">
							<li class="list-group-item"><a href="/productInsert">상품 등록</a></li>
							<li class="list-group-item"><a href="/productList">상품 목록</a></li>
						</ul>
					</div>
				</div>
				<!-- right -->
			<div id="product_info" class="col-xs-8">
				<table class="table table-hover" id="p_table">
					<thead>
						<tr>
							<th colspan="3" class="text-center" id="t_header">상품 목록</th>
						</tr>
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
									<button type="reset" class="btn btn-default btn-sm" id="update"
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
							<a href="productList?currPage=${plpage.startBlock-1 }">
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
								<a href="productList?currPage=${index }">
									<c:out value="${index }"/>
								</a>
							</span>
						</c:if>
					</c:forEach>
	
					<c:if test="${plpage.next }">
						<span>
							<a href="productList?currPage=${plpage.endBlock+1 }">
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