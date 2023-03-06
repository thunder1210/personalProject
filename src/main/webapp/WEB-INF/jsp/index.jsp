<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${contextRoot}/images/thunder/Tunder_logo.ico" type="image/x-icon">
<meta charset="UTF-8">
<title>Thunder-OnlineLearning學習平台</title>
<link href="${contextRoot}/css/thunder/forIndex.css" rel="stylesheet"/>
<link href="${contextRoot}/css/thunder/swiper-bundle.min.css" rel="stylesheet" />
<link href="//fonts.googleapis.com/earlyaccess/notosanstc.css" rel="stylesheet" />
<link href="${contextRoot}/css/thunder/memberButtonsForPages.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/earlyaccess/cwtexyen.css" rel="stylesheet" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Infant:wght@700&display=swap" rel="stylesheet" />
</head>
<body>
	<img class="theHeaderPic" src="${contextRoot}/images/thunder/Thunder_bannerlogo_color_transverse.png">
	<div class="videobox">
		<ul class="drop-down-menu">
			<li><a class="exploreForMore" href="#">探索更多</a>
				<ul>
					<li><a href="product/productshow">線上書城</a>
						<ul>
							<li><a href="${contextRoot}/product/productshow">最新商品</a></li>
							<li><a href="#">--------</a></li>
							<li><a href="#">--------</a></li>
							<li><a href="#">--------</a></li>
							<li><a href="#">--------</a></li>
						</ul></li>
					<li><a href="#">學習筆記</a>
						<ul>
							<li><a href="${contextRoot}/note/user/myNotes">我的筆記</a></li>
							<li><a href="${contextRoot}/note/user/tinymceTest">Tinymce測試區</a></li>
							<li><a href="#">--------</a></li>
							<li><a href="#">--------</a></li>
						</ul></li>

					<li><a href="#">探索學習</a>
						<ul>
                            <li><a href="${contextRoot}/courseindex">瀏覽課程</a></li>
                            <li><a href="#">--------</a></li>
                            <li><a href="#">--------</a></li>
                            <li><a href="#">--------</a></li>
						</ul></li>
					<li><a href="#">交流學習部落格</a>
						<ul>
							<li><a href="${contextRoot}/blogindex">部落格天地</a></li>
							<li><a href="#">--------</a></li>
							<li><a href="#">--------</a></li>
							<li><a href="#">--------</a></li>
						</ul></li>
					<li><a href="#">--------</a>
						<ul>
							<li><a href="#">擴增欄位</a></li>
							<li><a href="#">擴增欄位</a></li>
							<li><a href="#">擴增欄位</a></li>
							<li><a href="#">擴增欄位</a></li>
						</ul></li>
				</ul></li>
		</ul>

		<a id="theHiddenLogin" class="loginbutthidden" href="Membership/login">登入	/ 註冊</a>

		<jstl:choose>
			<jstl:when test="${sessionScope.loginMember.memberAccount==null}">
				<a class="loginbutt" href="Membership/login">登入 / 註冊</a>
			</jstl:when>
			<jstl:otherwise>
				<div class="dropdown" id="memberInfo">
					<img src="${sessionScope.loginMember.memberPhoto}" class="cIfMemberPhoto"
						width="18%" height="35px" onerror="this.src='${contextRoot}/images/thunder/unknown.jpg'"> 
						<span class="memberNameSpan">${sessionScope.loginMember.memberName}</span>
					<div class="dropdown-content">
						<a href="${contextRoot}/Membership/memberCenter">會員專區</a> 
						<a href="#">我的訂單</a> 
						<a href="#">購買紀錄</a> 
						<a href='javascript: logout()'>登出</a>
					</div>
				</div>
			</jstl:otherwise>
		</jstl:choose>

		<div class="learningPlatformTitleWords">THUNDER LEARNING<br><span id="autotype" >It's never too Late to Start your Journey</span><br>
			<div class="learningPlatformTitleWords2">
				<span>來自全球頂尖的國際名師，超過一萬種隨選線上課程，</span><br>
				囊括目前最夯熱門技術：Java、React、C++、React、jQuery，讓你迅速進步！<br>
			</div>
		</div>
		<div class="whatDoYouWannaLearn">
			<input id="startTime" style="background-image: url('${contextRoot}/images/thunder/searchIcon.jpg');" type="text" value="   想學什麼課程？">
		</div>
		<a style="margin-left: 10%" class="theTag" href="#">#好學初學者</a> <a
			style="margin-left: 1%;" class="theTag" href="#">#進階先修班</a>
		<iframe src="https://streamable.com/e/j1kvfe?autoplay=1&nocontrols=1" width="1820" height="1024" class="yes"></iframe>
	</div>

	<div class="poplarBooks">熱門書籍</div>

	<div class="slide-container swiper" style="padding-bottom:50px;margin-bottom:3%;">
		<div class="slide-content">
			<div class="card-wrapper swiper-wrapper">
				<div class="card swiper-slide">
					<div class="image-content">
						<span class="overlay"></span>
						<div class="card-image">
							<img
								src="https://im1.book.com.tw/image/getImage?i=https://www.books.com.tw/img/001/087/31/0010873110.jpg&w=374&h=374&v=5f7c475b"
								class="card-img">
						</div>
					</div>
					<div class="card-content">
						<h2 class="name">OpenCV影像創意</h2>
						<p class="description">很早就想改版第一版的書籍，歷經多時的醞釀與投入，終於有著作的改版，心情愉快的。</p>
						<span class="corousalSpecialPrice">限時特價：620</span>
						<button class="button">馬上搶購</button>
					</div>
				</div>

				<div class="card swiper-slide">
					<div class="image-content">
						<span class="overlay"></span>
						<div class="card-image">
							<img
								src="https://im1.book.com.tw/image/getImage?i=https://www.books.com.tw/img/001/091/85/0010918576.jpg&w=374&h=374&v=62204450"
								class="card-img">
						</div>
					</div>
					<div class="card-content">
						<h2 class="name">最新 Java 程式語言</h2>
						<p class="description">15
							年的淬鍊，建立正確的物件導向概念，Java是企業界最愛用的語言，成為符合業界需求的程式設計師。</p>
						<SPAN class="corousalSpecialPrice">限時特價：320</span>
						<button class="button">馬上搶購</button>
					</div>
				</div>

				<div class="card swiper-slide">
					<div class="image-content">
						<span class="overlay"></span>
						<div class="card-image">
							<img
								src="https://im2.book.com.tw/image/getImage?i=https://www.books.com.tw/img/001/092/68/0010926843.jpg&v=629dd745k&w=348&h=348"
								alt="" class="card-img">
						</div>
					</div>
					<div class="card-content">
						<h2 class="name">Java SE 17基礎必修課</h2>
						<p class="description">扎實Java程式設計訓練，培養程式設計與運算思維能力，為您打下ITS
							Java國際認證能力! </p>
						<span class="corousalSpecialPrice">限時特價：990</span>
						<button class="button">馬上搶購</button>
					</div>
				</div>
			</div>
		</div>
		<div class="swiper-button-next swiper-navBtn"></div>
		<div class="swiper-button-prev swiper-navBtn"></div>
		<div class="swiper-pagination"></div>
	</div>

	<div class="theSecondCourasul">

		<div class="theSecondCourasulChildDiv">
			<img src="images/thunder/ba1.jpg" alt="" width="800px" height="375px">
		</div>
		<div class="theSecondCourasulChildDiv">
			<img src="images/thunder/ba2.jpg" width="800px" height="360px">
		</div>
	</div>

	<div class="wrapper">
		<i id="left" class="fa-solid fa-angle-left"></i>
		<div class="carousel">
			<img src="images/thunder/img-1.jpg" alt="img" draggable="false">
			<img src="images/thunder/img-2.jpg" alt="img" draggable="false">
			<img src="images/thunder/img-3.jpg" alt="img" draggable="false">
			<img src="images/thunder/img-4.jpg" alt="img" draggable="false">
		</div>
		<i id="right" class="fa-solid fa-angle-right"></i>
	</div>
	<script type="text/javascript" src="${contextRoot}/js/thunder/swiper-bundle.min.js"></script>
	<script type="text/javascript" src="${contextRoot}/js/thunder/secondCourasul.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<script type="text/javascript" src="${contextRoot}/js/thunder/indexScript.js"></script>
	<script>
	$("#autotype").autotype();

    if(window.name != "noReload"){
       window.name = "noReload";
       location.reload();
   } else {
       window.name = "";
   }
    </script>
</body>
</html>