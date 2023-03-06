<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購物車清單</title>
</head>
<body>
	<header class="theAllHeader">
		<a href="${contextRoot}/"><img width="200px" height="50px"
			src="${contextRoot}/images/thunder/cuttedLogo.jpg"
			style="float: left; margin-top: 1%; margin-left: 1%; margin-right: 2%" /></a>
		<ul class="drop-down-menu">
			<li class="lookForMore1"><a class="lookForMore2" href="#">探索更多</a>
				<ul>
					<li><a href="product/productlist">購物商城</a>
					<li><a href="#">閒置連結欄位</a></li>
					<li><a href="#">不夠再加</a></li>
				</ul></li>
		</ul>
		<input id="searchArea"
			style="background-image: url('${contextRoot}/images/thunder/searchIcon.jpg');"
			type="text" placeholder="程式語言快速學">
	</header>
	<table class="table">

		<thead>
			<tr>
				<th scope="col">ProductName</th>
				<th scope="col">BuyingAmount</th>
				<th scope="col">Money</th>
				
			</tr>
		</thead>
		<tbody id="showShopList">
			<jstl:forEach var="car" items="${allShopCar}">
				<tr>
					<td>${car.product.productName}</td>
					<td>${car.shoppingCartAmount}</td>
					<td>${car.product.}</td>
					<td scope="col">
						<div class="edit-place" style="display: flex">

							<form action="${contextRoot}/shopCar/delete" method="post"
								onsubmit="return confirmation();">
								<input name="_method" type="hidden" value="delete" /> <input
									type="hidden" value="${car.shoppingCartId}" name="id">
								<button type="submit" class="btn btn-danger" id="deleteBtn">刪除</button>
							</form>
							
							<form action="${contextRoot}/" method="get">
								<input type="hidden" value="${car.shoppingCartId}" name="id1">
								<button type="submit" class="btn btn-warning">送出訂單</button>
							</form>
						</div>
					</td>
				</tr>
			</jstl:forEach>
		</tbody>
	</table>



</body>
</html>