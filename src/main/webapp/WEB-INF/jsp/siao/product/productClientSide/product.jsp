<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<style>
card {
    --bs-card-spacer-y: 1rem;
    --bs-card-spacer-x: 1rem;
    --bs-card-title-spacer-y: 0.5rem;
    --bs-card-border-width: 1px;
    --bs-card-border-color: var(--bs-border-color-translucent);
    --bs-card-border-radius: 0.375rem;
    --bs-card-box-shadow: ;
    --bs-card-inner-border-radius: calc(0.375rem - 1px);
    --bs-card-cap-padding-y: 0.5rem;
    --bs-card-cap-padding-x: 1rem;
    --bs-card-cap-bg: rgba(0, 0, 0, 0.03);
    --bs-card-cap-color: ;
    --bs-card-height: ;
    --bs-card-color: ;
    --bs-card-bg: #fff;
    --bs-card-img-overlay-padding: 1rem;
    --bs-card-group-margin: 0.75rem;
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    height: var(--bs-card-height);
    word-wrap: break-word;
    background-color: var(--bs-card-bg);
    background-clip: border-box;
    border: var(--bs-card-border-width) solid var(--bs-card-border-color);
    border-radius: var(--bs-card-border-radius)
}

.card>hr {
    margin-right: 0;
    margin-left: 0
}

.card>.list-group {
    border-top: inherit;
    border-bottom: inherit
}

.card>.list-group:first-child {
    border-top-width: 0;
    border-top-left-radius: var(--bs-card-inner-border-radius);
    border-top-right-radius: var(--bs-card-inner-border-radius)
}

.card>.list-group:last-child {
    border-bottom-width: 0;
    border-bottom-right-radius: var(--bs-card-inner-border-radius);
    border-bottom-left-radius: var(--bs-card-inner-border-radius)
}

.card>.card-header+.list-group,
.card>.list-group+.card-footer {
    border-top: 0
}

.card-body {
    flex: 1 1 auto;
    padding: var(--bs-card-spacer-y) var(--bs-card-spacer-x);
    color: var(--bs-card-color)
}

.card-title {
    margin-bottom: var(--bs-card-title-spacer-y)
}

.card-subtitle {
    margin-top: calc(-.5 * var(--bs-card-title-spacer-y));
    margin-bottom: 0
}

.card-text:last-child {
    margin-bottom: 0
}

.card-link+.card-link {
    margin-left: var(--bs-card-spacer-x)
}

.card-header {
    padding: var(--bs-card-cap-padding-y) var(--bs-card-cap-padding-x);
    margin-bottom: 0;
    color: var(--bs-card-cap-color);
    background-color: var(--bs-card-cap-bg);
    border-bottom: var(--bs-card-border-width) solid var(--bs-card-border-color)
}

.card-header:first-child {
    border-radius: var(--bs-card-inner-border-radius) var(--bs-card-inner-border-radius) 0 0
}

.card-footer {
    padding: var(--bs-card-cap-padding-y) var(--bs-card-cap-padding-x);
    color: var(--bs-card-cap-color);
    background-color: var(--bs-card-cap-bg);
    border-top: var(--bs-card-border-width) solid var(--bs-card-border-color)
}

.card-footer:last-child {
    border-radius: 0 0 var(--bs-card-inner-border-radius) var(--bs-card-inner-border-radius)
}

.card-header-tabs {
    margin-right: calc(-.5 * var(--bs-card-cap-padding-x));
    margin-bottom: calc(-1 * var(--bs-card-cap-padding-y));
    margin-left: calc(-.5 * var(--bs-card-cap-padding-x));
    border-bottom: 0
}

.card-header-tabs .nav-link.active {
    background-color: var(--bs-card-bg);
    border-bottom-color: var(--bs-card-bg)
}

.card-header-pills {
    margin-right: calc(-.5 * var(--bs-card-cap-padding-x));
    margin-left: calc(-.5 * var(--bs-card-cap-padding-x))
}

.card-img-overlay {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    padding: var(--bs-card-img-overlay-padding);
    border-radius: var(--bs-card-inner-border-radius)
}

.card-img,
.card-img-bottom,
.card-img-top {
    width: 100%
}

.card-img,
.card-img-top {
    border-top-left-radius: var(--bs-card-inner-border-radius);
    border-top-right-radius: var(--bs-card-inner-border-radius)
}

.card-img,
.card-img-bottom {
    border-bottom-right-radius: var(--bs-card-inner-border-radius);
    border-bottom-left-radius: var(--bs-card-inner-border-radius)
}

.card-group>.card {
    margin-bottom: var(--bs-card-group-margin)
}

@media (min-width:576px) {
    .card-group {
        display: flex;
        flex-flow: row wrap
    }

    .card-group>.card {
        flex: 1 0 0%;
        margin-bottom: 0
    }

    .card-group>.card+.card {
        margin-left: 0;
        border-left: 0
    }

    .card-group>.card:not(:last-child) {
        border-top-right-radius: 0;
        border-bottom-right-radius: 0
    }

    .card-group>.card:not(:last-child) .card-header,
    .card-group>.card:not(:last-child) .card-img-top {
        border-top-right-radius: 0
    }

    .card-group>.card:not(:last-child) .card-footer,
    .card-group>.card:not(:last-child) .card-img-bottom {
        border-bottom-right-radius: 0
    }

    .card-group>.card:not(:first-child) {
        border-top-left-radius: 0;
        border-bottom-left-radius: 0
    }

    .card-group>.card:not(:first-child) .card-header,
    .card-group>.card:not(:first-child) .card-img-top {
        border-top-left-radius: 0
    }

    .card-group>.card:not(:first-child) .card-footer,
    .card-group>.card:not(:first-child) .card-img-bottom {
        border-bottom-left-radius: 0
    }
}</style>
<meta charset="UTF-8">

<%-- <link href="${contextRoot}/css/siao/bootstrap.min.css" rel="stylesheet" /> --%>
<%-- <link href="${contextRoot}/css/siao/productclient.css" rel="stylesheet" /> --%>
<link href="${contextRoot}/css/siao/sidebars.css" rel="stylesheet" />
<link href="${contextRoot}/css/siao/carousel.css" rel="stylesheet">
<link href="${contextRoot}/css/siao/bootstrap.min.css" rel="stylesheet" />
<link rel="shortcut icon"
	href="${contextRoot}/images/thunder/Tunder_logo.ico"
	type="image/x-icon">
<meta charset="UTF-8">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="${contextRoot}/css/thunder/NavBar/NavBarStyle.css"
	rel="stylesheet">
<link href="${contextRoot}/css/thunder/NavBar/NavRunner.css"
	rel="stylesheet">
	
	<link href="${contextRoot}/css/siao/bootstrap.min.css" rel="stylesheet" />

<title>Insert title here</title>
</head>

<body>
	<div id="myOverlay" class="overlay">
		<span class="closebtn" onclick="closeSearch()" title="Close Overlay">x</span>
		<div class="overlay-content" style="margin-top: 5%">
			<form action="#">
				<input type="text" placeholder="Search.." name="search"
					style="margin-left: 8%;">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>
	</div>

	<section class="ftco-section">
		<div class="wrap">
			<div class="container">
				<div class="row justify-content-between">
					<div id="abgne_marquee">
						<div class="marquee_btn" id="marquee_next_btn"></div>
						<ul>
							<li><a style="color: white;" href="#">從《聊齋本紀》，等候下一部「不是小說的小說」──專訪小說家閻連科</a></li>
							<li><a style="color: white" href="#">晶片戰爭：矽時代的新賽局，解析地緣政治下全球最關鍵科技的創新、商業模式與台灣的未來</a></li>
							<li><a style="color: white" href="#">客服公告：反詐騙！提醒您「不碰ATM、網銀，不說信用卡資料」</a></li>
						</ul>
						<div class="marquee_btn" id="marquee_prev_btn"></div>
					</div>
					<div class="col d-flex justify-content-end">
						<div class="social-media">
							<p class="mb-0 d-flex">
								<a href="#"
									class="d-flex align-items-center justify-content-center"><span
									class="fa fa-facebook"><i class="sr-only">Facebook</i></span></a> <a
									href="#"
									class="d-flex align-items-center justify-content-center"><span
									class="fa fa-twitter"><i class="sr-only">Twitter</i></span></a> <a
									href="#"
									class="d-flex align-items-center justify-content-center"><span
									class="fa fa-instagram"><i class="sr-only">Instagram</i></span></a>
								<a href="#"
									class="d-flex align-items-center justify-content-center"><span
									class="fa fa-dribbble"><i class="sr-only">Dribbble</i></span></a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<nav
			class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" style="background-color:white !important"
			id="ftco-navbar">
			<div class="container">
				<a class="navbar-brand" href="${contextRoot}/"><img
					src="${contextRoot}/images/thunder/cuttedLogo.jpg" width="150px"
					height="50px"></a>
				<form action="#" class="searchform order-sm-start order-lg-last">
					<div class="form-group d-flex">

						<button type="submit" placeholder="" class="form-control search"
							onclick="openSearch()">
							<span class="fa fa-search"></span>
						</button>
					</div>
				</form>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#ftco-nav" aria-controls="ftco-nav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="fa fa-bars"></span> Menu
				</button>
				<div class="collapse navbar-collapse" id="ftco-nav">
					<ul class="navbar-nav m-auto">

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown04"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
							style="font-size: 16px;">線上書城</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
								<a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
								<a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
								<a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown04"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
							style="font-size: 16px;">探索學習</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
								<a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
								<a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
								<a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown04"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
							style="font-size: 16px;">講義筆記</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
								<a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
								<a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
								<a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown04"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
							style="font-size: 16px;">BLOG</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
								<a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
								<a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
								<a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
							</div></li>
						</li>

						<jstl:choose>
							<jstl:when test="${sessionScope.loginMember.memberAccount==null}">
								<li class="nav-item"><a
									href="${contextRoot}/Membership/login" class="nav-link"
									style="font-size: 16px;">登入/註冊</a></li>
							</jstl:when>
							<jstl:otherwise>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" id="dropdown04"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false" style="font-size: 16px;">會員專區</a>
									<div class="dropdown-menu" aria-labelledby="dropdown04">
										<a class="dropdown-item"
											href="${contextRoot}/Membership/memberCenter"
											style="font-size: 16px;">會員中心</a> <a class="dropdown-item"
											href="${contextRoot}/shopCar/showMyCar?memberId=${sessionScope.loginMember.memberId}"
											style="font-size: 16px;">購物車</a> <a class="dropdown-item"
											href="javascript: logout()" style="font-size: 16px;">登出</a>
									</div></li>
							</jstl:otherwise>
						</jstl:choose>
					</ul>
				</div>
			</div>
		</nav>

		<!-- <jsp:include page="../../../NavBar.jsp"></jsp:include>
					<div>
						<!-- 	最上面的功能條 -->
		<%-- 						<jsp:include page="navbar.jsp"></jsp:include> --%>
		</div>

		<!-- 	商品呈現 -->
		<div class="container">
			<div class="row">
				<!-- 		左邊的商品分類條 -->
				<div class="flex-shrink-0 p-3 bg-white col-2">
					<a href="/"
						class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
						<span class="fs-5 fw-semibold">商品列表</span>
					</a>
					<ul class="list-unstyled ps-0">
						<li class="mb-1">
							<button
								class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
								data-bs-toggle="collapse" data-bs-target="#home-collapse"
								aria-expanded="true" id="productMainPage">主頁</button>
							<div class="collapse show" id="home-collapse">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><a href="#"
										class="link-dark d-inline-flex text-decoration-none rounded">Overview</a>
									</li>
									<li><a href="#"
										class="link-dark d-inline-flex text-decoration-none rounded">Updates</a>
									</li>
									<li><a href="#"
										class="link-dark d-inline-flex text-decoration-none rounded">Reports</a>
									</li>
								</ul>
							</div>
						</li>
						<li class="mb-1">
							<button
								class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
								data-bs-toggle="collapse" data-bs-target="#dashboard-collapse"
								aria-expanded="false" id="ShowAllBookBtn">書籍</button>
							<div class="collapse" id="dashboard-collapse">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><a href="#"
										class="link-dark d-inline-flex text-decoration-none rounded">Overview</a>
									</li>
									<li><a href="#"
										class="link-dark d-inline-flex text-decoration-none rounded">Weekly</a>
									</li>
									<li><a href="#"
										class="link-dark d-inline-flex text-decoration-none rounded">Monthly</a>
									</li>
									<li><a href="#"
										class="link-dark d-inline-flex text-decoration-none rounded">Annually</a>
									</li>
								</ul>
							</div>
						</li>
						<li class="mb-1">
							<button
								class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
								data-bs-toggle="collapse" data-bs-target="#orders-collapse"
								aria-expanded="false">課程</button>
							<div class="collapse" id="orders-collapse">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><a href="#"
										class="link-dark d-inline-flex text-decoration-none rounded">New</a>
									</li>
									<li><a href="#"
										class="link-dark d-inline-flex text-decoration-none rounded">Processed</a>
									</li>
									<li><a href="#"
										class="link-dark d-inline-flex text-decoration-none rounded">Shipped</a>
									</li>
									<li><a href="#"
										class="link-dark d-inline-flex text-decoration-none rounded">Returned</a>
									</li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
				<!-- 右邊的商品呈現 -->
				<div class="col-10">
					<!--  幻燈片 -->
					<div id="carouselExampleIndicators" class="carousel slide"
						data-bs-ride="true">
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleIndicators"
								data-bs-slide-to="0" class="active" aria-current="true"
								aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators"
								data-bs-slide-to="1" aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators"
								data-bs-slide-to="2" aria-label="Slide 3"></button>
						</div>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="${contextRoot}/images/siao/slideShow1.jpg"
									class="d-block w-100">
							</div>
							<div class="carousel-item">
								<img src="${contextRoot}/images/siao/slideShow2.jpg"
									class="d-block w-100">
							</div>
							<div class="carousel-item">
								<img src="${contextRoot}/images/siao/slideShow.png"
									class="d-block w-100">
							</div>
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
					<!-- 商品呈現 -->
					<div id="showBookProductArea">
						<div id="conditionFilters" class="conditionx">
							<form action=""></form>
							<div>
								出版社: <select class="form-select col-md-4"
									aria-label="Default select example">
									<option value="none" selected disabled>請選擇選項</option>
									<option value="1">歐萊利</option>
									<option value="2">深智數位</option>
									<option value="3">碁峰資訊</option>
								</select>
							</div>
							<div>
								程式語言: <select class="form-select col-md-4"
									aria-label="Default select example">
									<option value="none" selected disabled>請選擇選項</option>
									<option value="1">C#</option>
									<option value="2">Java</option>
									<option value="3">Python</option>
								</select>
							</div>


							<button type="button" class="btn btn-outline-success"
								id="conditionBtn">送出條件</button>
						</div>
						<div id="showSomeBookArea"
							class="row row-cols-1 row-cols-md-auto g-4"></div>
						<br>

						<div id="jumpPage" class=""></div>
					</div>
				</div>
			</div>


		</div>
		<script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
		<script src="${contextRoot}/js/siao/bootstrap.bundle.min.js"
			type="text/javascript"></script>
		<script src="${contextRoot}/js/siao/sidebars.js"
			type="text/javascript"></script>
		<script>
			const slideShow = document
					.getElementById('carouselExampleIndicators');
			const showAllBookBtn = document.getElementById('ShowAllBookBtn');
			const showAllBookArea = document
					.getElementById('showBookProductArea');
			const showSomeBookArea = document
					.getElementById('showSomeBookArea');
			const jumspPage = document.getElementById('jumpPage');
			const mainpage = document.getElementById('productMainPage'), conditionBtn = document
					.getElementById('conditionBtn');
		</script>
		<script src="${contextRoot}/js/siao/showAllBook.js"
			type="text/javascript"></script>
</body>

</html>