<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${contextRoot}/images/thunder/Tunder_logo.ico" type="image/x-icon">
<meta charset="UTF-8">
<title>會員登入</title>
<link href="${contextRoot}/css/thunder/memberLogin.css" rel="stylesheet" />
<link href="${contextRoot}/css/thunder/memberButtonsForPages.css" rel="stylesheet" />
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/css/bootstrap.min.css" />
<link href="https://fonts.googleapis.com/css?family=Poppins"  rel="stylesheet"/>
</head>
<body>
	<div class="theHeaderContainer"><a href="${contextRoot}/"><img width="150px" src="${contextRoot}/images/thunder/cuttedLogo.jpg"/></a></div>
	<div class="outbox">
		<table>
			<tr>
				<td class="pictureSideTd" style="background-image: url(${contextRoot}/images/thunder/memberBonus.jpg);"></td>
				<td class="contentSideTd">
					<div class="loginAccountTitle">登入帳號</div>
					<form action="${contextRoot}/Membership/loginCheck" method="post">
						<div class="theEnterArea">
							<label for="TypeAccount" class="TypeAccount">帳號</label><br />
							<input autocomplete="off" oncut="return false" onpaste="return false" oncopy="return false" placeholder="請輸入帳號" name="loginAccount" 
							class="enterYourAccount" id="TypeAccount" class="form-control" onKeyUp="value=value.replace(/[\W]/g,'')" type="text" /><br>
							<span  class="putYourAccountHere" >請輸入8~12位數帳號</span><br /> <label
								for="floatingPassword" class="floatingPassword">密碼<i id="checkEye"
								class="fas fa-eye"></i></label><br />
							<input onpaste="return false" oncopy="return false"
								style="line-height: 200px; width: 90%; position: relative; height: 35px;"
								class="form-control" id="floatingPassword" type="password" onKeyUp="value=value.replace(/[\W]/g,'')"
								name="loginPassword" placeholder="請輸入密碼" /><span class="wordCapital">請輸入8~14位數密碼，並區分大小寫</span>
							<div style="margin-top: 5%;" class="g-recaptcha"
								data-sitekey="6LdFkvgjAAAAAPL712XyI0VUwm60elBeFClQQWtm"></div>
							<br />
 							<button id="hiddenBtn" style="display:none;">Hidden Button</button>
							<button id="theShowingLoginBtn" class="loginIn" onclick="">登入</button>
							<div>
								<span><input type="checkbox" id="scales" name="scales" class="remembMe">記住我</span> 
								<span class="warnAlarm">${warning.alarm}</span>
							</div>
						</div>
					</form>
					<div class="theLowerArea">
						<hr class="theLowArea" />
						<div>
							<span class="howNotYet">還沒註冊嗎？<a href="agreement">請點我</a></span><span class="forgetWords">
							<a href="#popup1">忘記帳號/密碼</a></span>
						</div>
						<div><input type="button" id="lineLoginBtn" class="lineBtn" style="background-image: url(${contextRoot}/images/thunder/lineLoginIcon.png); " />
						<input type="button" onclick="location.href='${contextRoot}/Membership/fastLogin'" id="lineLoginBtn" class="lineBtn" 
						style="background-image: url(${contextRoot}/images/thunder/FastLogin.jpg);background-size:95%;border-radius: 1px;margin-left: 3%;" /></div>
					</div>
				</td>
		</table>
	</div>
	
	    <div id="popup1" class="overlay">
      <div class="popup">
        <a class="close" href="#">&times;</a>
        <div id="dialog" class="window">
          <div class="box">
            <div class="newletter-title">
              <h1>THUNDER平台會員找回密碼</h1>
            </div>
            <div class="box-content newleter-content">
              <label
                >若您已忘記註冊時填寫的使用者帳戶密碼<br />請輸入您當時的註冊郵箱(需已經過認證)<br />
                我們將會通過信件的方式為您提供重置後的密碼</label
              >
              <div id="frm_subscribe">
                <form name="subscribe" id="subscribe_popup">
                  <div>
                    <!-- <span class="required">*</span><span>Email</span>-->
                    <input type="text" name="subscribe_account" id="subscribe_account" placeholder="請輸入帳號"/>
                    <input type="text" name="subscribe_pemail" id="subscribe_pemail" placeholder="請輸入電子信箱" />
                    <input type="hidden" value="" name="subscribe_pname" id="subscribe_pname"/>
                    <div id="notification"></div>
                    <div id="sendOutFeedback" style="margin-bottom:3%;font-bold:bolder;color:red;"></div>
                    <a id="resetBtn" class="button" onclick="sendOutResetPassword()"><span>送出</span></a>
                  </div>
                </form>
                <div class="subscribe-bottom"></div>
              </div>
              <!-- /#frm_subscribe -->
            </div>
            <!-- /.box-content -->
          </div>
        </div>
      </div>
    </div>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://www.google.com/recaptcha/api.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios@1.1.2/dist/axios.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
	<script src="${contextRoot}/js/thunder/memberLogin.js"></script>
</body>
</html>