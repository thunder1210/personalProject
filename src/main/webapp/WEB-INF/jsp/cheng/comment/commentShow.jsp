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
<title>Show Comment Page</title>
</head>
<body>
<jsp:include page="../layout/navbar.jsp"></jsp:include>

<div class="container">
<div class="row just"></div>
<h1>最新留言</h1>


<jstl:forEach var="comment" items="${page.content}">
<div class="card">
  <div class="card-header">
   最新留言 時間: 
   <span> 
   <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss a EEEE " value="${comment.added}"/>
   </span>
   
  </div>
  <div class="card-body">
    ${comment.text}
  
  
  <div class="edit-place" style="display:flex">
  <form action="${contextRoot}/comment/edit" method="get">
    <input name="id" type="hidden" value="${comment.id}" />
    <input type="submit" class="btn btn-info btn-sm" value="編輯" />
  </form>
  
  <form action="${contextRoot}/comment/delete" method="post">
    <input name="_method" type="hidden" value="delete" />
    <input name="id" type="hidden" value="${comment.id}" />
    <input type="submit" class="btn btn-danger btn-sm" value="刪除" />
  </form>
  </div>
  </div>
  
</div>
<br />
</jstl:forEach>

<jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">


<jstl:choose>
	<jstl:when test="${ page.number != pageNumber-1 }">
	    <a href="${contextRoot}/comment/page?p=${pageNumber}">${pageNumber}</a>
	</jstl:when>
	
	<jstl:otherwise>
	  ${pageNumber}
	</jstl:otherwise>
</jstl:choose>

<jstl:if test="${ pageNumber != page.totalPages }">
  |
</jstl:if>
  

</jstl:forEach>





</div>
</body>
</html>