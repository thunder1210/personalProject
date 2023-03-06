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
<title>修改留言</title>
</head>
<body>
<jsp:include page="../layout/navbar.jsp"></jsp:include>

<div class="container">
<h1>修改留言 Page</h1>

<div class="card">
  <div class="card-header">
   修改留言
  </div>
  <div class="card-body">
   <form:form action="${contextRoot}/comment/edit" modelAttribute="comment" method="put">
    
    <form:input type="hidden" path="id"></form:input>
    <form:input type="hidden" path="added"></form:input>
    
    <div class="input-group">
     <form:textarea class="form-control" path="text"/>
    </div>
    
    <br />
    <button type="submit" class="btn btn-outline-primary">送出</button>
    
    </form:form>
    
  </div>
</div>

</div>
</body>
</html>