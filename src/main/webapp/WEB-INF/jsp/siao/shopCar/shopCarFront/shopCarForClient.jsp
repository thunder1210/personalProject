<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
				<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
					<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

					<!DOCTYPE html>
					<html>

					<head>
						<meta charset="UTF-8">
						<style>
							.oneProductPicture {
								width: 150px;
								height: 150px;
							}

							.amount_adjustment {
								border: 2px solid black;
								background-color: white;
								color: black;
								padding-left: 6px;
								padding-right: 6px;
								font-size: 3px;
								cursor: pointer;
								margin: 0px;

							}

							.default {
								border-color: #e7e7e7;
								color: black;
							}

							.default:hover {
								background: #e7e7e7;
							}

							.amount {
								width: 30px;
								font-size: 10px;
								margin: 0px;
							}
						</style>

						<title>購物車清單</title>
					</head>

					<body>
						<div>
							<jsp:include page="../../../NavBar.jsp"></jsp:include>
						</div>
						<div class="container">
							<br>
							<table class="table">

								<thead>
									<tr>
										<th><input type="checkbox" onchange="checkAll(this); gettotalPrice()"></th>
										<th scope="col" class="col-sm-4 text-center">名稱</th>
										<th></th>
										<th scope="col" class="text-center">數量</th>
										<th scope="col" class="text-center">單價</th>
										<th scope="col" class="text-center">總價</th>
									</tr>
								</thead>

								<tbody id="showShopList">
									<jstl:forEach var="car" items="${allShopCar}" varStatus="loop">
										<input type="hidden" value="${car.shoppingCartId}" id="id1">
										<tr id="${car.shoppingCartId}">
											<td><input type="checkbox" class="checkbox"
													onchange="checkSingle(this);gettotalPrice()"
													id="check${loop.index}"></td>
											<td>${car.product.productName}</td>
											<td><img src="${car.product.productPhoto}" class="oneProductPicture"></td>
											<td class="text-center">
												<span class="amount_adjustment default minus" id="minus">-</span>
												<span class="num">${car.shoppingCartAmount}</span>
												<span class="amount_adjustment default plus" id="plus">+</span>
											</td>
											<td class="text-center" id="onePrice">$${car.product.productPrice}</td>
											<td class="text-center" id="totalPrice">$${car.product.productPrice*car.shoppingCartAmount}</td>
											<td scope="col">
												<div class="edit-place" style="display: flex">

													<form action="${contextRoot}/shopCar/deleteInClient" method="post"
														onsubmit="return confirmation('${car.shoppingCartId}');">
														<input name="_method" type="hidden" value="delete" /> <input
															type="hidden" value="${car.shoppingCartId}" name="id">
														<input type="hidden"
															value="${sessionScope.loginMember.memberId}" name="MemId">
														<button type="submit" class="btn btn-danger"
															id="deleteBtn">刪除</button>
													</form>

												</div>
											</td>
										</tr>
									</jstl:forEach>
								</tbody>
							</table>


							<form action="${contextRoot}/shopCar/jumpToCheck" method="post" id="buy">
								<button type="button" class="btn btn-warning" onclick="sendOrder()">去買單</button>
							<!-- <input type="hidden" name="carId" id="myArrayInput" value=""> -->
							
							</form>

							<div id="total">總金額:$</div>
						</div>
						<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
						<script>
							const
								plusElement = document.querySelectorAll(".plus"),
								numElement = document.querySelectorAll(".num"),
								minusElement = document.querySelectorAll(".minus")
							const showing = document.getElementById("showShopList");
							const checkbox = document.querySelectorAll('input[type="checkbox"]');
							const tatolprice = document.querySelectorAll('#totalPrice');
							const oneprice = document.querySelectorAll('#onePrice');
							const total = document.getElementById("total")
							const sendtobackId = document.querySelectorAll('#id1');
							// console.log(numElement[0].textContent)


							// a[0] = numElement[0].textContent
							// console.log("before: "+a[0]);
							// a[0]++
							// console.log("after: "+ a[0]);
							let a = [];
							console.log(numElement.length - 1);
							console.log("from 0? yes" + plusElement.length);
							let queryNum = numElement.length - 1
							for (let i = 0; i <= queryNum; i++) {
								console.log(i);
								a[i] = parseInt(numElement[i].textContent);
								// console.log(numElement[i].textContent);
								let price = parseInt((oneprice[i].textContent).substr(1))
								plusElement[i].addEventListener('click', function () {
									console.log("按了");
									a[i]++
									// console.log(showing.querySelector(`tr:nth-child(${i+1}) td:nth-child(2)`).textContent)
									console.log(a[i]);

									console.log(price);
									tatolprice[i].textContent = "$" + a[i] * price;
									numElement[i].textContent = a[i];
									console.log("按完");
									gettotalPrice();
									////put//
									let JsonRaw = { "shoppingCartId": sendtobackId[i].value, "shoppingCartAmount": a[i]};
									let JsonString = JSON.stringify(JsonRaw);

									axios.put(`${contextRoot}/shopCar/updateAmount`, JsonString, {
										headers: { 'Content-Type': 'application/json' }
									})
										.then(function (response) {
											console.log(response.data)
										})
										.catch(function (error) {
											console.log(error);
											// 在這裡處理錯誤
										});

								})
								minusElement[i].addEventListener('click', function () {
									a[i]--;
									if (a[i] > 0 && a[i] < 10) {
										numElement[i].textContent = a[i];
										tatolprice[i].textContent = "$" + a[i] * price;
									}
									else if (a[i] < 1) {
										a[i] = 1;
										numElement[i].textContent = a[i];
										tatolprice[i].textContent = "$" + a[i] * price;
									}
									else {
										numElement[i].textContent = a[i];
										tatolprice[i].textContent = "$" + a[i] * price;
									}
									gettotalPrice();
									let JsonRaw = { "shoppingCartId": sendtobackId[i].value, "shoppingCartAmount": a[i]};
									let JsonString = JSON.stringify(JsonRaw);

									axios.put(`${contextRoot}/shopCar/updateAmount`, JsonString, {
										headers: { 'Content-Type': 'application/json' }
									})
										.then(function (response) {
											console.log(response.data)
										})
										.catch(function (error) {
											console.log(error);
											// 在這裡處理錯誤
										});

								})
							}

							function confirmation(idname) {
								const trelement = document.getElementById("div#idname");
								element.innerHTML = ""
							}
							//只要有第一個空格 下列商品全部憶起勾
							function checkAll(source) {
								if (source.checked == true) {
									console.log(source.checked)
									for (let i = 0; i < checkbox.length; i++) {
										checkbox[i].checked = true
									}
								}
								else if (source.checked == false) {
									for (let i = 0; i < checkbox.length; i++) {
										checkbox[i].checked = false
									}
								}
							}
							function checkSingle(source) {
								if (source.checked == false && checkbox[0].checked == true) {
									checkbox[0].checked = false;
								}
								let TF = true
								for (let i = 1; i < checkbox.length; i++) {
									TF = TF * checkbox[i].checked;
								}
								if (TF) { checkbox[0].checked = true; }
							}
							//////////////放在勾選的功能鍵中 每當有勾選商品時 就將商品價錢更新
							function gettotalPrice() {
								let oringin = (total.innerHTML).substring(0, 5);
								let price = 0;

								for (let i = 1; i < checkbox.length; i++) {
									if (checkbox[i].checked) {
										console.log(tatolprice[i - 1].textContent)
										price += parseInt((tatolprice[i - 1].textContent).substr(1));
									}
								}
								total.innerHTML = oringin + price;
							}
							///////////	送出訂單 -先判斷有沒有勾選，若有就將勾選的id先存到陣列裡面
							function sendOrder() {
								let TF = false
								let chosenShopCarId = [];
								orderForm = document.getElementById('buy');
								for (let i = 1; i < checkbox.length; i++) {
									if ((checkbox[i].checked)) {
										TF = true;
										let a = sendtobackId[i - 1].value;
										chosenShopCarId.push(a);
										// orderForm.innerHTML += `<input type="hidden" name="carId" value="${a}">`;
										orderForm.innerHTML += `<input type="hidden" name="carId" value="`+ a +`">`;
										// 
									}
								}
								// document.getElementById('myArrayInput').value = JSON.stringify(chosenShopCarId);
								if (TF) {
									console.log("good")
									// chosenShopCarId
									/////////post/////////
									// axios.post(`${contextRoot}/shopCar/jumpToCheck`, chosenShopCarId)
									// 	.then(function (response) {
									// 		console.log(response.data);
									// 		// console.log(response.data);
											
											
									// 		// 在這裡處理後端回傳的資料
									// 		// response.data.forEach(element => {
									// 		// 	console.log(element.shoppingCartId)
									// 		// });
											
									// 		// window.location.href = '/${contextRoot}/siao/shopCar/shopCarFront/order';
									// 	})
									// 	.catch(function (error) {
									// 		console.log(error);
									// 		// 在這裡處理錯誤
									// 	});
									document.getElementById('buy').submit();
								}
								else {
									console.log("你沒有選取商品")
									window.alert("你沒有選取商品");
								}
								
							}
						</script>



					</body>

					</html>