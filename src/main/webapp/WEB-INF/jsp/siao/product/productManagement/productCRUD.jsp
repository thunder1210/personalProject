<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<style>
.plus {
	font-size: 20px;
	background-color: cornsilk;
}
.moveRight{
	margin-left: 50px
}
</style>
<link href="${contextRoot}/css/siao/bootstrap.min.css" rel="stylesheet" />

<title>商品管理</title>
</head>
<body>
	<div class="container">
		<div class="d-flex">
			<form action="${contextRoot}/products/search" method="get">
				查詢商品: <input type="text" name ="searchbar">
			<button type="submit" class="btn btn-outline-dark moveRight">查詢</button>
			</form>
		</div>
		<br> 
		<a href="${contextRoot}/product/productcreate"><span
			class="plus">+</span>創立新商品</a>
		<table class="table">

			<thead>
				<tr>
					<th scope="col">ProductName</th>
					<th scope="col">ProductPhoto</th>
					<th scope="col">ProductPrice</th>
					<th scope="col">ProductType</th>
					<th scope="col">ProductAmount</th>
					<th scope="col">ProductCreater</th>
					<th scope="col">ProductPublishe</th>
					<th scope="col">ProductDate</th>
					<th scope="col">ProductControl</th>
					<th scope="col">OnSelve</th>
				</tr>
			</thead>
			<tbody>
				<jstl:forEach var="product" items="${allProducts}">
					<tr>
						<td>${product.productName}</td>
						<td><img width="180px" src="${product.productPhoto}"></td>
						<td>${product.productPrice}</td>
						<td>
						<jstl:choose>
						<jstl:when test="${product.productType =='1'}" >
						書籍
						</jstl:when>
						<jstl:otherwise>
						影片
						</jstl:otherwise>
						</jstl:choose>
						</td>
						<td>${product.productAmount}</td>
						<td>${product.productCreater}</td>
						<td>${product.productPublisher}</td>
						<td>${product.productDate}</td>
						<td scope="col">
							<div class="edit-place" style="display: flex">
								<form action="${contextRoot}/products/edit" method="get">
									<input type="hidden" value="${product.productId}" name="id1">
									<button type="submit" class="btn btn-warning">修改</button>
								</form>
	
								<form action="${contextRoot}/products/delete" method="post"
									onsubmit="return confirmation();">
									<input name="_method" type="hidden" value="delete" /> <input
										type="hidden" value="${product.productId}" name="id">
									<button type="submit" class="btn btn-danger moveRight" id="deleteBtn">刪除</button>
								</form>

							</div>
						</td>
						<td>
						<jstl:choose>
						<jstl:when test="${product.onSelve == 1}" >
						上架
						</jstl:when>
						<jstl:otherwise>
						下架
						</jstl:otherwise>
						</jstl:choose></td>
					</tr>

				</jstl:forEach>
			</tbody>
		</table>
	</div>

	<script>
		function confirmation() {
			var result = confirm("確定要刪除嗎?");
			if (result) {
				console.log("Deleted");

			} else {
				console.log("cancel!");
				return false;
			}
		}
	</script>
</body>

</html>