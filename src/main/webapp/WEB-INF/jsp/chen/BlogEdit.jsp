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

          <title>Blog Edit</title>

          <!-- Bootstrap core CSS -->
          <link href="${contextRoot}/css/chen/bootstrap.min.css" rel="stylesheet">
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

          <!-- Additional CSS Files -->
          <link rel="stylesheet" href="${contextRoot}/css/chen/fontawesome.css">
          <link rel="stylesheet" href="${contextRoot}/css/chen/templatemo-stand-blog.css">
          <link rel="stylesheet" href="${contextRoot}/css/chen/owl.css">
          <style>
            .call-to-action .main-content {
              padding: 40px;
              background-image: url(${contextRoot}/images/chen/cta-bg.jpg);
              background-position: center center;
              background-repeat: no-repeat;
              background-size: cover;
            }
          </style>
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

          <section class="call-to-action">
            <div class="container">
              <div class="row">
                <div class="col-lg-12">
                  <div class="main-content">
                    <div class="row">
                      <div class="col-lg-8">
                        <img src="${sessionScope.loginMember.memberPhoto}" alt="" width="200px" height="200px"
                          style="border-radius:100px">&nbsp&nbsp&nbsp&nbsp
                        <span style="font-size:30px">MY &nbsp B L O G</span>
                        <span>
                          <h4><strong>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp${sessionScope.loginMember.memberName}</strong>
                          </h4>
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>

          <!-- ---------- 網頁中間區  開始 ------------ -->
          <section class="blog-posts grid-system">
            <div class="container">
              <div class="row">
                <div class="col-lg-8">
                  <div class="all-blog-posts">
                    <div class="row">

                      <!-- ------- 文章顯示區  開始 ------- -->
                      <!-- --------------- 新增文章區  開始 ------------------ -->
                      <div class="col-lg-12">
                        <div class="sidebar-item submit-comment">
                          <div class="sidebar-heading">
                            <h2>
                              <bold>新 增 文 章</bold>
                            </h2>
                            <!-- <form action="" enctype="multipart/form-data"> -->
                          </div>
                          <div class="article">
                            會員 ID = ${sessionScope.loginMember.memberId}
                            <form id="article" action="${contextRoot}/blogedit/post/normal" method="post"
                              enctype="multipart/form-data">
                              <input type="hidden" name="memberId" id="memberId"
                                value="${sessionScope.loginMember.memberId}">
                              <div class="row">

                                <div class="col-md-12 col-sm-12">
                                  <fieldset>
                                    <input name="postType" type="text" id="postType" placeholder="文章類型" required>
                                  </fieldset>
                                </div>
                                <div class="col-md-12 col-sm-12">
                                  <fieldset>
                                    <input name="postTitle" type="text" id="postTitle" placeholder="文章標題" required>
                                  </fieldset>
                                </div>
                                <div class="col-lg-12">
                                  <fieldset>
                                    <textarea name="postContent" rows="6" id="postContent" placeholder="請輸入文章..."
                                      required></textarea>
                                  </fieldset>
                                  <fieldset>
                                    圖片：<input name="postPhotoFile" type="file" id="postPhotoFile">
                                    <button type="submit" id="form-submit"
                                      class="main-button normal-form-submit">一般送出文章</button>
                                    <button type="submit" id="form-submit"
                                      class="main-button ajax-form-submit">ajax送出文章</button>
                                  </fieldset>
                                  <br>
                                </div>

                              </div>
                            </form>

                          </div>
                        </div>
                      </div>
                      <!-- --------------- 新增文章區  結束 ------------------ -->

                      <!-- ------ 使用者文章區  開始 ------ -->
                      <div class="col-lg-12">
                        <!-- ------ 文章循環區  開始 ------ -->
                        <jstl:forEach items="${editlist}" var="blogpost">
                          <div class="blog-post" data-id="${blogpost.blogPostId}">
                            <div class="blog-thumb">
                              <img class="blogPostPhoto" src="${blogpost.blogPostPhoto}" alt="" width="730px"
                                height="450px">
                            </div>
                            <div class="down-content">
                              <a href="">
                                <h4 class="blogPostTitle">${blogpost.blogPostTitle}</h4>
                              </a>
                              <span class="blogPostType">${blogpost.blogPostType}</span>
                              <ul class="post-info">
                                <li><a href="#">${sessionScope.loginMember.memberName}</a></li>
                                <li><a href="#" class="blogPostDate">${blogpost.blogPostDate}</a></li>
                                <li><a href="#">按讚數量</a></li>
                              </ul>
                              <!-- 文章放置  開始 -->
                              <p class="blogPostContent">${blogpost.blogPostContent}</p>
                              <!-- 文章放置  結束 -->
                              <div class="post-options">
                                <div class="row">
                                  <div class="col-6">
                                    <!-- 編輯按鈕 -->
                                    <button type="button" id="${blogpost.blogPostId}"
                                      class="fake-edit-btn btn btn-primary" data-bs-toggle="modal"
                                      data-bs-target="#exampleModal"
                                      data-bs-whatever="${blogpost.blogPostTitle}">編輯</button>
                                    <!-- 刪除按鈕 -->
                                    <button type="button" id="${blogpost.blogPostId}"
                                      class="fake-delete-btn btn btn-danger" data-bs-toggle="modal"
                                      data-bs-target="#exampleModal2"
                                      data-bs-whatever2="${blogpost.blogPostTitle}">刪除</button>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </jstl:forEach>
                        <!-- ------ 文章循環區  結束 ------ -->
                      </div>
                      <!-- ------ 使用者文章區  結束 ------ -->

                      <!-- ------------- 編輯按鈕  彈窗區 ---------------- -->
                      <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalLabel"></h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                              <form>
                                <div class="mb-3">
                                  <label for="recipient-name" class="col-form-label">標題：</label>
                                  <input type="text" class="form-control" id="recipient-title">
                                </div>
                                <div class="mb-3">
                                  <label for="recipient-name2" class="col-form-label">分類：</label>
                                  <input type="text" class="form-control" id="recipient-type">
                                </div>
                                <div class="mb-3">
                                  原圖片：<img src="" id="recipient-photo">
                                </div>
                                <div class="mb-3">
                                  新圖片：<input name="postPhotoFile" type="file" id="postPhotoFile">
                                </div>
                                <div class="mb-3">
                                  <label for="message-text" class="col-form-label">內容：</label>
                                  <textarea class="form-uncontrol" rows="6" cols="92"
                                    id="recipient-content">${blogpost.blogPostContent}</textarea>
                                </div>
                              </form>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                              <button type="button" class="save-update-btn btn btn-primary" data-blogPostId=""
                                data-blogPostType="" data-blogPostTitle="" data-blogPostContent="" id="">送出編輯</button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- -------------------------------------------- -->

                      <!-- ------------- 刪除按鈕  彈窗區 ---------------- -->
                      <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2"
                        aria-hidden="true">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title2" id="exampleModalLabel2"></h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                              你確定要刪除文章嗎?
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                              <button type="button" class="delete-btn btn btn-danger" data-blogPostId="">確定刪除</button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- -------------------------------------------- -->

                      <!-- ------ Demo文章區  開始 ------ -->
                      <div class="col-lg-12">
                        <div class="blog-post">
                          <div class="blog-thumb">
                            <img src="${contextRoot}/images/chen/blog-post-02.jpg" alt="">
                          </div>
                          <div class="down-content">
                            <span>文章分類</span>
                            <a href="post-details.html">
                              <h4>文章標題</h4>
                            </a>
                            <ul class="post-info">
                              <li><a href="#">王小明</a></li>
                              <li><a href="#">發文日期</a></li>
                              <li><a href="#">按讚數量</a></li>
                            </ul>
                            <!-- Demo文章放置  開始 -->
                            <p>
                              先帶大家看看壽司區吧,或許有人這家在台北飯店眾多吃到飽的選擇中,已經慢慢被遺忘了,但不得不說以目前推出的下午茶500找20元的吃到飽來說,真的也沒啥好嫌的,一分錢一分貨嘛,花不到500的價位,可以吃一餐飽三餐,真的無法要求太多。下午茶雖然沒有鮭魚生魚片,但仍有提供旗魚與鯛魚兩種生魚片可以選擇,還行啦!期間限定480元吃到飽,也有提供熟白蝦,不誇張當天幾乎每桌都有人拿一大盤。
                            </p>
                            <!-- Demo文章放置  結束 -->
                            <div class="post-options">
                              <div class="row">
                                <div class="col-6">
                                  <!-- Demo編輯按鈕 -->
                                  <!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal" data-bs-whatever="放文章標題">編輯</button> -->
                                  <!-- Demo刪除按鈕 -->
                                  <!-- <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal2">刪除</button> -->
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- ------ Demo文章區  結束 ------ -->
                      <!-- ------- 文章顯示區  結束 ------- -->

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
                            <input type="text" name="q" class="searchText" placeholder="type to search..."
                              autocomplete="on">
                          </form>
                        </div>
                      </div>
                      <!-- --------- 搜尋文章區  結束 ------------ -->

                      <!-- --------- 最近文章區  開始 ------------ -->
                      <div class="col-lg-12">
                        <div class="sidebar-item recent-posts">
                          <div class="sidebar-heading">
                            <h2>Recent Posts</h2>
                          </div>
                          <div class="content">
                            <ul>
                              <li><a href="post-details.html">
                                  <h5>Vestibulum id turpis porttitor sapien facilisis scelerisque</h5>
                                  <span>May 31, 2020</span>
                                </a></li>
                              <li><a href="post-details.html">
                                  <h5>Suspendisse et metus nec libero ultrices varius eget in risus</h5>
                                  <span>May 28, 2020</span>
                                </a></li>
                              <li><a href="post-details.html">
                                  <h5>Swag hella echo park leggings, shaman cornhole ethical coloring</h5>
                                  <span>May 14, 2020</span>
                                </a></li>
                            </ul>
                          </div>
                        </div>
                      </div>
                      <!-- --------- 最近文章區  結束 ------------ -->

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


          <script src="${contextRoot}/js/chen/blog/blogedit.js"></script>

          <!-- ------------- 新增文章 JS ----------------- -->
          <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

          <!-- ------------- 彈窗按鈕 JS ----------------- -->
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous">
            </script>

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

          <script language="text/Javascript">
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