<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Learning Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
    <style>
      a {
        color: white;
      }
      p {
      font-size: x-large;
      }
    </style>
  </head>

  <body>

	<jsp:include page="../NavBar.jsp"></jsp:include>
    <header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
      <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" style="font-size:30px" href="#">${course.courseName}</a>
	<div style="color:white; margin-right: 10px;">
	<a href="${contextRoot}/myClass">返回首頁</a>

	</div>

    </header>

    <div class="container-fluid">
      <div class="row">
        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
          <div class="position-sticky pt-3" style="height: 600px;border-radius:0 0 10px 10px; background-color: #3C3C3C;">
            <ul class="nav flex-column" style="font-size:20px;font-family:Microsoft JhengHei;text-align: center;">
             
             <jstl:forEach items="${allChapter}" var="cChapter">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="${contextRoot}/course/learning?courseId=${course.courseId}&courseChapterId=${cChapter.courseChapterId}">
                  ${cChapter.courseChapter}
                </a>
              </li>
            </jstl:forEach>
<!--             <div> -->
<%-- 				<a class="nav-link active" href="${contextRoot}/exam">Test</a>             --%>
<!--             </div> -->
            
            </ul>
          </div>
        </nav>

        <div class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
          <div
            class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">${chapter.courseChapter}</h1>
          </div>

<!-- 用於顯示結果的區域 -->
<!--  		  <p> -->
		<div id="result">
<!--             <iframe width="1000" height="400" src="https://youtu.be/q0hyYWKXF0Q"></iframe> -->
		<input type="text" style="display:none" value="${chapter.videoOrNot}" name="videoOrNot" id="videoOrNot" />
          <!-- ${chapter.courseContent} -->
<%--         ${chapter.videoOrNot} --%> 
<!--       	  </p> -->
      </div>
      </div>
      </div>
    </div>
      	  
    <script>
    // 假設後端傳回的值為 response
    const von = document.getElementById("videoOrNot").value;
    // 如果值為 Y，則顯示iframe
    if (von == "Y") {
      document.getElementById("result").innerHTML =  '<iframe width="1100" height="550" src="${chapter.courseContent}"></iframe>';
    }
    // 否則，顯示一個<p>元素顯示該值
    else {
      document.getElementById("result").innerHTML = `<p>${chapter.courseContent}</p>`;
    }
</script>
  </body>

  </html>