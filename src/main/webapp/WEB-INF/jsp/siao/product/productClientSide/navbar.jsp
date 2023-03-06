<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${contextRoot}/css/siao/bootstrap.min.css" rel="stylesheet" />
<link href="${contextRoot}/css/siao/productclient.css" rel="stylesheet" />
<link href="${contextRoot}/css/siao/forIndex.css" rel="stylesheet" />
<title>Insert title here</title>
</head>
<body>
	<nav>
		<header
			class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
			<a href="/"
				class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
			</a>

			<ul
				class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
				<li><a href="" class="nav-link px-2 link-secondary">Home</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">Features</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">Pricing</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">FAQs</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">About</a></li>
			</ul>

			<div class="col-md-3 text-end">
				<div class="container">

					<jstl:choose>
						<jstl:when test="${sessionScope.loginMember.memberAccount==null}">
							<a class="loginbutt" href="${contextRoot}/Membership/login">登入 / 註冊</a>
						</jstl:when>
						<jstl:otherwise>
							<div class="dropdown" id="memberInfo">
								<img src="${sessionScope.loginMember.memberPhoto}"
									class="cIfMemberPhoto" width="32%" height="38px"
									onerror="this.src='${contextRoot}/images/thunder/unknown.jpg'">
								<span class="memberNameSpan">${sessionScope.loginMember.memberName}</span>
								<a class="" href="" style="length: 100px;"><img
									src="${contextRoot}/images/siao/shopcarIcon.png"
									style="width: 37.6px;">購物車 </a>
								<div class="dropdown-content">
									<a href="${contextRoot}/Membership/memberCenter">會員專區</a> <a
										href="#">我的訂單</a> <a href="#">購買紀錄</a> <a
										href='javascript: logout()'>登出</a>
								</div>
							</div>
						</jstl:otherwise>
					</jstl:choose>
				</div>


			</div>
		</header>
	</nav>
	
	
	<script>
function logout(){
	let getID = "http://localhost:8080/onlinelearning/Membership/logout";
	fetch(getID, {
	method: 'POST',
	})
	.then(response => {
		return response.text();
		})
		.then(text =>{
			var memberinfo = document.getElementById("memberInfo");
			var hidden = document.getElementById("theHiddenLogin");
			hidden.setAttribute("class", "loginbutt");
			memberinfo.remove();
			})
	}

</script>
</body>
</html>