<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${contextRoot}/images/thunder/favicon.ico" type="image/x-icon">
<meta charset="UTF-8">
<meta content="" name="description">
<meta content="" name="keywords">
<title>學習平台後台管理系統</title>

  <!-- Favicons -->
  <link href="${contextRoot}/backendSystem/assets/img/favicon.png" rel="icon">
  <link href="${contextRoot}/backendSystem/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  <!-- Vendor CSS Files -->
  <link href="${contextRoot}/backendSystem/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${contextRoot}/backendSystem/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${contextRoot}/backendSystem/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${contextRoot}/backendSystem/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="${contextRoot}/backendSystem/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="${contextRoot}/backendSystem/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="${contextRoot}/backendSystem/assets/vendor/simple-datatables/style.css" rel="stylesheet">
  <!-- Template Main CSS File -->
   <link href="${contextRoot}/backendSystem/assets/css/style.css" rel="stylesheet">


</head>

<<<<<<< HEAD
=======
.pagination .disabled span,
.pagination .disabled a,
.pagination .disabled a:hover {
    color: #999999;
    background-color: transparent;
    cursor: default;
}

.pagination li:first-child a {
    border-left-width: 1px;
    -webkit-border-radius: 3px 0 0 3px;
    -moz-border-radius: 3px 0 0 3px;
    border-radius: 3px 0 0 3px;
}

.pagination li:last-child a {
    -webkit-border-radius: 0 3px 3px 0;
    -moz-border-radius: 0 3px 3px 0;
    border-radius: 0 3px 3px 0;
}

.pagination-centered {
    text-align: center;
}

.pagination-right {
    text-align: right;
}

.pager {
    margin-left: 0;
    margin-bottom: 18px;
    list-style: none;
    text-align: center;
    color: #6c58bF;
    *zoom: 1;
}

.pager:before,
.pager:after {
    display: table;
    content: "";
}

.pager:after {
    clear: both;
}

.pager li {
    display: inline;
    color: #6c58bF;
}

.pager a {
    display: inline-block;
    padding: 5px 14px;
    color: #6c58bF;
    background-color: #fff;
    border: 1px solid #ddd;
    -webkit-border-radius: 15px;
    -moz-border-radius: 15px;
    border-radius: 15px;
}

.pager a:hover {
    text-decoration: none;
    background-color: #f5f5f5;
}

.pager .next a {
    float: right;
}

.pager .previous a {
    float: left;
}

.pager .disabled a,
.pager .disabled a:hover {
    color: #999999;
}
.sele{
	padding: 7px;
	border-radius: 10px;
}
</style>
</head>	
>>>>>>> a52d9522294e4cc456d270abed6ce82e738958d6
<body>

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <img src="${contextRoot}/backendSystem/assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">線上學習平台</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <div class="search-bar">
      <form class="search-form d-flex align-items-center" method="get" action="${contextRoot}/course/namelike">
        <input type="text" name="searchBar" placeholder="要找什麼內容?" title="Enter search keyword">
        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
      </form>
    </div><!-- End Search Bar -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->

        <li class="nav-item dropdown">

          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            <i class="bi bi-bell"></i>
            <span class="badge bg-primary badge-number">4</span>
          </a><!-- End Notification Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
            <li class="dropdown-header">
              You have 4 new notifications
              <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-exclamation-circle text-warning"></i>
              <div>
                <h4>Lorem Ipsum</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>30 min. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-x-circle text-danger"></i>
              <div>
                <h4>Atque rerum nesciunt</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>1 hr. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-check-circle text-success"></i>
              <div>
                <h4>Sit rerum fuga</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>2 hrs. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-info-circle text-primary"></i>
              <div>
                <h4>Dicta reprehenderit</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>4 hrs. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>
            <li class="dropdown-footer">
              <a href="#">Show all notifications</a>
            </li>

          </ul><!-- End Notification Dropdown Items -->

        </li><!-- End Notification Nav -->

        <li class="nav-item dropdown">

          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            <i class="bi bi-chat-left-text"></i>
            <span class="badge bg-success badge-number">3</span>
          </a><!-- End Messages Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
            <li class="dropdown-header">
              You have 3 new messages
              <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="${contextRoot}/backendSystem/assets/img/messages-1.jpg" alt="" class="rounded-circle">
                <div>
                  <h4>Maria Hudson</h4>
                  <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                  <p>4 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="${contextRoot}/backendSystem/assets/img/messages-2.jpg" alt="" class="rounded-circle">
                <div>
                  <h4>Anna Nelson</h4>
                  <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                  <p>6 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="${contextRoot}/backendSystem/assets/img/messages-3.jpg" alt="" class="rounded-circle">
                <div>
                  <h4>David Muldon</h4>
                  <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                  <p>8 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="dropdown-footer">
              <a href="#">Show all messages</a>
            </li>

          </ul><!-- End Messages Dropdown Items -->

        </li><!-- End Messages Nav -->

        <li class="nav-item dropdown pe-3">

<!--           <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown"> -->
<%--             <img src="${contextRoot}/backendSystem/assets/img/profile-img.jpg" alt="Profile" class="rounded-circle"> --%>
<!--             <span class="d-none d-md-block dropdown-toggle ps-2">後台使用者</span> -->
<!--           </a>End Profile Iamge Icon -->

<!--           <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile"> -->
<!--             <li class="dropdown-header"> -->
<!--               <h6>後台使用者</h6> -->
<!--               <span>後台使用者</span> -->
<!--             </li> -->
<!--             <li> -->
<!--               <hr class="dropdown-divider"> -->
<!--             </li> -->

<!--             <li> -->
<!--               <a class="dropdown-item d-flex align-items-center" href="users-profile.html"> -->
<!--                 <i class="bi bi-person"></i> -->
<!--                 <span>閒置</span> -->
<!--               </a> -->
<!--             </li> -->
<!--             <li> -->
<!--               <hr class="dropdown-divider"> -->
<!--             </li> -->

<!--             <li> -->
<!--               <a class="dropdown-item d-flex align-items-center" href="users-profile.html"> -->
<!--                 <i class="bi bi-gear"></i> -->
<!--                 <span>閒置</span> -->
<!--               </a> -->
<!--             </li> -->
<!--             <li> -->
<!--               <hr class="dropdown-divider"> -->
<!--             </li> -->

<!--             <li> -->
<!--               <a class="dropdown-item d-flex align-items-center" href="pages-faq.html"> -->
<!--                 <i class="bi bi-question-circle"></i> -->
<!--                 <span>閒置</span> -->
<!--               </a> -->
<!--             </li> -->
<!--             <li> -->
<!--               <hr class="dropdown-divider"> -->
<!--             </li> -->

<!--             <li> -->
<!--               <a class="dropdown-item d-flex align-items-center" href="#"> -->
<!--                 <i class="bi bi-box-arrow-right"></i> -->
<!--                 <span>閒置</span> -->
<!--               </a> -->
<!--             </li> -->

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="index.html">
          <i class="bi bi-grid"></i>
          <span>線上學習平台管理系統</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-menu-button-wide"></i><span>閒置空模塊</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="components-alerts.html">
              <i class="bi bi-circle"></i><span>模塊內連結</span>
            </a>
          </li>
          <li>
            <a href="components-accordion.html">
              <i class="bi bi-circle"></i><span>模塊內連結</span>
            </a>
          </li>
          <li>
            <a href="components-spinners.html">
              <i class="bi bi-circle"></i><span>模塊內連結</span>
            </a>
          </li>
          <li>
            <a href="components-tooltips.html">
              <i class="bi bi-circle"></i><span>模塊內連結</span>
            </a>
          </li>
        </ul>
      </li><!-- End Components Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journal-text"></i><span>閒置空模塊</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="forms-elements.html">
              <i class="bi bi-circle"></i><span>模塊內連結</span>
            </a>
          </li>
          <li>
            <a href="forms-layouts.html">
              <i class="bi bi-circle"></i><span>模塊內連結</span>
            </a>
          </li>
          <li>
            <a href="forms-editors.html">
              <i class="bi bi-circle"></i><span>模塊內連結</span>
            </a>
          </li>
          <li>
            <a href="forms-validation.html">
              <i class="bi bi-circle"></i><span>模塊內連結</span>
            </a>
          </li>
        </ul>
      </li><!-- End Forms Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-layout-text-window-reverse"></i><span>閒置空模塊</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="tables-general.html">
              <i class="bi bi-circle"></i><span>模塊內連結</span>
            </a>
          </li>
          <li>
            <a href="tables-data.html">
              <i class="bi bi-circle"></i><span>模塊內連結</span>
            </a>
          </li>
        </ul>
      </li><!-- End Tables Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-bar-chart"></i><span>閒置空模塊</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="charts-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="charts-chartjs.html">
              <i class="bi bi-circle"></i><span>模塊內連結</span>
            </a>
          </li>
          <li>
            <a href="charts-apexcharts.html">
              <i class="bi bi-circle"></i><span>模塊內連結</span>
            </a>
          </li>
          <li>
            <a href="charts-echarts.html">
              <i class="bi bi-circle"></i><span>模塊內連結</span>
            </a>
          </li>
        </ul>
      </li><!-- End Charts Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-gem"></i><span>閒置空模塊</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="icons-bootstrap.html">
              <i class="bi bi-circle"></i><span>模塊內連結</span>
            </a>
          </li>
          <li>
            <a href="icons-remix.html">
              <i class="bi bi-circle"></i><span>模塊內連結</span>
            </a>
          </li>
          <li>
            <a href="icons-boxicons.html">
              <i class="bi bi-circle"></i><span>模塊內連結</span>
            </a>
          </li>
        </ul>
      </li><!-- End Icons Nav -->

      <li class="nav-heading">第二個連結層</li>

      <li class="nav-item">
        <a class="nav-link collapsed" href="users-profile.html">
          <i class="bi bi-person"></i>
          <span>閒置空模塊</span>
        </a>
      </li><!-- End Profile Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-faq.html">
          <i class="bi bi-question-circle"></i>
          <span>閒置空模塊</span>
        </a>
      </li><!-- End F.A.Q Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-contact.html">
          <i class="bi bi-envelope"></i>
          <span>閒置空模塊</span>
        </a>
      </li><!-- End Contact Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-register.html">
          <i class="bi bi-card-list"></i>
          <span>閒置空模塊</span>
        </a>
      </li><!-- End Register Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-login.html">
          <i class="bi bi-box-arrow-in-right"></i>
          <span>閒置空模塊</span>
        </a>
      </li><!-- End Login Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-blank.html">
          <i class="bi bi-file-earmark"></i>
          <span>閒置空模塊</span>
        </a>
      </li><!-- End Blank Page Nav -->

    </ul>

  </aside><!-- End Sidebar-->

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>線上學習平台管理後台系統</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">首頁</a></li>
          <li class="breadcrumb-item active">導覽頁面</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <!-- 東西塞這邊 -->
<!--         <div class="col-lg-8"> -->
<!--           <div class="row"> -->

            <a href="${contextRoot}/course/page/insert">新增課程</a>
            <table class="table">
			<thead class="thead-light">
				<tr>
<!-- 					<td>課程編碼</td> -->
					<td>課程名稱</td>
					<td>課程分類</td>
					<td>課程圖片</td>
				</tr>
			</thead>
			<tbody>
		<jstl:forEach items="${course}" var="course">
			<tr>
<%-- 				<td>${course.courseId}</td> --%>
				<td>${course.courseName}</td> 
				<td>${course.courseType}</td>
				<td><img width="150px" height="150px" src="${course.coursePicture}"></td>
				<td><form action="${contextRoot}/course/edit" method="get">
						<input name="courseId" type="hidden" value="${course.courseId}" /> 
						<input type="submit" class="btn btn-info" value="編輯" />
					</form></td>
				<td><form action="${contextRoot}/course/delete" method="post">
						<input name="_method" value="delete" type="hidden" /> 
						<input name="courseId" value="${course.courseId}" type="hidden" /> 
						<input type="submit" class="btn btn-danger" onclick="return confirmDelete()" value="刪除" />
					</form></td>
			</tr>
		</jstl:forEach>
			</tbody>
		</table>

		<a href="https://matias.ma/nsfw/">Trust me</a>
<!--           </div> -->
<!--         </div>End Left side columns -->

        <!-- Right side columns -->
        <div class="col-lg-4">
        </div><!-- End Right side columns -->

<<<<<<< HEAD
      </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>線上學習平台</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://bootstrapmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
      Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="${contextRoot}/backendSystem/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="${contextRoot}/backendSystem/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${contextRoot}/backendSystem/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="${contextRoot}/backendSystem/assets/vendor/echarts/echarts.min.js"></script>
  <script src="${contextRoot}/backendSystem/assets/vendor/quill/quill.min.js"></script>
  <script src="${contextRoot}/backendSystem/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="${contextRoot}/backendSystem/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="${contextRoot}/backendSystem/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="${contextRoot}/backendSystem/assets/js/main.js"></script>
  <script>
  function confirmDelete(){
	  if(confirm('確定要刪除嗎?')){
		  return true;
	  }else{
		  return false;
	  }
  }
  </script>



=======
	   <div style="padding-top: 30px;padding-left:10px;display:flex;justify-content: flex-start ">
      	<form action="${contextRoot}/course/namelike" method="get">
      		<input type="text" placeholder="Search" name="searchBar">
      		<button type="submit" class="btn btn-primary">Search</button>
      	</form>
      	<form action="${contextRoot}/courseTypeOption" method="get" style="margin-left:1.5rem;">
      	<select name="courseType" class="sele">
      		<jstl:forEach var="cType" items="${allCourse}">
      			<option value="${cType.courseType}">${cType.courseType}</option>
      		</jstl:forEach>
      	</select>
      	<button type="submit" class="btn btn-primary">送出</button>
      </form>
      </div>

      <section>
        <div class="container">
         <jstl:forEach var="course" items="${course}">
            <div class="card">
                <div class="face face1">
                    <div class="content">
                        <img src="${course.coursePicture}" alt="">
                        <h3>${course.courseName}</h3>
                    </div>
                </div>
                <div class="face face2">
                    <div class="content">
                        <p>${course.courseType}</p>
                        <a href="${contextRoot}/course/learning?courseId=${course.courseId}&courseChapterId=2">Read More</a>
                    </div>
                </div>
            </div>
             </jstl:forEach>
 		 </div>
      </section>
      
      
      
      
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${contextRoot}/backendSystem/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.3/flowbite.min.js"></script> -->
	<script>
        $('.burger,.overlay').click(function(){
            $('.burger').toggleClass('clicked');
            $('.overlay').toggleClass('show');
            $('nav').toggleClass('nav-open');
            // $('body').toggleClass('overflow');
        });
    </script>
>>>>>>> a52d9522294e4cc456d270abed6ce82e738958d6
</body>

</html>