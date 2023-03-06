<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<script src="${contextRoot}/js/liu/tinymceEditor/node_modules/tinymce/tinymce.min.js" referrerpolicy="origin"></script>
<!-- <script src="${contextRoot}/js/liu/note/user/TinymceSettings.js"></script> -->
<title>我的筆記</title>
<link rel="stylesheet" href="${contextRoot}/css/liu/all/bootstrap.min.css" />
<link rel="stylesheet" href="${contextRoot}/css/liu/note/user/v_old_MyNotes2.css" />
</head>
<body>

<header>我的筆記</header>
<header>會員ID = ${sessionScope.loginMember.memberId}</header>

<input type="hidden" value="${sessionScope.loginMember.memberId}" id="memberId">
<input type="hidden" value="${contextRoot}" id="contextRootId">

<div class="notes" id="noteApp">
    
    <nav class="notes_sidebar">
        <button class="notes_addBtn" type="button">Add Note</button>

        <div class="notes_list">
            <!-- for binding purpose only -->
            <!-- <div class="notes_card" style="display: none;">
                <input type="hidden" class="notes_card_noteId">
                <section class="notes_card_noteTitle"></section>
                <section class="notes_card_noteContent"></section>
                <section class="notes_card_noteLastUpdateTime"></section>
            </div> -->

            <!-- client-side rendering areas-->

        </div>

    </nav>

    <div class="notes_mainArea">
        <!-- for binding purpose only
        <form class="notes_update_form" style="display: none;">
            <div class="notes_update">
                <input type="hidden" class="notes_update_noteId">
                <input class="notes_update_noteTitle" type="text" placeholder="New Note...">
                <textarea class="notes_update_noteContent">Take Note...</textarea>
            </div>;
        </form> -->

        <!-- client-side rendering areas-->
    </div>



</div>

<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="${contextRoot}/js/liu/note/user/v_old_MyNotes2.js" type="module"></script>
</body>
</html>