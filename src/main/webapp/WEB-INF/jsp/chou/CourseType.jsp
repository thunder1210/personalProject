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
	<link href="${contextRoot}/css/chou/pagination.css" rel="stylesheet" />
    <script type="${contextRoot}/js/dom/jquery-3.6.3.min.js"></script>
    <script type="text/javascript" src="${contextRoot}/js/thunder/secondCourasul.js"></script>
    <script type="text/javascript" src="${contextRoot}/js/thunder/indexScript.js"></script>
	
	<style>
	.pagination {
    height: 36px;
    margin: 15px 0;
    color: #6c58bF;
    width: 100%	;
    padding-left:136%;
}

.pagination ul {
    display: inline-block;
    *display: inline;
    /* IE7 inline-block hack */
    *zoom: 1;
    margin-left: 0;
    color: #ffffff;
    margin-bottom: 0;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
    -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
    -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
}

.pagination li {
    display: inline;
    color: #333;
}

.pagination a {
    float: left;
    padding: 0 14px;
    line-height: 34px;
    color: #ffffff;
    text-decoration: none;
    border: 1px solid #ddd;
    border-left-width: 0;
    background-color: #333;
}

.pagination a:hover,
.pagination .active a {
    background-color: #ffffff;
    color: #333;
}

.pagination a:focus {
    background-color: #6c58bF;
    color: #ffffff;
}


.pagination .active a {
    color: #ffffff;
    cursor: default;
}

.pagination .disabled span,
.pagination .disabled a,
.pagination .disabled a:hover {
    color: #999999;
    background-color: transparent;
    cursor: default;
}

.pagination li:first-child a {
    border-left-width: 1px;
    -webkit-border-radius: 3px 0 0 3px;
    -moz-border-radius: 3px 0 0 3px;
    border-radius: 3px 0 0 3px;
}

.pagination li:last-child a {
    -webkit-border-radius: 0 3px 3px 0;
    -moz-border-radius: 0 3px 3px 0;
    border-radius: 0 3px 3px 0;
}

.pagination-centered {
    text-align: center;
}

.pagination-right {
    text-align: right;
}

.pager {
    margin-left: 0;
    margin-bottom: 18px;
    list-style: none;
    text-align: center;
    color: #6c58bF;
    *zoom: 1;
}

.pager:before,
.pager:after {
    display: table;
    content: "";
}

.pager:after {
    clear: both;
}

.pager li {
    display: inline;
    color: #6c58bF;
}

.pager a {
    display: inline-block;
    padding: 5px 14px;
    color: #6c58bF;
    background-color: #fff;
    border: 1px solid #ddd;
    -webkit-border-radius: 15px;
    -moz-border-radius: 15px;
    border-radius: 15px;
}

.pager a:hover {
    text-decoration: none;
    background-color: #f5f5f5;
}

.pager .next a {
    float: right;
}

.pager .previous a {
    float: left;
}

.pager .disabled a,
.pager .disabled a:hover {
    color: #999999;
}
.sele{
	padding: 7px;
	border-radius: 10px;
}
</style>
</head>	
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
            <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="false" onclick="location.href='${contextRoot}/myAllCourse'">課程</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="true" onclick="location.href='${contextRoot}/book/page'">書籍</button>
        </li>
      </ul>

	   <div style="padding-top: 30px;padding-left:10px;display:flex;justify-content: flex-start ">
      	<form action="${contextRoot}/course/namelike" method="get">
      		<input type="text" placeholder="Search" name="searchBar">
      		<button type="submit" class="btn btn-primary">Search</button>
      	</form>
      	<form action="${contextRoot}/courseTypeOption" method="get" style="margin-left:1.5rem;">
      	<select name="courseType" class="sele">
      		<jstl:forEach var="cType" items="${allCourse}">
      			<option value="${cType.courseType}">${cType.courseType}</option>
      		</jstl:forEach>
      	</select>
      	<button type="submit" class="btn btn-primary">送出</button>
      </form>
      </div>

	

      <section>
        <div class="container">
         <jstl:forEach var="course" items="${course}">
            <div class="card">
                <div class="face face1">
                    <div class="content">
                        <img src="${course.coursePicture}" alt="">
                        <h3>${course.courseName}</h3>
                    </div>
                </div>
                <div class="face face2">
                    <div class="content">
                        <p>${course.courseType}</p>
                        <a href="${contextRoot}/course/learning?courseId=${course.courseId}&courseChapterId=2">Read More</a>
                    </div>
                </div>
            </div>
             </jstl:forEach>
 		 </div>
      </section>
      
      
      
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${contextRoot}/backendSystem/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.3/flowbite.min.js"></script> -->
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