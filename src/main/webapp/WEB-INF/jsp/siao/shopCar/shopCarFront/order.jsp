<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
			<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

			<!DOCTYPE html>
			<html>

			<head>
				<style>
					/* div.block {
	background-color: white;
	color: #000;
}

div h3 {
	padding-top: 20px;
}

.flex-row {
	flex-direction: row !important
}

.d-flex {
	display: flex !important
}

.justify-content-around {
	justify-content: space-around !important
}

.btn-lg { -
	-bs-btn-padding-y: 0.5rem; -
	-bs-btn-padding-x: 1rem; -
	-bs-btn-font-size: 1.25rem; -
	-bs-btn-border-radius: 0.5rem
}

.btn { -
	-bs-btn-padding-x: 0.75rem; -
	-bs-btn-padding-y: 0.375rem; -
	-bs-btn-font-family:; -
	-bs-btn-font-size: 1rem; -
	-bs-btn-font-weight: 400; -
	-bs-btn-line-height: 1.5; -
	-bs-btn-color: #212529; -
	-bs-btn-bg: transparent; -
	-bs-btn-border-width: var(- -bs-border-width); -
	-bs-btn-border-color: transparent; -
	-bs-btn-border-radius: 0.375rem; -
	-bs-btn-hover-border-color: transparent; -
	-bs-btn-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.15), 0 1px 1px
		rgba(0, 0, 0, 0.075); -
	-bs-btn-disabled-opacity: 0.65; -
	-bs-btn-focus-box-shadow: 0 0 0 0.25rem
		rgba(var(- -bs-btn-focus-shadow-rgb), .5);
	display: inline-block;
	padding: var(- -bs-btn-padding-y) var(- -bs-btn-padding-x);
	font-family: var(- -bs-btn-font-family);
	font-size: var(- -bs-btn-font-size);
	font-weight: var(- -bs-btn-font-weight);
	line-height: var(- -bs-btn-line-height);
	color: var(- -bs-btn-color);
	text-align: center;
	text-decoration: none;
	vertical-align: middle;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
	border: var(- -bs-btn-border-width) solid var(- -bs-btn-border-color);
	border-radius: var(- -bs-btn-border-radius);
	background-color: var(- -bs-btn-bg);
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out
}

.btn-send { -
	-bs-btn-color: #000; -
	-bs-btn-bg: #ff7707; -
	-bs-btn-border-color: #ff7707; -
	-bs-btn-hover-color: #000; -
	-bs-btn-hover-bg: #fa9038; -
	-bs-btn-hover-border-color: #fc8727; -
	-bs-btn-focus-shadow-rgb: 217, 164, 6; -
	-bs-btn-active-color: #000; -
	-bs-btn-active-bg: #fd8c2f; -
	-bs-btn-active-border-color: #fc8727; -
	-bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125); -
	-bs-btn-disabled-color: #000; -
	-bs-btn-disabled-bg: #ff7707; -
	-bs-btn-disabled-border-color: #ff7707
}

.btn-warning { -
	-bs-btn-color: #000; -
	-bs-btn-bg: #ffc107; -
	-bs-btn-border-color: #ffc107; -
	-bs-btn-hover-color: #000; -
	-bs-btn-hover-bg: #ffca2c; -
	-bs-btn-hover-border-color: #ffc720; -
	-bs-btn-focus-shadow-rgb: 217, 164, 6; -
	-bs-btn-active-color: #000; -
	-bs-btn-active-bg: #ffcd39; -
	-bs-btn-active-border-color: #ffc720; -
	-bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125); -
	-bs-btn-disabled-color: #000; -
	-bs-btn-disabled-bg: #ffc107; -
	-bs-btn-disabled-border-color: #ffc107
} */
					.right {
						text-align: right
					}

					.textCenter {
						text-align: center
					}
				</style>
				<meta charset="UTF-8">
				<link href="${contextRoot}/css/siao/bootstrap.min.css" rel="stylesheet" />

				<title>Insert title here</title>
			</head>

			<body>
				<div>
					<jsp:include page="../../../NavBar.jsp"></jsp:include>
				</div>
				<br>
				<div class="container">
					<br>
					<div class="block">
						<h3>訂單商品</h3>
						<table class="table">
							<thead>
								<tr>
									<th scope="col" class="col-sm-4 text-center">名稱</th>
									<th scope="col" class="text-center">單價</th>
									<th scope="col" class="text-center">數量</th>
									<th scope="col" class="text-center">價錢</th>


								</tr>
							</thead>
							<tbody id="show">
								<c:forEach var="car" items="${selectedShopCar}">
									<input type="hidden" value="${car.shoppingCartId}" id="shoppingId">
									<input type="hidden" value="${car.productId}" id="productId">
									<tr>
										<td class="textCenter" id="name">${car.productName}</td>
										<td class="textCenter" id="price">${car.productPrice}</td>
										<td class="textCenter" id="amount">${car.shoppingCartAmount}</td>
										<td class="textCenter" id="totalPrice">${car.shoppingCartAmount *
											car.productPrice}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<h2 id="all" class="right">總價:</h2>



					</div>
					<div class="block">
						<h3>付款方式</h3>
						<div>
							<nav>
								<div class="nav nav-tabs" id="nav-tab" role="tablist">
									<button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab"
										data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home"
										aria-selected="true">貨到付款</button>
									<button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
										data-bs-target="#nav-profile" type="button" role="tab"
										aria-controls="nav-profile" aria-selected="false">線上付款</button>
								</div>
							</nav>
							<div class="tab-content" id="nav-tabContent">
								<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
									aria-labelledby="nav-home-tab" tabindex="0">
									<div>
										<button type="button" class="btn btn-lg btn-warning"
											id="unpay">下訂單(沒付款)</button>
									</div>
								</div>
								<div class="tab-pane fade" id="nav-profile" role="tabpanel"
									aria-labelledby="nav-profile-tab" tabindex="0">
									<div>
										<button type="button" class="btn btn-lg btn-warning" id="pay">下訂單</button>
									</div>
								</div>

							</div>
						</div>
						<input type="hidden" value="${sessionScope.loginMember.memberId}" id="MemId">
					</div>

				</div>
				<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
				<script>



					/////
					const memberIdGetFromSession = parseInt(document.getElementById('MemId').value);
					const Totalprice = document.querySelectorAll("#totalPrice");
					const all = document.getElementById('all');
					const unpayBtn = document.getElementById('unpay');
					const payBtn = document.getElementById('pay');
					////
					const proId = document.querySelectorAll("#productId");
					const name = document.querySelectorAll("#name");
					const price = document.querySelectorAll("#price");
					const amount = document.querySelectorAll("#amount");
					//////
					const shopcarId = document.querySelectorAll("#shoppingId");



					let total = 0;
					for (let i = 0; i < Totalprice.length; i++) {
						total += parseInt(Totalprice[i].innerHTML);
					}
					console.log(Totalprice.length);
					console.log(total);
					all.innerHTML += "$" + total;
					console.log("我有拿到 : " + proId[0].value);



					//抓totalPrice MemberId 付款未付款
					unpayBtn.addEventListener('click', () => payOrUnpay(0, event))
					payBtn.addEventListener('click', () => payOrUnpay(1, event))

					function payOrUnpay(determine, event) {
						event.preventDefault();
						let pay = "" + determine;
						console.log(pay);
						const data = {
							payed: pay,
							totalPrice: total,
							memberId: memberIdGetFromSession
						};
						const JsonString = JSON.stringify(data)
						//先做Order的post
						axios.post(`${contextRoot}/order/addOrder`, JsonString, {
							headers: { 'Content-Type': 'application/json' }
						})
							.then(function (response) {
								console.log(response.data)
							})
							.catch(function (error) {
								console.log(error);
								// 在這裡處理錯誤
							});

						//////////////準備塞orderDetail
						const alldetail = [];
						for (i = 0; i < proId.length; i++) {
							// console.log(typeof(proId[i].value));
							// console.log(typeof(amount[i].innerHTML));
							// console.log(typeof(Totalprice[i].innerHTML));
							// console.log(typeof(price[i].innerHTML));
							console.log("我有拿到 : " + proId[i].value + "現在的i=" + i);
							const detail = {
								proId: parseInt(proId[i].value),
								buyingAmount: parseInt(amount[i].innerHTML),
								totalPrice: parseInt(Totalprice[i].innerHTML),
								singlePrice: parseInt(price[i].innerHTML)
							}
							alldetail.push(detail);
						};

						console.log(JSON.stringify(alldetail));

						axios.post(`${contextRoot}/orderDetail/addOrderDetail`, JSON.stringify(alldetail), {
							headers: { 'Content-Type': 'application/json' }
						})
							.then(function (response) {
								console.log(response.data)
							})
							.catch(function (error) {
								console.log(error);
								// 在這裡處理錯誤
							});
						//準備移除已經買過的購物車商品
						const deleteDetail = [];
						for (i = 0; i < shopcarId.length; i++) {
							console.log(shopcarId[i].value)
							deleteDetail.push(shopcarId[i].value)
						}
						console.log("我有刪除吧")
						axios.delete(`${contextRoot}/shopCar/axiosdelete`,{
							headers: { 'Content-Type': 'application/json' },
							data: JSON.stringify(deleteDetail)
						})
							.then(function (response) {
								
								console.log(response.data)
								console.log("我有刪除吧")
							})
							.catch(function (error) {
								console.log(error);
								// 在這裡處理錯誤
							});

						 window.alert("成功下單！");
						 window.location.href = "http://localhost:8080/onlinelearning/";
					}
				</script>

				<script src="${contextRoot}/js/siao/bootstrap.bundle.min.js" type="text/javascript"></script>
			</body>

			</html>