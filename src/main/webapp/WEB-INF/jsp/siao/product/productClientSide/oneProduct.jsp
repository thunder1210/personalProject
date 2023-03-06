<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
				<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
				<!DOCTYPE html>
				<html>

				<head>
					<meta charset="UTF-8">
					<link href="${contextRoot}/css/siao/bootstrap.min.css" rel="stylesheet" />
					<style>
						.horizontal-line {
							/* padding-bottom: 20px; */
							padding-top: 20px;
							border-top: 3px solid #cbc8c8;
							width: 600px;
						}

						.separate {
							width: 20px;
						}

						.intro {
							padding-bottom: 15px;
						}

						.IDN {
							height: 60px;
							max-width: 180px;
							display: flex;
							align-items: center;
							justify-content: center;
							border-radius: 12px;
							background-color: antiquewhite;
						}

						.IDN span {
							width: 50%;
							text-align: center;
							font-size: 55px;
							font-weight: 600;
						}

						.IDN span.num {
							font-size: 30px;
							border-right: 2px solid rgba(0, 0, 0, 0.2);
							border-left: 2px solid rgba(0, 0, 0, 0.2);
						}

						.IDN span.minus {
							font-size: 30px;
						}

						.IDN span.plus {
							font-size: 30px;
						}

						a {
							text-decoration: none;
						}

						.oneProductPicture {
							width: 378px;
							height: 378px;
						}

						.condition {
							border-radius: 10px;
							border-color: darkgrey;
							border-style: solid;
							border-width: 1px;
							padding: 20px;
						}
					</style>
					<title>Insert title here</title>
				</head>

				<body>
					<div>
						<jsp:include page="../../../NavBar.jsp"></jsp:include>
					</div>

					<div class="container">
						<div class="d-flex ">
							<div id="productPicture">
								<img alt="" src="${chosenProduct.productPhoto}" class="oneProductPicture">
							</div>
							<div class="separate"></div>
							<div id="productInfo">
								<input type="hidden" value="${chosenProduct.productId}">
								<div>
									<h1>${chosenProduct.productName}</h1>
								</div>
								<div class="intro">作者: ${chosenProduct.productCreater}</div>
								<div class="intro">出版社: ${chosenProduct.productPublisher}</div>
								<div class="intro">出版日期: ${chosenProduct.productDate}</div>
								<div class="horizontal-line"></div>

								<div>定價:NT$ ${chosenProduct.productPrice} 元</div>
								<div>
									購買數量:
									<div class="IDN">
										<span class="minus">-</span> <span class="num" id="num">01</span>
										<span class="plus">+</span>
									</div>
								</div>

								<div>
									<button type="button" class="btn btn-info" id="addToCarBtn"
										onclick="submit()">加入購物車</button>
									<button type="button" class="btn btn-info" id="addToBuyList"
										onclick="">直接購買</button>
										
								</div>
							</div>
						</div>
					</div>
					<div>
						<input type="hidden" value="${sessionScope.loginMember.memberId}" id="memberID">
						<input type="hidden" value="${chosenProduct.productId}"id="productID">
					</div>



					<script>
						const num = document.querySelector(".num"),
							plus = document.querySelector(".plus"),
							minus = document.querySelector(".minus");
						let buyingNumber = num.textContent;


						let a = 1;

						plus.addEventListener('click', () => {
							a++
							a = (a < 10) ? "0" + a
								: a;
							num.innerHTML = a;
							console.log(num.textContent);
						})
						minus.addEventListener('click', () => {
							a--
							if (a > 0 && a < 10) {
								num.innerHTML = "0" + a;
								console.log(num.textContent);
							}
							else if (a < 1) {
								a = 1;
								num.innerHTML = "0" + a;
								console.log(num.textContent);
							}
							else {
								num.innerHTML = a;
								console.log(num.textContent);
							}
						})

						const addToCarBtn = document.getElementById("addToCarBtn");
						addToCarBtn.addEventListener('click', function () {
							let productId = "${chosenProduct.productId}"
						})

						//提交的功能
						function submit(){ 
							var sessionData = document.getElementById("memberID").value
							var productId = parseInt(document.getElementById("productID").value)
							console.log(sessionData=='')
							if((sessionData!='')){
								console.log(sessionData);
								axios({
									method:'post',
									url: 'http://localhost:8080/onlinelearning/shopCar/addToCar',
									params: {
										memberId:parseInt(sessionData),
										productId:productId,
										num:parseInt(num.textContent)
									}
								})
								.then( window.alert("成功加入購物車"))
								.catch( (error) => console.log(error))
							}else{
								console.log("沒有登入喔!");
								window.alert("請先登入")
								window.location.href="http://localhost:8080/onlinelearning/Membership/login";
							}
						}

					</script>
			<!-- <div>
				<input type="text" value="${sessionScope.loginMember.memberId}" id="memberID">
			</div>



			<script>
				function submit(){ 
					var sessionData = document.getElementById("memberID").value

					console.log(sessionData);
				}

			</script> -->
					
					
					<script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
					<script src="${contextRoot}/js/siao/bootstrap.bundle.min.js" type="text/javascript"></script>
				</body>

				</html>