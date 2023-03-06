<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增訊息頁面</title>
</head>
<body>
<jsp:include page="../layout/navbar.jsp"></jsp:include>

<div class="container">
<h1>新增訊息頁面</h1>


<div class="card">
  <div class="card-header">
   新增留言
  </div>
  <div class="card-body">
    <form:form action="${contextRoot}/comment/post" modelAttribute="comment">
    
    <div class="input-group">
     <form:textarea class="form-control" path="text"/>
    </div>
    
    <br />
    <button type="submit" class="btn btn-outline-primary">送出</button>
    
    </form:form>
    
  </div>
</div>

<br />

<div class="card">
  <div class="card-header">
   最新訊息 時間: 
   <span> 
   <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss EEEE" value="${latestMsg.added}"/>
   </span>
   
  </div>
  <div class="card-body">
    ${latestMsg.text}
  </div>
</div>


</div>

</body>
</html>