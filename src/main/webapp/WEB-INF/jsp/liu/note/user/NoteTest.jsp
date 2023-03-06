<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Note Test</title>
</head>
<body>

${sessionScope.loginMember.memberId}

<div>

<h1>筆記上傳測試頁面</h1>
<form action="${contextRoot}/note/user/test/add" method="post" enctype="multipart/form-data">
    <input type="hidden" id="memberId" name="memberId" value="${sessionScope.loginMember.memberId}">
    <label for="noteTitle">筆記標題：</label> 
    <input type="text" id="noteTitle" name="noteTitle">
    <br><br>
    <label style="vertical-align: top" for="noteContent">筆記內容：</label> 
    <textarea id="noteContent" name="noteContent"></textarea>
    <br><br>
    <label for="noteAccess">筆記權限：</label> 
    <input type="radio" id="noteAccess" name="noteAccess" value="private" checked required>private
    <input type="radio" name="noteAccess" value="public">
    public
    <br><br>
    <label for="notePhotoFiles[]">筆記圖片：</label>
    <input type="file" multiple="multiple" id="notePhotoFiles[]" name="notePhotoFiles[]" >
    <br><br>
    <input type="submit" id="submitBtn" value="送出">
</form>

</div>


<!-- <script>

var notePhotoInput = document.getElementById('notePhotoInput');
var notePhotoList = [];

notePhotoInput.addEventListener('change', e => {
    e.preventDefault();
    for (var i = 0; i < this.length; i++) {
        notePhotoList.push(notePhotoInput.data[i]);
    }
    console.log(notePhotoList);
})

submitBtn.addEventListener('click', e =>{
    
    e.preventDefault();  // 如果是用 form 表單，要把表單送出的功能取消

    let noteTitle = document.querySelector('#noteTitle').value;
    let noteContent = document.querySelector('#noteContent').value;
    let noteJson = {"noteTitle" : noteTitle, "noteContent": noteContent, "fkMemberId": 9999}
    let addNoteUrl = '${contextRoot}/note/add'
    
    axios.post(addNoteUrl, noteJson)
    .then(res => {
        console.log(res.data);
    })
    .catch(err => {
        console.log(err);
    })

    e.preventDefault();

    let uploadNotePhotoUrl = '${contextRoot}/notePhoto/upload'

    axios.post(uploadNotePhotoUrl, notePhotoList)
    .then(res => {
        console.log(res.data);
    })
    .catch(err => {
        console.log(err);
    })

    axios.post(url,params)
    .then(res => {
        console.log(res)
    })
    .catch(err => {
        console.error(err); 
    })
    
})
</script> -->

<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</body>
</html>