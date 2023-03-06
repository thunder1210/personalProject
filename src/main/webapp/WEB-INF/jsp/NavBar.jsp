<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${contextRoot}/images/thunder/Tunder_logo.ico" type="image/x-icon">
<meta charset="UTF-8">
<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="${contextRoot}/css/thunder/NavBar/NavBarStyle.css" rel="stylesheet">
  <link href="${contextRoot}/css/thunder/NavBar/NavRunner.css" rel="stylesheet">
<title>NavBar</title>
</head>
<body>
<body>
<div id="myOverlay" class="overlay">
		  <span class="closebtn" onclick="closeSearch()" title="Close Overlay">x</span>
		  <div class="overlay-content" style="margin-top:5%">
		    <form action="">
		      <input type="text" placeholder="請輸入您要搜尋的內容....." name="search" style="margin-left:8%;">
		      <button><i class="fa fa-search" ></i></button>
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
			<li><a style="color:white;" href="#">從《聊齋本紀》，等候下一部「不是小說的小說」──專訪小說家閻連科</a></li>
			<li><a style="color:white" href="#">晶片戰爭：矽時代的新賽局，解析地緣政治下全球最關鍵科技的創新、商業模式與台灣的未來</a></li>
			<li><a style="color:white" href="#">客服公告：反詐騙！提醒您「不碰ATM、網銀，不說信用卡資料」</a></li>
		</ul>
		<div class="marquee_btn" id="marquee_prev_btn"></div>
				</div>
					<div class="col d-flex justify-content-end">
						<div class="social-media">
				    		<p class="mb-0 d-flex">
				    			<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-facebook"><i class="sr-only">Facebook</i></span></a>
				    			<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-twitter"><i class="sr-only">Twitter</i></span></a>
				    			<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-instagram"><i class="sr-only">Instagram</i></span></a>
				    			<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-dribbble"><i class="sr-only">Dribbble</i></span></a>
				    		</p>
			        	</div>
					</div>
				</div>
			</div>
		</div>
		<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar" style="z-index:9999">
	    <div class="container">
	    	<a class="navbar-brand" href="${contextRoot}/"><img src="${contextRoot}/images/thunder/cuttedLogo.jpg" width="150px" height="50px"></a>
	    	<form action="#" class="searchform order-sm-start order-lg-last">
          <div class="form-group d-flex">
            <button type="reset" placeholder="" class="form-control search" onclick="openSearch()"><span class="fa fa-search"></span></button>
          </div>
        </form>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="fa fa-bars"></span> Menu
	      </button>
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav m-auto">
	        	<li class="nav-item"><a href="${contextRoot}/" class="nav-link" style="font-size: 16px;">首頁</a></li>
	        	<li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 16px;">線上書城</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04" >
              	<a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
                <a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
                <a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
                <a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
              </div>
            </li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 16px;">探索學習</a>
				<div class="dropdown-menu" aria-labelledby="dropdown04">
					<a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
				  <a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
				  <a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
				  <a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
				</div>
			  </li>
			  <li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 16px;">講義筆記</a>
				<div class="dropdown-menu" aria-labelledby="dropdown04">
				  <a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
				  <a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
				  <a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
				  <a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
				</div>
			  </li>			
			  <li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 16px;">BLOG</a>
				<div class="dropdown-menu" aria-labelledby="dropdown04">
				  <a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
				  <a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
				  <a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
				  <a class="dropdown-item" href="#" style="font-size: 16px;">--------------</a>
				</div>
			  </li>
	
			  <jstl:choose>
			<jstl:when test="${sessionScope.loginMember.memberAccount==null}">
				<li class="nav-item"><a href="${contextRoot}/Membership/login" class="nav-link" style="font-size: 16px;">登入/註冊</a></li>
			  </jstl:when>
			  <jstl:otherwise>
			  <li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 16px;">會員專區</a>
				<div class="dropdown-menu" aria-labelledby="dropdown04">
				<a class="dropdown-item" href="${contextRoot}/Membership/memberCenter" style="font-size: 16px;">會員中心</a>
				<a class="dropdown-item" href="${contextRoot}/shopCar/showMyCar?memberId=${sessionScope.loginMember.memberId}" style="font-size: 16px;">購物車</a>
				  <a class="dropdown-item" href="javascript: logout()" style="font-size: 16px;">登出</a>
				</div>
			  </li>
			  </jstl:otherwise>
			  </jstl:choose>
	        </ul>
	      </div>
	    </div>
	  </nav>
			   
    <!-- END nav -->

	</section>
	  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
	  <script src="${contextRoot}/js/thunder/NavBar/NavBootstrap.min.js"></script>
	  <script src="${contextRoot}/js/thunder/NavBar/Navmain.js"></script>
	  <script src="${contextRoot}/js/thunder/NavBar/Navpopper.js"></script>
	  <script src="${contextRoot}/js/thunder/NavBar/jquery.min.js"></script>
	  <script src="${contextRoot}/js/thunder/NavBar/NavCustomScript.js"></script>
</body>
</html>