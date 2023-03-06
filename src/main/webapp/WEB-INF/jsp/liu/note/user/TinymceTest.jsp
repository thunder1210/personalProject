<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<link>
<meta charset="UTF-8">
<script src="${contextRoot}/js/liu/tinymceEditor/node_modules/tinymce/tinymce.min.js" referrerpolicy="origin"></script>
<title>Tinymce測試區</title>
</head>
<body>
    <input type="hidden" id="memberId" value="${sessionScope.loginMember.memberId}">


<div id="notes_update_noteContent">


</div>

<br><br><br><br><br>

<textarea id="tinymceTestArea">

</textarea>

<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="${contextRoot}/js/liu/note/user/TinymceTestMain.js" 
type="module"></script>
</body>
</html>