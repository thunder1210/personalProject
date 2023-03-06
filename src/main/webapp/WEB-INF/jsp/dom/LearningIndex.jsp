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
    <link href="${contextRoot}/css/dom/LearningIndex.css" rel="stylesheet" />
</head>
<body>
    <div class="top-bar">
        <div class="top-img">
            <img src="${contextRoot}/images/dom/Thunder_bannerlogo_color_transverse.png" alt="">
        </div>
        <div class="top-bar-menu">
            <a href="#">回到首頁</a>
            <a href="#">聯絡我們</a>
        </div>
        <div class="top-bar-member">
            <a href="#">EL:memberpic</a>
            <a href="#">EL:membername</a>
        </div>
    </div>

    <div class="banner" style="background-image: url(${contextRoot}/images/dom/banner_bg.jpg);">
        <div class="banner-item">
            <h1>ELmembername</h1>
            <h1>ELaccount</h1>
            <h1>loginTime</h1>
        </div>
        
    </div>




    <div class="container-wraper">
        <div class="container">
            <div class="card-project">
                <div class="img_container">
                <img src="${contextRoot}/images/dom/pic01.jpg" alt="">
            </div>
            <div class="content-card">
                <div>
                    <h2>Lorem ipsum</h2>
                    <p>
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis, animi?
                    </p>
                </div>
                <div class="btn"></div>
            </div>
            </div>

        </div>

        <div class="container">
            <div class="card-project">
                <div class="img_container">
                <img src="${contextRoot}/images/dom/pic01.jpg" alt="">
            </div>
            <div class="content-card">
                <div>
                    <h2>Lorem ipsum</h2>
                    <p>
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis, animi?
                    </p>
                </div>
                <div class="btn"></div>
            </div>
            </div>

        </div>


        <div class="container">
            <div class="card-project">
                <div class="img_container">
                <img src="${contextRoot}/images/dom/pic01.jpg" alt="">
            </div>
            <div class="content-card">
                <div>
                    <h2>Lorem ipsum</h2>
                    <p>
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis, animi?
                    </p>
                </div>
                <div class="btn"></div>
            </div>
            </div>

        </div>

        <div class="container">
            <div class="card-project">
                <div class="img_container">
                <img src="${contextRoot}/images/dom//pic01.jpg" alt="">
            </div>
            <div class="content-card">
                <div>
                    <h2>Lorem ipsum</h2>
                    <p>
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis, animi?
                    </p>
                </div>
                <div class="btn"></div>
            </div>
            </div>

        </div>
		
		
<!-- 		<ul class="nav nav-tabs"> -->
<!--   <li class="nav-item"> -->
<!--     <a class="nav-link active" href="#">Active</a> -->
<!--   </li> -->
<!--   <li class="nav-item"> -->
<!--     <a class="nav-link" href="#">Link</a> -->
<!--   </li> -->
<!--   <li class="nav-item"> -->
<!--     <a class="nav-link" href="#">Link</a> -->
<!--   </li> -->
<!--   <li class="nav-item"> -->
<!--     <a class="nav-link disabled" href="#">Disabled</a> -->
<!--   </li> -->
<!-- </ul> -->


    </div>
    <footer>
        <div class="footer-logo">
            <img src="${contextRoot}/images/dom/Thunder_bannerlogo_color_transverse.png" alt="">
        </div>
        <div class="footer-content">
            <ul>
                <li>
                    <h3>聯絡我們</h3>
                </li>
                <li><a href="#">
                    <img src="${contextRoot}/images/dom/ig.png" alt="">
                </a></li>
                <li><a href="#">
                    <img src="${contextRoot}/images/dom/fb.png" alt="">
                </a></li>
                <li><a href="#">
                    <img src="${contextRoot}/images/dom/line.png" alt="">
                </a></li>
            </ul>
        </div>
        <div class="footer-copyright">
            <p>Copyright © 2023 Thunder. All rights reserved.
            版權所有 © 2023 Thunder
            </p>
         </div>
        
    </footer>
    
        

        

</body>
</html>