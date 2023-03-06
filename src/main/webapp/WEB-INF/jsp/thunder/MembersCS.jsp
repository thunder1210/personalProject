<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${contextRoot}/images/thunder/Tunder_logo.ico" type="image/x-icon">
<meta charset="UTF-8">
<meta content="" name="description">
<meta content="" name="keywords">
	<meta http-equiv="X-UA-Compatible">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>學習平台後台管理系統</title>
	<link href="${contextRoot}/css/thunder/CustomerService.css" rel="stylesheet" />
  <!-- Favicons -->
  <link href="${contextRoot}/backendSystem/assets/img/favicon.png" rel="icon">
  <link href="${contextRoot}/backendSystem/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  <!-- Vendor CSS Files -->
  <link href="${contextRoot}/backendSystem/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="${contextRoot}/backendSystem/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="${contextRoot}/backendSystem/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="${contextRoot}/backendSystem/assets/vendor/simple-datatables/style.css" rel="stylesheet">
  <link href="${contextRoot}/backendSystem/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${contextRoot}/backendSystem/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${contextRoot}/backendSystem/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <!-- Template Main CSS File -->
  <link href="${contextRoot}/backendSystem/assets/css/style.css" rel="stylesheet">
  	<style>

	   </style>
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="${contextRoot}/BackendSystem" class="logo d-flex align-items-center">
        <img src="${contextRoot}/backendSystem/assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">線上學習平台</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <div class="search-bar">
      <form class="search-form d-flex align-items-center" method="POST" action="#">
        <input type="text" name="query" placeholder="要找什麼內容?" title="Enter search keyword">
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
              以下是您的未讀訊息
              <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">查看全部</span></a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-exclamation-circle text-warning"></i>
              <div>
                <h4>系統提示</h4>
                <p>您仍有 3 筆商品在購物車內尚未結算</p>
                <p>30 分鐘之前</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-x-circle text-danger"></i>
              <div>
                <h4>系統安全提醒</h4>
                <p>您的密碼已經超過60天未修改，請盡速至會員中心修改</p>
                <p>1 分鐘以前</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-check-circle text-success"></i>
              <div>
                <h4>交易成功！</h4>
                <p>您所購買的 [30天瘦身筆記] 已經成功提交</p>
                <p>2 分鐘以前</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-info-circle text-primary"></i>
              <div>
                <h4>最新資訊</h4>
                <p>商城頁面已完成更新建置，帶給您更加的瀏覽體驗</p>
                <p>4 小時之前</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>
            <li class="dropdown-footer">
              <a href="#">查看更多通知消息</a>
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
              您有3筆未讀消息
              <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">查看全部</span></a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="${contextRoot}/backendSystem/assets/img/messages-1.jpg" alt="" class="rounded-circle">
                <div>
                  <h4>永和迪麗熱巴</h4>
                  <p>今晚要喝點咖啡嗎?</p>
                  <p>4 小時之前</p>
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
                  <h4>金毛安娜</h4>
                  <p>上次買的商品我覺得很差.....又貴！</p>
                  <p>6 小時之前</p>
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
                  <h4>寶刀未老彼得</h4>
                  <p>有急事找你，看一下我的Line！</p>
                  <p>8 小時之前</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="dropdown-footer">
              <a href="#">展開所有消息</a>
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

<!--           </ul> -->
          <!-- End Profile Dropdown Items -->
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
          <i class="bi bi-menu-button-wide"></i><span>會員管理系統</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${contextRoot}/BackendSystem/memberList">
              <i class="bi bi-circle"></i><span>會員管理</span>
            </a>
          </li>
          <li>
            <a href="components-accordion.html">
              <i class="bi bi-circle"></i><span>------------</span>
            </a>
          </li>
          <li>
            <a href="components-spinners.html">
              <i class="bi bi-circle"></i><span>------------</span>
            </a>
          </li>
          <li>
            <a href="${contextRoot}/BackendSystem/cs">
              <i class="bi bi-circle"></i><span>客服系統</span>
            </a>
          </li>
        </ul>
      </li><!-- End Components Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journal-text"></i><span>課程管理</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${contextRoot}/course/admin">
              <i class="bi bi-circle"></i><span>新增課程</span>
            </a>
          </li>
          <li>
            <a href="forms-layouts.html">
              <i class="bi bi-circle"></i><span>------------</span>
            </a>
          </li>
          <li>
            <a href="forms-editors.html">
              <i class="bi bi-circle"></i><span>------------</span>
            </a>
          </li>
          <li>
            <a href="forms-validation.html">
              <i class="bi bi-circle"></i><span>------------</span>
            </a>
          </li>
        </ul>
      </li><!-- End Forms Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-layout-text-window-reverse"></i><span>商品管理系統</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${contextRoot}/product/productlist">
              <i class="bi bi-circle"></i><span>商品管理</span>
            </a>
          </li>
                    <li>
            <a href="tables-data.html">
              <i class="bi bi-circle"></i><span>------------</span>
            </a>
          </li>
                    <li>
            <a href="tables-data.html">
              <i class="bi bi-circle"></i><span>------------</span>
            </a>
          </li>
        </ul>
      </li><!-- End Tables Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-bar-chart"></i><span>---------------</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="charts-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="charts-chartjs.html">
              <i class="bi bi-circle"></i><span>------------</span>
            </a>
          </li>
          <li>
            <a href="charts-apexcharts.html">
              <i class="bi bi-circle"></i><span>------------</span>
            </a>
          </li>
          <li>
            <a href="charts-echarts.html">
              <i class="bi bi-circle"></i><span>------------</span>
            </a>
          </li>
        </ul>
      </li><!-- End Charts Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-gem"></i><span>---------------</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="icons-bootstrap.html">
              <i class="bi bi-circle"></i><span>------------</span>
            </a>
          </li>
          <li>
            <a href="icons-remix.html">
              <i class="bi bi-circle"></i><span>------------</span>
            </a>
          </li>
          <li>
            <a href="icons-boxicons.html">
              <i class="bi bi-circle"></i><span>------------</span>
            </a>
          </li>
        </ul>
      </li><!-- End Icons Nav -->

      <li class="nav-heading">第二個連結層</li>

      <li class="nav-item">
        <a class="nav-link collapsed" href="users-profile.html">
          <i class="bi bi-person"></i>
          <span>---------------</span>
        </a>
      </li><!-- End Profile Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-faq.html">
          <i class="bi bi-question-circle"></i>
          <span>---------------</span>
        </a>
      </li><!-- End F.A.Q Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-contact.html">
          <i class="bi bi-envelope"></i>
          <span>---------------</span>
        </a>
      </li><!-- End Contact Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-register.html">
          <i class="bi bi-card-list"></i>
          <span>---------------</span>
        </a>
      </li><!-- End Register Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-login.html">
          <i class="bi bi-box-arrow-in-right"></i>
          <span>---------------</span>
        </a>
      </li><!-- End Login Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-blank.html">
          <i class="bi bi-file-earmark"></i>
          <span>---------------</span>
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
          <li class="breadcrumb-item"><a href="#">會員管理系統</a></li>
          <li class="breadcrumb-item active">客服通訊</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <!-- 東西塞這邊 -->
      <div class="wrapper">
		<div class="container">
			<div class="left">
				<div class="top">
					<input type="text" placeholder="Search" />
					<a href="javascript:;" class="search"></a>
					<a href="javascript:;" class="edit"></a>
				</div>
				<input id="hiddenSendOutId" type="hidden" value="">
				<ul id="allUsers" class="people" style="list-style:none;margin: 0;padding: 0;">
				</ul>
			</div>
			<div class="right" style="overflow: auto;height: 600px;overflow: hidden;">
				<div id="theStartofChat" class="top"><span>To: <span id="imSendingToYou" class="name"></span></span></div>
	
					<div class="write" >
					<label><input type="file" accept="image/png,image/gif,image/jpeg" onchange="upload(this.files)" style="display: none;" /><a class="write-link attach"></a></label>
					<input id="theSenderInput" type="text" placeholder="請輸入您的消息..."/>
					<a href="javascript:requestComment()" class="write-link smiley"></a>
					<a href="javascript: send()" class="write-link send"></a>
				</div>
			</div>
			
		</div>
	</div>
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
  <script src="${contextRoot}/backendSystem/assets/vendor/quill/quill.min.js"></script>
  <script src="${contextRoot}/backendSystem/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="${contextRoot}/backendSystem/assets/vendor/echarts/echarts.min.js"></script>
  <script src="${contextRoot}/backendSystem/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="${contextRoot}/backendSystem/assets/vendor/php-email-form/validate.js"></script>
  <script src="${contextRoot}/backendSystem/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="${contextRoot}/backendSystem/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="${contextRoot}/backendSystem/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src="${contextRoot}/backendSystem/assets/js/main.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/axios@1.1.2/dist/axios.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript" src="${contextRoot}/js/thunder/CustomerService.js"></script>
</body>
</html>
