<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<title>THUNDER後台管理系統</title>

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
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="${contextRoot}/BackendSystem" class="logo d-flex align-items-center">
        <img style="width:50px" src="${contextRoot}/images/thunder/Thunder_bannerlogo_color_straight.png" alt="">
        <span class="d-none d-lg-block">THUNDER</span>
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
          <span>THUNDER後台管理系統</span>
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
            <a href="${contextRoot}/BackendSystem/box">
              <i class="bi bi-circle"></i><span>會員意見紀錄</span>
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
            <a href="${contextRoot}/course/page/insert2">
              <i class="bi bi-circle"></i><span>章節新增</span>
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
          <i class="bi bi-layout-text-window-reverse"></i><span>學習書籍管理</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${contextRoot}/book/index">
              <i class="bi bi-circle"></i><span>全部書籍</span>
            </a>
          </li>
                    <li>
            <a href="${contextRoot}/book/add">
              <i class="bi bi-circle"></i><span>新增書籍</span>
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
          <i class="bi bi-bar-chart"></i><span>商品管理系統</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="charts-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${contextRoot}/product/productlist">
              <i class="bi bi-circle"></i><span>商品管理</span>
            </a>
          </li>
          <li>
            <a href="${contextRoot}/product/productcreate">
              <i class="bi bi-circle"></i><span>創建新商品</span>
            </a>
          </li>
          <li>
            <a href="charts-echarts.html">
              <i class="bi bi-circle"></i><span>------------</span>
            </a>
          </li>
           <li>
            <a href="charts-echarts.html">
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
      <h1>THUNDER後台管理系統</h1>
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
        <div class="col-lg-8">
          <div class="row">
           
           <!-- Sales Card -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card sales-card">

                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>數據篩選</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">本日</a></li>
                    <li><a class="dropdown-item" href="#">本月</a></li>
                    <li><a class="dropdown-item" href="#">本年度</a></li>
                  </ul>
                </div>

                <div class="card-body">
                  <h5 class="card-title">銷售狀況 <span>| 本日</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-cart"></i>
                    </div>
                    <div class="ps-3">
                      <h6>145筆</h6>
                      <span class="text-success small pt-1 fw-bold">銷售額12%</span> <span class="text-muted small pt-2 ps-1">增加</span>

                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Sales Card -->
            
              <!-- Revenue Card -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card revenue-card">

                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>數據篩選</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">本日</a></li>
                    <li><a class="dropdown-item" href="#">本月</a></li>
                    <li><a class="dropdown-item" href="#">本年度</a></li>
                  </ul>
                </div>

                <div class="card-body">
                  <h5 class="card-title">書城營收 <span>| 本月</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-currency-dollar"></i>
                    </div>
                    <div class="ps-3">
                      <h6>$3,264</h6>
                      <span class="text-success small pt-1 fw-bold">8%</span> <span class="text-muted small pt-2 ps-1">增加</span>

                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Revenue Card -->

            <!-- Customers Card -->
            <div class="col-xxl-4 col-xl-12">

              <div class="card info-card customers-card">

                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>數據篩選</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">本日</a></li>
                    <li><a class="dropdown-item" href="#">本月</a></li>
                    <li><a class="dropdown-item" href="#">本年度</a></li>
                  </ul>
                </div>

                <div class="card-body">
                  <h5 class="card-title">會員數 <span>| 本年度</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-people"></i>
                    </div>
                    <div class="ps-3">
                      <h6>1244名</h6>
                      <span class="text-danger small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">減幅</span>
                    </div>
                  </div>
                </div>
              </div>
            </div><!-- End Customers Card -->
            
              <!-- Top Selling -->
            <div class="col-12">
              <div class="card top-selling overflow-auto">

                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>數據篩選</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">本日</a></li>
                    <li><a class="dropdown-item" href="#">本月</a></li>
                    <li><a class="dropdown-item" href="#">本年度</a></li>
                  </ul>
                </div>

                <div class="card-body pb-0">
                  <h5 class="card-title">銷售排行 <span>| 本日</span></h5>

                  <table class="table table-borderless">
                    <thead>
                      <tr>
                        <th scope="col">商品圖片預覽</th>
                        <th scope="col">商品</th>
                        <th scope="col">價格</th>
                        <th scope="col">銷售數量</th>
                        <th scope="col">收入</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row"><a href="#"><img src="https://im1.book.com.tw/image/getImage?i=https://www.books.com.tw/img/CN1/183/55/CN11835544.jpg&v=63e53e20k&w=270&h=270" alt=""></a></th>
                        <td><a href="#" class="text-primary fw-bold">富足</a></td>
                        <td>$64</td>
                        <td class="fw-bold">124</td>
                        <td>$5,828</td>
                      </tr>
                      <tr>
                        <th scope="row"><a href="#"><img src="https://im1.book.com.tw/image/getImage?i=https://www.books.com.tw/img/CN1/183/39/CN11833972.jpg&v=63dab208k&w=340&h=340" alt=""></a></th>
                        <td><a href="#" class="text-primary fw-bold">歐洲五十年：破碎大陸的返航</a></td>
                        <td>$46</td>
                        <td class="fw-bold">98</td>
                        <td>$4,508</td>
                      </tr>
                      <tr>
                        <th scope="row"><a href="#"><img src="https://im1.book.com.tw/image/getImage?i=https://www.books.com.tw/img/E07/000/25/E070002514.jpg&v=63b8dbf8k&w=348&h=348" alt=""></a></th>
                        <td><a href="#" class="text-primary fw-bold">英語輕鬆學：學好入門會話就靠這本！講解有聲書 (有聲書)</a></td>
                        <td>$59</td>
                        <td class="fw-bold">74</td>
                        <td>$4,366</td>
                      </tr>
                      <tr>
                        <th scope="row"><a href="#"><img src="https://im2.book.com.tw/image/getImage?i=https://www.books.com.tw/img/E08/000/08/E080000839.jpg&v=63747af8k&w=348&h=348" alt=""></a></th>
                        <td><a href="#" class="text-primary fw-bold">新制多益聽力滿分攻略：高效率秒殺解題技巧 (影片)</a></td>
                        <td>$32</td>
                        <td class="fw-bold">63</td>
                        <td>$2,016</td>
                      </tr>
                      <tr>
                        <th scope="row"><a href="#"><img src="https://im2.book.com.tw/image/getImage?i=https://www.books.com.tw/img/E08/000/08/E080000815.jpg&v=6351070ak&w=348&h=348" alt=""></a></th>
                        <td><a href="#" class="text-primary fw-bold">自助旅行英文懶人包：20 堂課，學會自助旅行常說的英文</a></td>
                        <td>$79</td>
                        <td class="fw-bold">41</td>
                        <td>$3,239</td>
                      </tr>
                    </tbody>
                  </table>

                </div>

              </div>
            </div><!-- End Top Selling -->

          </div>
        </div><!-- End Left side columns -->

        <!-- Right side columns -->
        <div class="col-lg-4">

        </div><!-- End Right side columns -->

      </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>　THUNDER-Learning學習平台　</span></strong> All Rights Reserved
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

</body>

</html>