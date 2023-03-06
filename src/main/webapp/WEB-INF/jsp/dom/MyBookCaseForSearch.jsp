<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>學習平台</title>
    <link rel="icon" href="${contextRoot}/images/dom/Tunder_logo.ico">
    <link href="${contextRoot}/css/dom/MyBookCaseIndex.css" rel="stylesheet" />
    <link href="${contextRoot}/css/dom/bootstrap.min.css" rel="stylesheet" />
    <script type="${contextRoot}/js/dom/jquery-3.6.3.min.js"></script>
    <script type="text/javascript" src="${contextRoot}/js/thunder/secondCourasul.js"></script>
    <script type="text/javascript" src="${contextRoot}/js/thunder/indexScript.js"></script>
<body>
		<jstl:choose>
		<jstl:when test="${sessionScope.loginMember.memberAccount==null}">
		<div class="loginbutt">
		<div class="logo"><img src="${contextRoot}/images/dom/Thunder_bannerlogo_transverse.png" alt=""></div>
		<a href="Membership/login">登入 / 註冊</a>
		</div>	
		</jstl:when>
		<jstl:otherwise>
	        <div class="name">
            <div class="logo"><img src="${contextRoot}/images/dom/Thunder_bannerlogo_transverse.png" alt=""></div>
            <p>Hello👋</p>
            <div class="dropdown">
            <div class="member_logo"><img src="${sessionScope.loginMember.memberPhoto}" onerror="this.src='${contextRoot}/images/thunder/unknown.jpg'"></div>
            <div class="dropdown-content">
						<a href="${contextRoot}/Membership/memberCenter">會員專區</a> 
						<a href="#">我的訂單</a> 
						<a href="#">購買紀錄</a> 
						<a href='javascript: logout()'>登出</a>
					</div>
				</div>	
            <div class="animation">
                <div class="first">
                    <div>${sessionScope.loginMember.memberName}</div>
                </div>
                <div class="second">
                    <div>歡迎回來</div>
                </div>
                <div class="third">
                    <div>Wakanda Forever👊🏿</div>
                </div>
            </div>
        </div>
        	</jstl:otherwise>
        </jstl:choose>
        
            <div class="burger">
                <span></span>
                </div>
                    <nav>
                        <ul class="main">
                            <li><a href="#">Home</a></li>
                            <li><a href="#">Shop</a></li>
                            <li><a href="#">About</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>

                        <div class="about">
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatibus?</p>
                        </div>


                    </nav>
                    <div class="overlay"></div>
    <!-- 背景圖 -->
     <div class="bgi" style="background-image: url(${contextRoot}/images/dom/banner_bg.jpg);"></div>
    <!-- TABS -->
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation" >
            <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true" onclick="location.href='${contextRoot}/myAllCourse'">課程</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false" onclick="location.href='${contextRoot}/book/page'">書籍</button>
        </li>
      </ul>

      <section>
        <div class="container">
         <jstl:forEach var="book" items="${book}">
            <div class="card">
                <div class="face face1">
                    <div class="content" style="overflow: hidden;">
                        <img src="${contextRoot}/book/photo?id=${book.bookid}" alt="" style="max-width: 150px;">
                        <h3>${book.bookName}</h3>
                    </div>
                </div>
                <div class="face face2">
                    <div class="content">
                        <p>${book.bookType}</p>
                        <a href="#">Read More</a>
                    </div>
                </div>
            </div>
             </jstl:forEach>
  		</div>
      </section>
      		
      	<div style="width: 300px;">
      	<form action="${contextRoot}/findBooksByName" class="d-flex" role="search" method="get" enctype="multipart/form-data">
        <input class="form-control me-2" type="text" name="book" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
      	</div>
      	
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	   <script>
        $('.burger,.overlay').click(function(){
            $('.burger').toggleClass('clicked');
            $('.overlay').toggleClass('show');
            $('nav').toggleClass('nav-open');
            // $('body').toggleClass('overflow');
        });

        
    </script>
</body>

</html>