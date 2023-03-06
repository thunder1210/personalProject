<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的筆記(舊版)</title>
<link rel="stylesheet" href="${contextRoot}/css/liu/all/bootstrap.min.css" />
<link rel="stylesheet" href="${contextRoot}/css/liu/note/user/MyNotes.css" />
</head>
<body>
<h1>我的筆記</h1>

<div>

<table>
    <thead>
        <tr style="background-color: antiquewhite">
            <th>我的筆記</th>
            <th>筆記標題</th>
            <th>筆記內容</th>
        </tr>
    </thead>
    <tbody>
        <jstl:forEach items="${notesList}" var="note" varStatus="count">
            <tr id="${note.noteId}">
                <td>${count.index + 1}</td>
                <td>${note.noteTitle}</td>
                <td>${note.noteContent}</td>
                <td><button class="note-btn btn btn-warning" data-id="${note.noteId}">編輯</button></td>
                <td><button class="delete-btn btn btn-danger" data-id="${note.noteId}">刪除</button></td>
            </tr>
        </jstl:forEach>
    </tbody>
</table>

</div>

<div id="output-result">

</div>

<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="${contextRoot}/js/liu/note/user/v_old_MyNotes.js"></script>
</body>
</html>