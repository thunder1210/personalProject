<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon"
	href="${contextRoot}/images/thunder/favicon.ico" type="image/x-icon">
<meta charset="UTF-8">
<meta content="" name="description">
<meta content="" name="keywords">
<title>學習平台後台管理系統</title>

<link href="${contextRoot}/css/siao/bootstrap.min.css" rel="stylesheet" />

<!-- Favicons -->
<link href="${contextRoot}/backendSystem/assets/img/favicon.png"
	rel="icon">
<link
	href="${contextRoot}/backendSystem/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">
<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<!-- Vendor CSS Files -->
<link
	href="${contextRoot}/backendSystem/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${contextRoot}/backendSystem/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${contextRoot}/backendSystem/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="${contextRoot}/backendSystem/assets/vendor/quill/quill.snow.css"
	rel="stylesheet">
<link
	href="${contextRoot}/backendSystem/assets/vendor/quill/quill.bubble.css"
	rel="stylesheet">
<link
	href="${contextRoot}/backendSystem/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link
	href="${contextRoot}/backendSystem/assets/vendor/simple-datatables/style.css"
	rel="stylesheet">
<!-- Template Main CSS File -->
<link href="${contextRoot}/backendSystem/assets/css/style.css"
	rel="stylesheet">
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
			<form class="search-form d-flex align-items-center" method="POST"
				action="#">
				<input type="text" name="query" placeholder="要找什麼內容?"
					title="Enter search keyword">
				<button type="submit" title="Search">
					<i class="bi bi-search"></i>
				</button>
			</form>
		</div>
		<!-- End Search Bar -->

		<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">

				<li class="nav-item d-block d-lg-none"><a
					class="nav-link nav-icon search-bar-toggle " href="#"> <i
						class="bi bi-search"></i>
				</a></li>
				<!-- End Search Icon-->

				<li class="nav-item dropdown"><a class="nav-link nav-icon"
					href="#" data-bs-toggle="dropdown"> <i class="bi bi-bell"></i>
						<span class="badge bg-primary badge-number">4</span>
				</a>
				<!-- End Notification Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
						<li class="dropdown-header">You have 4 new notifications <a
							href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View
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
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-x-circle text-danger"></i>
							<div>
								<h4>Atque rerum nesciunt</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>1 hr. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-check-circle text-success"></i>
							<div>
								<h4>Sit rerum fuga</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>2 hrs. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-info-circle text-primary"></i>
							<div>
								<h4>Dicta reprehenderit</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>4 hrs. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>
						<li class="dropdown-footer"><a href="#">Show all
								notifications</a></li>

					</ul>
					<!-- End Notification Dropdown Items --></li>
				<!-- End Notification Nav -->

				<li class="nav-item dropdown"><a class="nav-link nav-icon"
					href="#" data-bs-toggle="dropdown"> <i
						class="bi bi-chat-left-text"></i> <span
						class="badge bg-success badge-number">3</span>
				</a>
				<!-- End Messages Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
						<li class="dropdown-header">You have 3 new messages <a
							href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View
									all</span></a>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="message-item"><a href="#"> <img
								src="${contextRoot}/backendSystem/assets/img/messages-1.jpg"
								alt="" class="rounded-circle">
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
								src="${contextRoot}/backendSystem/assets/img/messages-2.jpg"
								alt="" class="rounded-circle">
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
								src="${contextRoot}/backendSystem/assets/img/messages-3.jpg"
								alt="" class="rounded-circle">
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

					</ul>
					<!-- End Messages Dropdown Items --></li>
				<!-- End Messages Nav -->

				<li class="nav-item dropdown pe-3">
					<%--             <img src="${contextRoot}/backendSystem/assets/img/profile-img.jpg" alt="Profile" class="rounded-circle"> --%>
					<!--             <span class="d-none d-md-block dropdown-toggle ps-2">後台使用者</span> -->
					<!--           </a>End Profile Iamge Icon --> <!--           <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile"> -->
					<!--             <li class="dropdown-header"> --> <!--               <h6>後台使用者</h6> -->
					<!--               <span>後台使用者</span> --> <!--             </li> -->
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

			<li class="nav-item"><a class="nav-link " href="index.html">
					<i class="bi bi-grid"></i> <span>線上學習平台管理系統</span>
			</a></li>
			<!-- End Dashboard Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-menu-button-wide"></i><span>閒置空模塊</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="components-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="components-alerts.html"> <i
							class="bi bi-circle"></i><span>模塊內連結</span>
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
				</ul></li>
			<!-- End Components Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-journal-text"></i><span>閒置空模塊</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="forms-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="forms-elements.html"> <i class="bi bi-circle"></i><span>模塊內連結</span>
					</a></li>
					<li><a href="forms-layouts.html"> <i class="bi bi-circle"></i><span>模塊內連結</span>
					</a></li>
					<li><a href="forms-editors.html"> <i class="bi bi-circle"></i><span>模塊內連結</span>
					</a></li>
					<li><a href="forms-validation.html"> <i
							class="bi bi-circle"></i><span>模塊內連結</span>
					</a></li>
				</ul></li>
			<!-- End Forms Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-layout-text-window-reverse"></i><span>閒置空模塊</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="tables-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="tables-general.html"> <i class="bi bi-circle"></i><span>模塊內連結</span>
					</a></li>
					<li><a href="tables-data.html"> <i class="bi bi-circle"></i><span>模塊內連結</span>
					</a></li>
				</ul></li>
			<!-- End Tables Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-bar-chart"></i><span>閒置空模塊</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="charts-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="charts-chartjs.html"> <i class="bi bi-circle"></i><span>模塊內連結</span>
					</a></li>
					<li><a href="charts-apexcharts.html"> <i
							class="bi bi-circle"></i><span>模塊內連結</span>
					</a></li>
					<li><a href="charts-echarts.html"> <i class="bi bi-circle"></i><span>模塊內連結</span>
					</a></li>
				</ul></li>
			<!-- End Charts Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-gem"></i><span>閒置空模塊</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="icons-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="icons-bootstrap.html"> <i
							class="bi bi-circle"></i><span>模塊內連結</span>
					</a></li>
					<li><a href="icons-remix.html"> <i class="bi bi-circle"></i><span>模塊內連結</span>
					</a></li>
					<li><a href="icons-boxicons.html"> <i class="bi bi-circle"></i><span>模塊內連結</span>
					</a></li>
				</ul></li>
			<!-- End Icons Nav -->

			<li class="nav-heading">第二個連結層</li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="users-profile.html"> <i class="bi bi-person"></i> <span>閒置空模塊</span>
			</a></li>
			<!-- End Profile Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="pages-faq.html"> <i class="bi bi-question-circle"></i> <span>閒置空模塊</span>
			</a></li>
			<!-- End F.A.Q Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="pages-contact.html"> <i class="bi bi-envelope"></i> <span>閒置空模塊</span>
			</a></li>
			<!-- End Contact Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="pages-register.html"> <i class="bi bi-card-list"></i> <span>閒置空模塊</span>
			</a></li>
			<!-- End Register Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="pages-login.html"> <i class="bi bi-box-arrow-in-right"></i>
					<span>閒置空模塊</span>
			</a></li>
			<!-- End Login Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="pages-blank.html"> <i class="bi bi-file-earmark"></i> <span>閒置空模塊</span>
			</a></li>
			<!-- End Blank Page Nav -->

		</ul>

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


							<form:form action="${contextRoot}/products/putedit"
								modelAttribute="product" method="put" class="row g-3"
								enctype="multipart/form-data">
								<form:input type="hidden" path="productId" class="form-control"></form:input>


								<div class="col-md-12">
									<label class="form-label">商品名稱: </label>
									<form:input path="productName" class="form-control"></form:input>
								</div>
								<div class="col-md-6">
									<label class="form-label">商品價錢: </label>
									<form:input path="productPrice" class="form-control"></form:input>
								</div>
								<div class="col-md-6">
									<label for="validationCustom01" class="form-label">商品數量:
									</label>
									<form:input path="productAmount" class="form-control"></form:input>
								</div>

								<label class="form-label">商品種類: </label>
								<div class="flex">
									<form:input type="hidden" path="productType"
										class="form-control" id="type" value="${product.productType}"></form:input>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="Type"
											id="typeBook" value="1"> <label
											class="form-check-label" for="flexRadioDefault1"> 書籍
										</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="Type"
											id="typeMedia" value="2"> <label
											class="form-check-label" for="flexRadioDefault2"> 影音
										</label>
									</div>
								</div>

								<div class="col-md-4">
									<label for="validationCustom01" class="form-label">作者:
									</label>
									<form:input path="productCreater" class="form-control"></form:input>
								</div>
								<div class="col-md-4">
									<label for="validationCustom01" class="form-label">出版社:
									</label>
									<form:input path="productPublisher" class="form-control"></form:input>
								</div>
								<div class="col-md-4">
									<label for="validationCustom01" class="form-label">製造日期:
									</label>
									<form:input path="productDate" class="form-control"></form:input>
								</div>

								<br> 商品圖片:
							<br>
							上傳檔案:

							<div>
									<!-- 			還是一樣先抓photo並顯示 上傳時先用原來的上傳 丟到controller -->
									<!-- 			另開一input 並設定名字，在controller 做判斷 若有輸入則取代 -->

									<form:input path="productPhoto" type="text"
										style="visibility: hidden;" value="${product.productPhoto}" />


									<img id="origin" style="width: 180px;"
										src="${product.productPhoto}"> <img id="output"
										width="200" /> <input type="file" name="photoFile"
										id="photoFileInput" accept="image/*"
										onchange="loadFile(event)">
								</div>
								<label class="form-label">上架: </label>

								<div class="flex">

									<form:input type="hidden" path="onSelve" class="form-control"
										id="inputselve" value="${product.onSelve}"></form:input>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="selve"
											id="onSelve" value="1"> <label
											class="form-check-label" for="flexRadioDefault1"> 上架
										</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="selve"
											id="offSelve" value="0"> <label
											class="form-check-label" for="flexRadioDefault2">下架</label>
									</div>
								</div>
								<jstl:choose>
									<jstl:when test="${empty course.courseId}">
										<input type="hidden" name="courseId" value="0">
									</jstl:when>
									<jstl:otherwise>
										<input type="hidden" name="courseId" value="${course.courseId}">
									</jstl:otherwise>
								</jstl:choose>

								<button type="submit" class="btn btn-primary" id="change">修改</button>
							</form:form>
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

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script
		src="${contextRoot}/backendSystem/assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script
		src="${contextRoot}/backendSystem/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="${contextRoot}/backendSystem/assets/vendor/chart.js/chart.umd.js"></script>
	<script
		src="${contextRoot}/backendSystem/assets/vendor/echarts/echarts.min.js"></script>
	<script
		src="${contextRoot}/backendSystem/assets/vendor/quill/quill.min.js"></script>
	<script
		src="${contextRoot}/backendSystem/assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script
		src="${contextRoot}/backendSystem/assets/vendor/tinymce/tinymce.min.js"></script>
	<script
		src="${contextRoot}/backendSystem/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="${contextRoot}/backendSystem/assets/js/main.js"></script>

	<script type="text/javascript">
		const type = document.getElementById('type');
		const typeBook = document.getElementById('typeBook');
		const typeMedia = document.getElementById('typeMedia');
		const inselve = document.getElementById('inputselve');
		const onSelve = document.getElementById('onSelve');
		const offSelve = document.getElementById('offSelve');
		window.onload = function productTypeConfirm() {
			if (type.value == 1) {
				typeBook.checked = true;
			} else {
				typeMedia.checked = true;
			}

			if (inselve.value == 1) {
				onSelve.checked = true;
			} else {
				offSelve.checked = true;
			}
		}
		const button = document.getElementById('change');
		button.addEventListener('click', returnTypeByInt)

		function returnTypeByInt() {
			if (typeBook.checked) {
				type.value = 1;
			} else {
				type.value = 2;
			}
			if (onSelve.checked) {
				inselve.value = 1;
			} else {
				inselve.value = 0;
			}
		}

		function loadFile(event) {
			var image = document.getElementById('output');
			image.src = URL.createObjectURL(event.target.files[0]);
			var originimage = document.getElementById("origin");
			originimage.style.display = "none";
		};
		
		
	</script>

</body>

</html>