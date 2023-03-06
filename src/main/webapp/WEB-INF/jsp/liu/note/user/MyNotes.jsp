<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<script src="${contextRoot}/js/liu/tinymceEditor/node_modules/tinymce/tinymce.min.js" referrerpolicy="origin"></script>
<link rel="stylesheet" href="${contextRoot}/css/liu/all/bootstrap.min.css" />
<link rel="stylesheet" href="${contextRoot}/css/liu/note/user/MyNotes.css" />
<title>我的筆記</title>
</head>
<body>
<jsp:include page="../../../NavBar.jsp"></jsp:include>

<input type="hidden" value="${sessionScope.loginMember.memberId}" id="memberId">
<input type="hidden" id="currStarId">

<header>我的筆記 會員ID = ${sessionScope.loginMember.memberId}</header>

<button class="notes_addBtn" type="button">+</button>

<div class="notes_container">

<nav class="notes_sidebar">
    <div class="notes_sidebar_list">

        <div class="notes_sidebar_top">
            <section class="notes_sidebar_topic">置頂</section>
            <div class="notes_top_userArea">
                <!-- <div class="notes_top_info"></div> -->

                <!-- client-Side Rendering Area -->   
            </div>
        </div>

        <div class="notes_sidebar_normal">
            <section class="notes_sidebar_topic">筆記清單</section>
            <div class="notes_normal_userArea">
                <div class="notes_normal_info"></div>
                <!-- client-Side Rendering Area -->
            </div>
        </div>

    </div>
</nav>

<div class="notes_mainArea">

    <form class="notes_update_form">

        <div class="notes_update">
            
            <input type="hidden" class="notes_update_noteId" id="notes_update_noteId">

            <div class="notes_update_noteTitle" id="notes_update_noteTitle">
                <!-- client-Side Rendering Area -->
            </div>

            <div class="notes_update_noteContent" id="notes_update_noteContent">
                <!-- client-Side Rendering Area -->
            </div>

            <!-- client-Side Rendering Area -->

        </div>

    </form>

</div>

</div>


<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="${contextRoot}/js/liu/note/user/MyNotes.js" type="module"></script>
</body>
</html>