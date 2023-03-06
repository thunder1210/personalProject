<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${contextRoot}/images/thunder/Tunder_logo.ico" type="image/x-icon">
<meta charset="UTF-8">
<title>會員註冊</title>
<link href="${contextRoot}/css/thunder/memberRegister.css" rel="stylesheet" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
	<div class="headerLogoArea">
		<a href="${contextRoot}/"><img width="150px" src="${contextRoot}/images/thunder/cuttedLogo.jpg"/></a>
	</div>
	<div class="outbox">
		<div class="theTitle">請填寫您的註冊會員資料</div>
		<div class="devil">
			<form:form action="${contextRoot}/Membership/registerResult"
				modelAttribute="memberBox" enctype="multipart/form-data"
				method="post">
				<figure class="uploadPictureFigure">
					<img width="200px" height="195px" id="file_thumbnail"
						src="${contextRoot}/images/thunder/unknown.jpg" alt="">
					<span id="advicePhotoSize" class="advicePhotoSize">建議尺寸 200*195</span>
				</figure>

				<section class="button-box">
					<input class="tInput" id="customFileInput" type="file"
						name="theMemberPhoto" accept="image/*"> <label
						for="customFileInput" class="button-primary"> <span
						id="chooseAgain" class="uploadWords">上傳頭像</span>
					</label>
				</section>

				<div class="theColumn">
					<label for="MemberAccount">帳號</label><input class="form-control"
						name="MemberAccount" path="MemberAccount" id="MemberAccount" autocomplete="off"
						type="text" maxlength="12" onKeyUp="value=value.replace(/[\W]/g,'')"><span id="accountHint" class="ExampleTemplate">請輸入8~12位數帳號</span>
				</div>

				<div class="theColumn">
					<label for="MemberPassword">設定密碼</label><input class="form-control" maxlength="14"
						path="MemberPassword" name="MemberPassword" type="password"
						id="MemberPassword" onKeyUp="value=value.replace(/[\W]/g,'')"><span
						class="ExampleTemplate">請輸入8~14位數密碼，並區分大小寫</span>
				</div>

				<div class="theColumn">
					<label for="MemberPassword2">再次確認</label><input
						class="form-control" name="MemberPassword2" type="password" maxlength="14" autocomplete="off"
						id="MemberPassword2" onKeyUp="value=value.replace(/[\W]/g,'')"><span
						class="ExampleTemplate">兩次密碼必須輸入完全相同</span>
				</div>

				<div class="theColumn">
					<label for="MembernName">真實姓名</label><input class="form-control" id="MemberName" autocomplete="off" 
						path="MemberName" name="MemberName" type="text" maxlength="10"><span
						class="ExampleTemplate">請檢查輸入文字是否正確</span>
				</div>

				<div class="theColumn">
					<label for="NickName">暱稱</label><input class="form-control" maxlength="8" autocomplete="off"
						path="NickName" id="NickName" name="NickName" type="text"><span
						class="ExampleTemplate"></span>
				</div>

				<div class="theColumn" style="margin-top:4%">
					<label for="MemberAge">年齡</label><input class="form-control" maxlength="2" autocomplete="off"
						path="MemberAge" name="MemberAge" id="MemberAge" type="text" onKeyUp="this.value=this.value.replace(/\D/g,'')"><span
						class="ExampleTemplate"></span>
				</div>

				<div class="theColumn">
					<span class="theSelectWords">性別：</span> <select path="MemberGender"
						name="MemberGender" class="MemberGenderSelect">
						<option value="男性" selected>男性</option>
						<option value="女性">女性</option>
						<option value="第三性">第三性</option>
					</select> <span class="theSelectWords">教育程度：</span> <select class="MemberEducated"
						path="MemberEducated" name="MemberEducated">
						<option value="博士">博士</option>
						<option value="碩士">碩士</option>
						<option value="大學" selected>大學</option>
						<option value="專科">專科</option>
						<option value="高中">高中</option>
					</select>
				</div>

				<div class="theColumn">
					<label for="MemberEmail">Email</label><input class="form-control"
						path="MemberEmail" name="MemberEmail" id="MemberEmail" type="text"><span class="ExampleTemplate">例：jsmith@example.com</span>
				</div>

				<div class="theColumn">
					<label for="MemberTelephone">身份證字號</label><input 
						class="form-control" path="IdentityNumber" id="IdentityNumber" name="IdentityNumber" maxlength="10"
						type="text"><span class="ExampleTemplate" autocomplete="off">由文字碼及數字碼組成，共計十碼，第二碼至第十碼為數字碼</span>
				</div>

				<div class="theColumn">
					<label for="MemberTelephone">電話</label><input class="form-control" maxlength="12" oninput="value=value.replace(/[^\d]/g,'')"
						path="MemberTelephone" name="MemberTelephone" id="MemberTelephone" type="text" autocomplete="off"><span
						class="ExampleTemplate"></span>
				</div>

				<div class="theColumn">
					<label for="MemberAddress">地址</label><input class="form-control" autocomplete="off"
						path="MemberAddress" name="MemberAddress" id="MemberAddress" type="text"><span
						class="ExampleTemplate">例：〇〇路、〇〇街、〇〇大道〇段〇巷〇弄〇號</span>
				</div>

				<input type="hidden" path="MailVerifyStatus" name="MailVerifyStatus"
					id="MailVerifyStatus" value="未驗證"></input>
				<input type="hidden" path="MemberId" name="MemberId" id="MemberId" value=""></input>
				
				<div style="display: none;">
					<input type="submit" name="submit" id="hiddenButtSubmit">
				</div>
			</form:form>
		</div>
		<div class="sendOutBtn1">
			<button class="btnFF" style="margin-left:31.5%;" onclick="show()">送出</button>
		</div>
		<div class="sendOutBtn2">
			<button class="btnFF2" onclick="location.href='${contextRoot}/Membership/agreement'">返回</button>
		</div>
	</div>

	<div>
		<div class="dialog">
			<div class="content">
				<div class="aclose">
					<span><img width="20px"
						src="https://www.pngitem.com/pimgs/m/509-5099390_check-green-check-list-icon-hd-png-download.png">註冊會員郵箱驗證</span>
				</div>
				<div class="theVeriEmailPopOutArea">
					您的註冊信箱：<input type="text" readonly="readonly" id="popWindowEmail" class="theMailSendOut">
					<button class="popBtn3"onclick="sendTheMail()" id="sendItNow">
						<span id="theMailWords">寄出驗證信</span>
					</button>
				</div>

				<div class="yourVerifyCode">
					請輸入註冊驗證碼：<input id="veriverify" type="text" readonly="readonly" maxlength="5"
						oninput="value=value.replace(/[^\d]/g,'')">
				</div>
				<span class="SendOutMailWarning" id="alert">請至您的信箱收取，若使用免費信箱則有可能收不到信件</span>
				<div class="SendOutMailWarningAreaDiv">
					<button class="popBtn2" id="turnBackBtn1" onclick="location.href='javascript:close();';">返回</button>
					<button class="popBtn" id="passAndNextStep" onclick="go()">略過，下一步</button>
				</div>
			</div>
		</div>
	</div>

	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="${contextRoot}/js/thunder/memberRegister.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios@1.1.2/dist/axios.min.js"></script>
	<script type="text/javascript" src="${contextRoot}/js/thunder/newMemberPhoto.js"></script>
	<script type="text/javascript" src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript" src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
</body>
</html>