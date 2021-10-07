<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
							<li class="list-group-item"><a href="productInsert">상품 등록</a></li>
							<li class="list-group-item"><a href="productList">상품 목록</a></li>
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
						<tr>
							<td><label>1</label></td>
							<td><a href="productDetail">버블버블팝 팝콘</a></td>
							<td>
								<div class="btns">
									<button type="reset" class="btn btn-default btn-sm" id="update">수정</button>
									<button type="submit" class="btn btn-danger btn-sm" id="delete">삭제</button>
								</div>
							</td>
						</tr>

					</tbody>
				</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>