<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
			<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
				<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

				<!DOCTYPE html>
				<html>

				<head>
					<link rel="shortcut icon" href="${contextRoot}/images/thunder/favicon.ico" type="image/x-icon">
					<meta charset="UTF-8">
					<meta content="" name="description">
					<meta content="" name="keywords">
					<title>學習平台後台管理系統</title>

					<link href="${contextRoot}/css/siao/bootstrap.min.css" rel="stylesheet" />

					<!-- Favicons -->
					<link href="${contextRoot}/backendSystem/assets/img/favicon.png" rel="icon">
					<link href="${contextRoot}/backendSystem/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
					<!-- Google Fonts -->
					<link href="https://fonts.gstatic.com" rel="preconnect">
					<link
						href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
						rel="stylesheet">
					<!-- Vendor CSS Files -->
					<link href="${contextRoot}/backendSystem/assets/vendor/bootstrap/css/bootstrap.min.css"
						rel="stylesheet">
					<link href="${contextRoot}/backendSystem/assets/vendor/bootstrap-icons/bootstrap-icons.css"
						rel="stylesheet">
					<link href="${contextRoot}/backendSystem/assets/vendor/boxicons/css/boxicons.min.css"
						rel="stylesheet">
					<link href="${contextRoot}/backendSystem/assets/vendor/quill/quill.snow.css" rel="stylesheet">
					<link href="${contextRoot}/backendSystem/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
					<link href="${contextRoot}/backendSystem/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
					<link href="${contextRoot}/backendSystem/assets/vendor/simple-datatables/style.css"
						rel="stylesheet">
					<!-- Template Main CSS File -->
					<link href="${contextRoot}/backendSystem/assets/css/style.css" rel="stylesheet">
				</head>

				<body>

					<!-- ======= Header ======= -->
					<header id="header" class="header fixed-top d-flex align-items-center">

						<div class="d-flex align-items-center justify-content-between">
							<a href="index.html" class="logo d-flex align-items-center"> <img
									src="${contextRoot}/backendSystem/assets/img/logo.png" alt="">
								<span class="d-none d-lg-block">線上學習平台</span>
							</a> <i class="bi bi-list toggle-sidebar-btn"></i>
						</div>
						<!-- End Logo -->

						<div class="search-bar">
							<form class="search-form d-flex align-items-center" method="POST" action="#">
								<input type="text" name="query" placeholder="要找什麼內容?" title="Enter search keyword">
								<button type="submit" title="Search">
									<i class="bi bi-search"></i>
								</button>
							</form>
						</div>
						<!-- End Search Bar -->

						<nav class="header-nav ms-auto">
							<ul class="d-flex align-items-center">

								<li class="nav-item d-block d-lg-none"><a class="nav-link nav-icon search-bar-toggle "
										href="#"> <i class="bi bi-search"></i>
									</a></li>
								<!-- End Search Icon-->

								<li class="nav-item dropdown"><a class="nav-link nav-icon" href="#"
										data-bs-toggle="dropdown"> <i class="bi bi-bell"></i>
										<span class="badge bg-primary badge-number">4</span>
									</a> <!-- End Notification Icon -->

									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
										<li class="dropdown-header">You have 4 new notifications <a href="#"><span
													class="badge rounded-pill bg-primary p-2 ms-2">View
													all</span></a>
										</li>
										<li>
											<hr class="dropdown-divider">
										</li>

										<li class="notification-item"><i
												class="bi bi-exclamation-circle text-warning"></i>
											<div>
												<h4>Lorem Ipsum</h4>
												<p>Quae dolorem earum veritatis oditseno</p>
												<p>30 min. ago</p>
											</div>
										</li>

										<li>
											<hr class="dropdown-divider">
										</li>

										<li class="notification-item"><i class="bi bi-x-circle text-danger"></i>
											<div>
												<h4>Atque rerum nesciunt</h4>
												<p>Quae dolorem earum veritatis oditseno</p>
												<p>1 hr. ago</p>
											</div>
										</li>

										<li>
											<hr class="dropdown-divider">
										</li>

										<li class="notification-item"><i class="bi bi-check-circle text-success"></i>
											<div>
												<h4>Sit rerum fuga</h4>
												<p>Quae dolorem earum veritatis oditseno</p>
												<p>2 hrs. ago</p>
											</div>
										</li>

										<li>
											<hr class="dropdown-divider">
										</li>

										<li class="notification-item"><i class="bi bi-info-circle text-primary"></i>
											<div>
												<h4>Dicta reprehenderit</h4>
												<p>Quae dolorem earum veritatis oditseno</p>
												<p>4 hrs. ago</p>
											</div>
										</li>

										<li>
											<hr class="dropdown-divider">
										</li>
										<li class="dropdown-footer"><a href="#">Show all
												notifications</a></li>

									</ul> <!-- End Notification Dropdown Items -->
								</li>
								<!-- End Notification Nav -->

								<li class="nav-item dropdown"><a class="nav-link nav-icon" href="#"
										data-bs-toggle="dropdown"> <i class="bi bi-chat-left-text"></i> <span
											class="badge bg-success badge-number">3</span>
									</a> <!-- End Messages Icon -->

									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
										<li class="dropdown-header">You have 3 new messages <a href="#"><span
													class="badge rounded-pill bg-primary p-2 ms-2">View
													all</span></a>
										</li>
										<li>
											<hr class="dropdown-divider">
										</li>

										<li class="message-item"><a href="#"> <img
													src="${contextRoot}/backendSystem/assets/img/messages-1.jpg" alt=""
													class="rounded-circle">
												<div>
													<h4>Maria Hudson</h4>
													<p>Velit asperiores et ducimus soluta repudiandae labore
														officia est ut...</p>
													<p>4 hrs. ago</p>
												</div>
											</a></li>
										<li>
											<hr class="dropdown-divider">
										</li>

										<li class="message-item"><a href="#"> <img
													src="${contextRoot}/backendSystem/assets/img/messages-2.jpg" alt=""
													class="rounded-circle">
												<div>
													<h4>Anna Nelson</h4>
													<p>Velit asperiores et ducimus soluta repudiandae labore
														officia est ut...</p>
													<p>6 hrs. ago</p>
												</div>
											</a></li>
										<li>
											<hr class="dropdown-divider">
										</li>

										<li class="message-item"><a href="#"> <img
													src="${contextRoot}/backendSystem/assets/img/messages-3.jpg" alt=""
													class="rounded-circle">
												<div>
													<h4>David Muldon</h4>
													<p>Velit asperiores et ducimus soluta repudiandae labore
														officia est ut...</p>
													<p>8 hrs. ago</p>
												</div>
											</a></li>
										<li>
											<hr class="dropdown-divider">
										</li>

										<li class="dropdown-footer"><a href="#">Show all messages</a>
										</li>

									</ul> <!-- End Messages Dropdown Items -->
								</li>
								<!-- End Messages Nav -->

								<li class="nav-item dropdown pe-3">
							</ul>
							<!-- End Profile Dropdown Items -->
							</li>
							<!-- End Profile Nav -->

							</ul>
						</nav>
						<!-- End Icons Navigation -->

					</header>
					<!-- End Header -->

					<!-- ======= Sidebar ======= -->
					<aside id="sidebar" class="sidebar">

						<ul class="sidebar-nav" id="sidebar-nav">

							<li class="nav-item"><a class="nav-link " href="${contextRoot}/index.html"> <i
										class="bi bi-grid"></i> <span>線上學習平台管理系統</span>
								</a></li>
							<!-- End Dashboard Nav -->

							<li class="nav-item"><a class="nav-link collapsed" data-bs-target="#components-nav"
									data-bs-toggle="collapse" href="#">
									<i class="bi bi-menu-button-wide"></i><span>閒置空模塊</span><i
										class="bi bi-chevron-down ms-auto"></i>
								</a>
								<ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
									<li><a href="components-alerts.html"> <i class="bi bi-circle"></i><span>模塊內連結</span>
										</a></li>
									<li><a href="components-accordion.html"> <i
												class="bi bi-circle"></i><span>模塊內連結</span>
										</a></li>
									<li><a href="components-spinners.html"> <i
												class="bi bi-circle"></i><span>模塊內連結</span>
										</a></li>
									<li><a href="components-tooltips.html"> <i
												class="bi bi-circle"></i><span>模塊內連結</span>
										</a></li>
								</ul>
							</li>
							<!-- End Components Nav -->

							<li class="nav-item"><a class="nav-link collapsed" data-bs-target="#forms-nav"
									data-bs-toggle="collapse" href="#">
									<i class="bi bi-journal-text"></i><span>閒置空模塊</span><i
										class="bi bi-chevron-down ms-auto"></i>
								</a>
								<ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
									<li><a href="forms-elements.html"> <i class="bi bi-circle"></i><span>模塊內連結</span>
										</a></li>
									<li><a href="forms-layouts.html"> <i class="bi bi-circle"></i><span>模塊內連結</span>
										</a></li>
									<li><a href="forms-editors.html"> <i class="bi bi-circle"></i><span>模塊內連結</span>
										</a></li>
									<li><a href="forms-validation.html"> <i class="bi bi-circle"></i><span>模塊內連結</span>
										</a></li>
								</ul>
							</li>
							<!-- End Forms Nav -->

							<li class="nav-item"><a class="nav-link collapsed" data-bs-target="#tables-nav"
									data-bs-toggle="collapse" href="#">
									<i class="bi bi-layout-text-window-reverse"></i><span>閒置空模塊</span><i
										class="bi bi-chevron-down ms-auto"></i>
								</a>
								<ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
									<li><a href="tables-general.html"> <i class="bi bi-circle"></i><span>模塊內連結</span>
										</a></li>
									<li><a href="tables-data.html"> <i class="bi bi-circle"></i><span>模塊內連結</span>
										</a></li>
								</ul>
							</li>
							<!-- End Tables Nav -->

							<li class="nav-item"><a class="nav-link collapsed" data-bs-target="#charts-nav"
									data-bs-toggle="collapse" href="#">
									<i class="bi bi-bar-chart"></i><span>閒置空模塊</span><i
										class="bi bi-chevron-down ms-auto"></i>
								</a>
								<ul id="charts-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
									<li><a href="charts-chartjs.html"> <i class="bi bi-circle"></i><span>模塊內連結</span>
										</a></li>
									<li><a href="charts-apexcharts.html"> <i class="bi bi-circle"></i><span>模塊內連結</span>
										</a></li>
									<li><a href="charts-echarts.html"> <i class="bi bi-circle"></i><span>模塊內連結</span>
										</a></li>
								</ul>
							</li>
							<!-- End Charts Nav -->

							<li class="nav-item"><a class="nav-link collapsed" data-bs-target="#icons-nav"
									data-bs-toggle="collapse" href="#">
									<i class="bi bi-gem"></i><span>閒置空模塊</span><i
										class="bi bi-chevron-down ms-auto"></i>
								</a>
								<ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
									<li><a href="icons-bootstrap.html"> <i class="bi bi-circle"></i><span>模塊內連結</span>
										</a></li>
									<li><a href="icons-remix.html"> <i class="bi bi-circle"></i><span>模塊內連結</span>
										</a></li>
									<li><a href="icons-boxicons.html"> <i class="bi bi-circle"></i><span>模塊內連結</span>
										</a></li>
								</ul>
							</li>
							<!-- End Icons Nav -->
					</aside>
					<!-- End Sidebar-->

					<main id="main" class="main">

						<div class="pagetitle">
							<h1>線上學習平台管理後台系統</h1>
							<nav>
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">首頁</a></li>
									<li class="breadcrumb-item active">導覽頁面</li>
								</ol>
							</nav>
						</div>
						<!-- End Page Title -->

						<section class="section dashboard">
							<div class="row">

								<!-- Left side columns -->
								<!-- 東西塞這邊 -->
								<div class="col-lg-8">
									<div class="row">

										<div class="container">
											<div class="container">
												<div class="d-flex">
													<form action="${contextRoot}/shopCar/searchByChoosedId" method="get"
														onsubmit="return check();">
														查詢訂單: <select class="form-select col-md-4"
															aria-label="Default select example" id="selectedValue"
															name="selectedValueIN">
															<option value=0 selected disabled>請選擇選項</option>
															<option value=1>會員ID</option>
															<option value=2>商品ID</option>
														</select>
														<input type="text" name="searchbarIN">

														<button type="submit" class="btn btn-outline-dark moveRight"
															id="searchBtn">查詢</button>
													</form>
												</div>

												<table class="table">

													<thead>
														<tr>
<<<<<<< HEAD
															<th scope="col">Buying By(MemeberId)</th>
															<th scope="col">ProductId</th>
															<th scope="col">BuyingAmount</th>
															<th scope="col">Payed</th>
=======
															<th scope="col">訂單編號</th>
															<th scope="col">訂單日期</th>
															<th scope="col">付款狀態</th>
															<th scope="col">訂購人</th>
															<th scope="col">合計</th>
>>>>>>> a52d9522294e4cc456d270abed6ce82e738958d6
														</tr>
													</thead>
													<tbody id="showShopList">
														<jstl:forEach var="order" items="${allOrder}">
															<tr>
<<<<<<< HEAD
																<td>${car.member.memberId}</td>
																<td>${car.product.productId}</td>
																<td>${car.shoppingCartAmount}</td>
																<td>
																	<jstl:choose>
																		<jstl:when test="${car.payed == 1}">
																			已付款
																		</jstl:when>
																		<jstl:otherwise>
																			未付款
																		</jstl:otherwise>
																	</jstl:choose>
																</td>
																<td scope="col">
																	<div class="edit-place" style="display: flex">
																		<form action="${contextRoot}/products/edit"
																			method="get">
																			<input type="hidden"
																				value="${car.shoppingCartId}"
																				name="id1">
																			<button type="submit"
																				class="btn btn-warning">修改</button>
																		</form>

																		<form action="${contextRoot}/shopCar/delete"
																			method="post"
																			onsubmit="return confirmation();">
																			<input name="_method" type="hidden"
																				value="delete" /> <input type="hidden"
																				value="${car.shoppingCartId}" name="id">
																			<button type="submit" class="btn btn-danger"
																				id="deleteBtn">刪除</button>
																		</form>
																	</div>
																</td>
=======
																<td onclick="showThatList()">${order.orderId}</td>
																<td>${order.orderTime}</td>
												  				<td>${order.payed}</td>
																<td>${order.member.memberId}</td>
																<td>${order.totalPrice}</td>
>>>>>>> a52d9522294e4cc456d270abed6ce82e738958d6
															</tr>
														</jstl:forEach>
													</tbody>
												</table>
											</div>

											<!-- <script>
												function confirmation() {
													var result = confirm("確定要刪除嗎(需先與客戶確認過喔)?");
													if (result) {
														console.log("Deleted");

													} else {
														console.log("cancel!");
														return false;
													}
												}
											</script> -->


										</div>

									</div>
								</div>
								<!-- End Left side columns -->

								<!-- Right side columns -->
								<div class="col-lg-4"></div>
								<!-- End Right side columns -->

							</div>
						</section>

					</main>
					<!-- End #main -->

					<!-- ======= Footer ======= -->
					<footer id="footer" class="footer">
						<div class="copyright">
							&copy; Copyright <strong><span>線上學習平台</span></strong>. All Rights
							Reserved
						</div>
						<div class="credits">
							<!-- All the links in the footer should remain intact. -->
							<!-- You can delete the links only if you purchased the pro version. -->
							<!-- Licensing information: https://bootstrapmade.com/license/ -->
							<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
							Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
						</div>
					</footer>
					<!-- End Footer -->

					<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
							class="bi bi-arrow-up-short"></i></a>


					<script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
					<script>



						// (selectedValue == "none" && searchbarValue !== "")
						// 	|| (selectedValue == "none" && searchbarValue == "")
						function check() {
							let searchBtn = document.getElementById("searchBtn")
							var selectedValue = document.getElementById("selectedValue").value
							var searchbarValue = document.getElementsByName("searchbar")[0].value
							console.log(selectedValue);
							if ((selectedValue == "0" && searchbarValue !== "")
								|| (selectedValue == "0" && searchbarValue == "")) {
								console.log(selectedValue);
								console.log("請先選擇想用甚麼搜尋")
								alert("請先選擇想用甚麼搜尋");
								return false;
							} else if ((selectedValue != "0" && searchbarValue == "")) {
								console.log("請輸入想搜尋的ID")
								alert("請輸入想搜尋的ID");
								return false;
							} else {
								
								var value = e.value;
								var text = e.options[e.selectedIndex].text;
								return true;
								// let reqUrl = 'http://localhost:8080/onlinelearning/shopCar/searchByChoosedId';
								// axios.get(reqUrl, {
								// 	params: {
								// 		selectedValueIN: selectedValue
								// 		, searchbarIN: searchbarValue
								// 	}
								// })
								// 	.then(res => {
								// 		console.log(res.data)
								// 		showInFront(res.data)
								// 		console.log(res)
								// 	})
								// 	.catch(err => {
								// 		console.error(err);
								// 	})
							}
						}

						// function showInFront(data) {
						// 	const showShopList = document.getElementById("showShopList");
						// 	showShopList.innerHTML = ""
						// 	data.forEach(element => {

						// 	});
						// }
					</script>

					<!-- Vendor JS Files -->
					<script src="${contextRoot}/backendSystem/assets/vendor/apexcharts/apexcharts.min.js"></script>
					<script
						src="${contextRoot}/backendSystem/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
					<script src="${contextRoot}/backendSystem/assets/vendor/chart.js/chart.umd.js"></script>
					<script src="${contextRoot}/backendSystem/assets/vendor/echarts/echarts.min.js"></script>
					<script src="${contextRoot}/backendSystem/assets/vendor/quill/quill.min.js"></script>
					<script
						src="${contextRoot}/backendSystem/assets/vendor/simple-datatables/simple-datatables.js"></script>
					<script src="${contextRoot}/backendSystem/assets/vendor/tinymce/tinymce.min.js"></script>
					<script src="${contextRoot}/backendSystem/assets/vendor/php-email-form/validate.js"></script>

					<!-- Template Main JS File -->
					<script src="${contextRoot}/backendSystem/assets/js/main.js"></script>


				</body>

				</html>