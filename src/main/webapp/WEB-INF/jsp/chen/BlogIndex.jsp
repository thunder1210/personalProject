<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
      <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

        <!DOCTYPE html>
        <html>

        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
          <meta name="description" content="">
          <meta name="author" content="TemplateMo">
          <link
            href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap"
            rel="stylesheet">

          <title>Blog Index</title>

          <!-- Bootstrap core CSS -->
          <link href="${contextRoot}/css/chen/bootstrap.min.css" rel="stylesheet">

          <!-- Additional CSS Files -->
          <link rel="stylesheet" href="${contextRoot}/css/chen/fontawesome.css">
          <link rel="stylesheet" href="${contextRoot}/css/chen/templatemo-stand-blog.css">
          <link rel="stylesheet" href="${contextRoot}/css/chen/owl.css">

        </head>

        <body>

          <jsp:include page="../NavBar.jsp"></jsp:include>

          <!-- ***** Preloader Start ***** -->
          <div id="preloader">
            <div class="jumper">
              <div></div>
              <div></div>
              <div></div>
            </div>
          </div>
          <!-- ***** Preloader End ***** -->

          <!-- Page Content -->
          <!-- Banner Starts Here -->
          <div class="main-banner header-text">
            <div class="container-fluid">
              <div class="owl-banner owl-carousel">
                <div class="item">
                  <img src="${contextRoot}/images/chen/banner-item-01.jpg" alt="">
                  <div class="item-content">
                    <div class="main-content">
                      <div class="meta-category">
                        <span>輪播區的文章分類</span>
                      </div>
                      <a href="post-details.html">
                        <h4>輪播區的文章標題</h4>
                      </a>
                      <ul class="post-info">
                        <li><a href="#">文章作者</a></li>
                        <li><a href="#">May 12, 2020</a></li>
                        <li><a href="#">12 Comments</a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- Banner Ends Here -->

          <!-- ---------- 網頁中間區  開始 ------------ -->
          <section class="blog-posts">
            <div class="container">
              <div class="row">
                <div class="col-lg-8">
                  <div class="all-blog-posts">
                    <div class="row">

                      <!-- --------- 文章顯示區  開始 ----------- -->
                      <div class="col-lg-12">
                        <!-- ---------- 文章循環  開始 ------------ -->
                        <jstl:forEach items="${indexlist}" var="blogpost" varStatus="s">
                          <div class="blog-post">
                            <div class="blog-thumb">
                              <img width="100px" height="450px" src="${blogpost.blogPostPhoto}" alt="">
                            </div>
                            <div class="down-content">
                              <span>${blogpost.blogPostType}</span>
                              <a href="post-details.html">
                                <h4>${blogpost.blogPostTitle}</h4>
                              </a>
                              <ul class="post-info">
                                <input type="hidden" name="" id="" value="${blogpost.blogPostId}">
                                <li>${sessionScope.loginMember.memberName}</li>
                                <li>
                                  <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${blogpost.blogPostDate}" />
                                </li>
                                <li>按讚數量</li>
                              </ul>
                              <!-- 文章放置  開始 -->
                              <p>${blogpost.blogPostContent}</p>
                              <!-- 文章放置  結束 -->

                              <div class="post-options">
                                <div class="row">
                                  <div class="col-6">
                                    <!-- 可放東西 -->
                                  </div>
                                  <div class="col-6">
                                    <!-- 可放東西 -->
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </jstl:forEach>
                        <!-- ---------- 文章循環  結束 ------------ -->
                        <!-- ----------- 文章顯示區  結束 ----------- -->

                        <!-- --------- 文章評論區 開始 ------------ -->
                        <div class="col-lg-12">
                          <div class="sidebar-item comments">
                            <div class="sidebar-heading">
                              <h2>4 comments</h2>
                            </div>
                            <div class="content">
                              <ul>
                                <li>
                                  <div class="author-thumb">
                                    <img src="${contextRoot}/images/chen/comment-author-01.jpg" alt="">
                                  </div>
                                  <div class="right-content">
                                    <h4>Charles Kate<span>May 16, 2020</span></h4>
                                    <p>評論內容</p>
                                  </div>
                                </li>
                                <li class="replied">
                                  <div class="author-thumb">
                                    <img src="${contextRoot}/images/chen/comment-author-02.jpg" alt="">
                                  </div>
                                  <div class="right-content">
                                    <h4>Thirteen Man<span>May 20, 2020</span></h4>
                                    <p>評論內容</p>
                                  </div>
                                </li>
                                <li>
                                  <div class="author-thumb">
                                    <img src="${contextRoot}/images/chen/comment-author-03.jpg" alt="">
                                  </div>
                                  <div class="right-content">
                                    <h4>Belisimo Mama<span>May 16, 2020</span></h4>
                                    <p>評論內容</p>
                                  </div>
                                </li>
                              </ul>
                            </div>
                          </div>
                        </div>
                        <!-- --------- 文章評論區 結束 ------------ -->

                      </div>
                      <!-- ---------- 網頁中間區  結束 ------------ -->

                    </div>
                  </div>
                </div>

                <!-- --------- 網頁側邊區  開始 ------------ -->
                <div class="col-lg-4">
                  <div class="sidebar">
                    <div class="row">

                      <!-- --------- 搜尋文章區  開始 ------------ -->
                      <div class="col-lg-12">
                        <div class="sidebar-item search">
                          <form id="search_form" name="gs" method="GET" action="#">
                            <input type="text" name="q" class="searchText" placeholder="請輸入搜尋內容" autocomplete="on">
                          </form>
                        </div>
                      </div>
                      <!-- --------- 搜尋文章區  結束 ------------ -->

                      <!-- --------- 最近文章區  開始------------ -->
                      <div class="col-lg-12">
                        <div class="sidebar-item recent-posts">
                          <div class="sidebar-heading">
                            <h2>最近文章區</h2>
                          </div>
                          <div class="content">
                            <ul>
                              <li><a href="post-details.html">
                                  <h5>文章標題</h5>
                                  <span>文章日期</span>
                                </a></li>
                              <li><a href="post-details.html">
                                  <h5>文章標題</h5>
                                  <span>文章日期</span>
                                </a></li>
                              <li><a href="post-details.html">
                                  <h5>文章標題</h5>
                                  <span>文章日期</span>
                                </a></li>
                            </ul>
                          </div>
                        </div>
                      </div>
                      <!-- --------- 最近文章區  結束 ------------ -->

                      <!-- --------- 文章分類區  開始 ------------ -->
                      <div class="col-lg-12">
                        <div class="sidebar-item categories">
                          <div class="sidebar-heading">
                            <h2>文章分類區</h2>
                          </div>
                          <div class="content">
                            <ul>
                              <li><a href="#">- Nature Lifestyle</a></li>
                              <li><a href="#">- Awesome Layouts</a></li>
                              <li><a href="#">- Creative &amp; Unique</a></li>
                            </ul>
                          </div>
                        </div>
                      </div>
                      <!-- --------- 文章分類區  結束 ------------ -->

                    </div>
                  </div>
                </div>
                <!-- --------- 網頁側邊區  結束 ------------ -->

              </div>
            </div>
          </section>
          <!-- ---------- 網頁中間區  結束 ------------ -->

          <!-- ------------ 網頁底部區 --------------- -->
          <footer>
            <div class="container">
              <div class="row">
                <div class="col-lg-12">
                  <div class="copyright-text">
                    <p>Copyright 2020 Stand Blog Co.

                      | Design: <a rel="nofollow" href="https://templatemo.com" target="_parent">TemplateMo</a></p>
                  </div>
                </div>
              </div>
            </div>
          </footer>


          <!-- ----------------- 套版 JS ------------------- -->
          <!-- Bootstrap core JavaScript -->
          <script src="${contextRoot}/js/chen/jquery.min.js"></script>
          <script src="${contextRoot}/js/chen/bootstrap.bundle.min.js"></script>

          <!-- Additional Scripts -->
          <script src="${contextRoot}/js/chen/custom.js"></script>
          <script src="${contextRoot}/js/chen/owl.js"></script>
          <script src="${contextRoot}/js/chen/slick.js"></script>
          <script src="${contextRoot}/js/chen/isotope.js"></script>
          <script src="${contextRoot}/js/chen/accordions.js"></script>

          <script type="text/javascript">
            cleared[0] = cleared[1] = cleared[2] = 0;  //set a cleared flag for each field
            function clearField(t) {  //declaring the array outside of the
              if (!cleared[t.id]) {  // function makes it static and global
                cleared[t.id] = 1;  // you could use true and false, but that's more typing
                t.value = '';  // with more chance of typos
                t.style.color = '#fff';
              }
            }
          </script>
          <!-- --------------------------------------------- -->

        </body>

        </html>