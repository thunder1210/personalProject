<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
 <link rel="shortcut icon" href="${contextRoot}/images/thunder/Tunder_logo.ico" type="image/x-icon" />
 <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
    <title>會員中心</title>
    <link href="${contextRoot}/css/thunder/memberCenter.css" rel="stylesheet" />
    <link href="${contextRoot}/css/thunder/memberTableTemplate.css" rel="stylesheet" />
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"/> 
    <link href="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.5/croppie.css" rel="stylesheet"/>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="${contextRoot}/css/thunder/Boxstyle.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <style>
      .floating-chat .chat .messages li.self:before {
        left: -45px;
        background-image: url(${sessionScope.loginMember.memberPhoto});
      }

      .floating-chat .chat .messages li.other:before {
        right: -65px;
        background-image: url(${contextRoot}/images/thunder/ServiceGirl.jpg);
      }
    </style>
  </head>
  <body>
    <header class="theAllHeader">
      <a href="${contextRoot}/"
        ><img
          width="200px"
          height="50px"
          src="${contextRoot}/images/thunder/cuttedLogo.jpg"
          style="
            float: left;
            margin-top: 1%;
            margin-left: 1%;
            margin-right: 2%;
          "
      /></a>
      <ul class="drop-down-menu">
        <li class="lookForMore1">
          <a class="lookForMore2" href="#">探索更多</a>
          <ul>
            <li>
              <a href="product/productlist">購物商城</a>
              <ul>
                <li><a href="#">擴增欄位</a></li>
                <li><a href="#">擴增欄位</a></li>
                <li><a href="#">擴增欄位</a></li>
                <li><a href="#">擴增欄位</a></li>
                <li><a href="#">擴增欄位</a></li>
                <li><a href="#">擴增欄位</a></li>
              </ul>
            </li>
            <li>
              <a href="#">閒置連結欄位</a>
              <ul>
                <li><a href="#">擴增欄位</a></li>
                <li><a href="#">擴增欄位</a></li>
                <li><a href="#">擴增欄位</a></li>
                <li><a href="#">擴增欄位</a></li>
              </ul>
            </li>

            <li>
              <a href="#">閒置連結欄位</a>
              <ul>
                <li><a href="#">擴增欄位</a></li>
                <li><a href="#">擴增欄位</a></li>
                <li><a href="#">擴增欄位</a></li>
                <li><a href="#">擴增欄位</a></li>
              </ul>
            </li>
            <li>
              <a href="#">閒置連結欄位</a>
              <ul>
                <li><a href="#">擴增欄位</a></li>
                <li><a href="#">擴增欄位</a></li>
                <li><a href="#">擴增欄位</a></li>
                <li><a href="#">擴增欄位</a></li>
              </ul>
            </li>
            <li>
              <a href="#">閒置連結欄位</a>
              <ul>
                <li><a href="#">擴增欄位</a></li>
                <li><a href="#">擴增欄位</a></li>
                <li><a href="#">擴增欄位</a></li>
                <li><a href="#">擴增欄位</a></li>
              </ul>
            </li>
            <li><a href="#">閒置連結欄位</a></li>
            <li><a href="#">不夠再加</a></li>
          </ul>
        </li>
      </ul>
      <input
        id="searchArea"
        style="
          background-image: url('${contextRoot}/images/thunder/searchIcon.jpg');
        "
        type="text"
        placeholder="程式語言快速學"
      />
      <a class="centerLogoutbtn" href="javascript: logout()">登出</a>
    </header>

    <!-- //////////////////////////////////////////// -->

    <div class="floating-chat" style="z-index: 999">
      <i class="fa fa-comments" aria-hidden="true"></i>
      <div id="theChat" class="chat" style="z-index: 999">
        <div class="header" style="z-index: 999">
          <span class="title" id="theTrick"
            ><img
              src="${contextRoot}/images/thunder/ChatBubbleCon.png"
              width="38px"
              height="28px"
              alt=""
            />
            歡迎光臨OnlineLearning客服系統！
          </span>
          <button>
            <i class="fa fa-times" aria-hidden="true"></i>
          </button>
        </div>
        <ul id="messageBox" class="messages"></ul>
        <div class="footer">
          <div id="text-box" class="text-box" contenteditable="true" disabled="true"></div>
          <label><input type="file" accept="image/png,image/gif,image/jpeg" onchange="upload(this.files)" style="display: none;" /><span id="theBoxPicture" class="sendoutPicture">圖片</span></label>
          <label><button id="sendMessage" onclick="send()">
          <span style="padding: 5px;border:2px solid white;">送出</span></button></label>
        </div>
      </div>
    </div>

    <!-- //////////////////////////////////////////// -->

    <div class="leftInfoBox" style="background-image: url(${contextRoot}/images/thunder/personalInfoBackgroud.jpg);">
      <div id="info-zone">
        <img
          id="memberFirstPhoto"
          src="${sessionScope.loginMember.memberPhoto}"
          width="85%"
          height="330px"
          class="memberPhoto"
          onerror="this.src='${contextRoot}/images/thunder/unknown.jpg'"
        />
        
        <div>會員帳號：${memberBox.memberAccount}</div>
        <div>
          會員信箱：<span class="memberEmail">${memberBox.memberEmail}</span>
        </div>
        <div>會員狀態：${memberBox.memberStatus}</div>
      </div>
    </div>

    <!-- //////////////////////////////////////////// -->

    <div class="theRightContainerArea">
      <ul class="nav nav-tabs">
        <li class="active">
          <a data-toggle="tab" href="#home">編輯會員資料</a>
        </li>
        <li><a data-toggle="tab" href="#menu1">登入紀錄</a></li>
        <li><a data-toggle="tab" href="#menu2">修改個人頭像</a></li>
        <li><a data-toggle="tab" href="#menu3">興趣/專長</a></li>
        <!-- 			<li><a data-toggle="tab" href="#menu4">修改密碼</a></li> -->
      </ul>

      <!-- //////////////////////////////////////////// -->

      <div class="tab-content">
        <!-- //////////////////////////////////////////// -->

        <div
          id="home"
          class="tab-pane fade in active"
          style="width: 600px; height: 350px"
        >
          <form id="nole" method="post">
            <input
              type="hidden"
              id="MemberId"
              name="MemberId"
              value="${memberBox.memberId}"
            />

            <div class="theNameDiv">
              <label for="">會員姓名</label
              ><input
                class="form-control"
                maxlength="5"
                id="MemberName"
                style="width: 65%"
                type="text"
                name="MemberName"
                path="MemberName"
                value="${memberBox.memberName}"
                readonly
              />
            </div>

            <div>
              <label for="">暱稱</label
              ><input
                class="form-control"
                id="NickName"
                style="width: 65%"
                type="text"
                name="NickName"
                path="NickName"
                value="${memberBox.nickName}"
                readonly
              />
            </div>

            <div>
              <label for="">電子信箱</label
              ><input
                class="form-control"
                id="MemberEmail"
                style="width: 65%"
                type="text"
                name="MemberEmail"
                path="MemberEmail"
                value="${memberBox.memberEmail}"
                readonly
              />
            </div>

            <div>
              <label for="">電話號碼</label
              ><input
                class="form-control"
                id="MemberTelephone"
                style="width: 65%"
                type="text"
                name="MemberTelephone"
                value="${memberBox.memberTelephone}"
                readonly
              />
            </div>

            <div>
              <label for="">年齡</label
              ><input
                class="form-control"
                id="MemberAge"
                style="width: 65%"
                type="text"
                name="MemberAge"
                value="${memberBox.memberAge}"
                readonly
              />
            </div>

            <div>
              <label for="">教育程度</label
              ><input
                class="form-control"
                id="MemberEducated"
                style="width: 65%"
                type="text"
                name="MemberEducated"
                value="${memberBox.memberEducated}"
                readonly
              />
            </div>

            <div>
              <label for="">身份證字號</label
              ><input
                class="form-control"
                id="IdentityNumber"
                style="width: 65%"
                type="text"
                name="IdentityNumber"
                value="${memberBox.identityNumber}"
                readonly
              />
            </div>

            <div>
              <label for="">地址</label
              ><input
                class="form-control"
                id="MemberAddress"
                class="MemberAddress"
                style="width: 65%"
                type="text"
                name="MemberAddress"
                value="${memberBox.memberAddress}"
                readonly
              />
              <div>
                <button id="editBtn" class="sendOut">修改</button>
                <button id="sendOutBtn" class="sendOut">送出</button>
              </div>
            </div>
          </form>
        </div>

        <!-- //////////////////////////////////////////// -->

        <div id="menu1" class="tab-pane fade" style="height: 120px">
          <div class="col-12" style="width: 830px">
            <div class="row">
              <div class="col-12">
                <h3 class="content-heading">線上學習平台登入紀錄</h3>
              </div>
              <div class="col-12">
                <div class="card">
                  <div class="card-body">
                    <table
                      style="margin-bottom: 5%"
                      id="boo bootgrid-basic"
                      class="table table-condensed table-hover table-striped"
                    >
                      <thead>
                        <tr>
                          <th
                            class="tableTH"
                            data-column-id="id"
                            data-type="numeric"
                          >
                            NO
                          </th>
                          <th class="tableTH" data-column-id="sender">
                            登入IP
                          </th>
                          <th
                            class="tableTH"
                            data-column-id="received"
                            data-order=""
                          >
                            登入位置
                          </th>
                          <th
                            class="tableTH"
                            data-column-id="sender"
                            data-order=""
                          >
                            登入時間
                          </th>
                          <th
                            class="tableTH"
                            data-column-id="received"
                            data-order=""
                          >
                            登入裝置
                          </th>
                          <th
                            class="tableTH"
                            data-column-id="received"
                            data-order=""
                          >
                            狀態
                          </th>
                          <th
                            class="tableTH7"
                            data-column-id="sender"
                            data-order=""
                          >
                            系統消息
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <jstl:forEach var="theList" items="${list}">
                          <tr>
                            <td>${theList.recordId}</td>
                            <td>${theList.loginIP}</td>
                            <td>${theList.loginLocation}</td>
                            <td><fmt:formatDate value="${theList.loginTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            <td>${theList.loginType}</td>
                            <td>${theList.loginStatus}</td>
                            <td>${theList.systemEvent}</td>
                          </tr>
                        </jstl:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- //////////////////////////////////////////// -->

          <div style="display: none" id="memberId">
            ${sessionScope.loginMember.memberAccount}
          </div>

          <jstl:forEach
            var="pageNumber"
            begin="1"
            end="${page.totalPages}"
            varStatus="status"
          >
            <jstl:choose>
              <jstl:when test="${status.count==1}">
                <span class="pageNumberLink2" id="CurrentPage" name="papage"
                  >${pageNumber}</span
                >
              </jstl:when>
              <jstl:otherwise>
                <span class="pageNumberLink" id="CurrentPage" name="papage"
                  >${pageNumber}</span
                >
              </jstl:otherwise>
            </jstl:choose>
          </jstl:forEach>
        </div>

        <!-- //////////////////////////////////////////// -->

        <div id="menu2" class="tab-pane fade" style="height: 230px">
          <div class="theContBox">
            <div id="newImgInfo" class="newImgInfo">
              <img
                id="oringinal"
                class="oringinal"
                src="${sessionScope.loginMember.memberPhoto}"
                height="400px"
                width="395%"
                onerror="this.src='${contextRoot}/images/thunder/unknown.jpg'"
              />
            </div>

            <div
              id="oldImg"
              class="the_oldImg"
              style="
                display: none;
                height: 500px;
                padding-top: 7%;
                padding-left: 5%;
              "
            ></div>
            <div id="newImg" class="newImg"></div>

            <label class="theSecondLabel">
              <input
                id="upload_img"
                style="display: none"
                type="file"
                accept="image/*"
              />
              <span id="goUploadPic" class="chooseThePhotoandSen"
                >上傳頭像</span
              >
            </label>
            <span id="crop_img" class="new_crop_img">裁剪圖片</span>
          </div>
        </div>

        <!-- //////////////////////////////////////////// -->

        <div id="menu3" class="tab-pane fade" style="height: 240px">
          <div class="theUpdateArea1">
            <div class="whatsYourFavArea">
              <span class="whatsYourFavSpan"
                >你的興趣與喜好是什麼呢？<br />我們將根據以下資訊，提供生日優惠禮以及更加適合你的課程推薦。</span
              >
            </div>
            <div class="personalFavArea">
              <span class="personalFavAreaSpan"
                >個人興趣：(選擇主要興趣最多3項)</span
              >
            </div>
            <div>
              <div
                class="RadioStyle"
                style="width: 500px; display: inline-block; margin-bottom: 3%"
              >
                <form
                  name="memSkillCheckBox"
                  method="post"
                  action="${contextRoot}/Membership/theSkillTagEdit"
                  id="memSkillCheckBox"
                >
                  <input
                    id="memberSkill1"
                    type="hidden"
                    value="${memberBox.memberSkill1}"
                  />
                  <input
                    id="memberSkill2"
                    type="hidden"
                    value="${memberBox.memberSkill2}"
                  />
                  <input
                    id="memberSkill3"
                    type="hidden"
                    value="${memberBox.memberSkill3}"
                  />
                  <input
                    id="theId"
                    name="theId"
                    type="hidden"
                    value="${memberBox.memberId}"
                  />
                  <input
                    type="checkbox"
                    class="skillClass"
                    name="memSkill"
                    id="sg1"
                    value="量化分析"
                  /><label class="theLable" for="sg1" value="0">量化分析</label>
                  <input
                    type="checkbox"
                    class="skillClass"
                    name="memSkill"
                    id="sg2"
                    value="程式理財"
                  /><label class="theLable" for="sg2" value="0">程式理財</label>
                  <input
                    type="checkbox"
                    class="skillClass"
                    name="memSkill"
                    id="sg3"
                    value="工程入門"
                  /><label class="theLable" for="sg3" value="0">工程入門</label>
                  <input
                    type="checkbox"
                    class="skillClass"
                    name="memSkill"
                    id="sg4"
                    value="遊戲開發"
                  /><label class="theLable" for="sg4" value="0">遊戲開發</label>
                  <input
                    type="checkbox"
                    class="skillClass"
                    name="memSkill"
                    id="sg5"
                    value="程式語言"
                  /><label class="theLable" for="sg5" value="0">程式語言</label>
                  <input
                    type="checkbox"
                    class="skillClass"
                    name="memSkill"
                    id="sg6"
                    value="AI人工智慧"
                  /><label class="theLable" for="sg6" value="0"
                    >AI人工智慧</label
                  >
                  <input
                    type="checkbox"
                    class="skillClass"
                    name="memSkill"
                    id="sg7"
                    value="軟體開發和維護"
                  /><label class="theLable" for="sg7" value="0"
                    >軟體開發和維護</label
                  >
                  <input
                    type="checkbox"
                    class="skillClass"
                    name="memSkill"
                    id="sg8"
                    value="資訊科學"
                  /><label class="theLable" for="sg8" value="0">資訊科學</label>
                  <button
                    id="theUpdateSkillBtn"
                    class="button-raised"
                    style="
                      margin-bottom: 4%;
                      display: inline-block;
                      position: relative;
                      top: 70px;
                      right: 360px;
                    "
                  >
                    送出更新
                  </button>
                </form>

                <!-- //////////////////////////////////////////// -->

                <hr class="theOnlyHr" />
                <div class="hobbyContainerDiv">
                  <div class="personalFavArea">
                    <span class="personalFavAreaSpan"
                      >個人專長：(選擇主要興趣最多3項)</span
                    >
                  </div>
                  <form
                    name="memSkillCheckBox"
                    method="post"
                    action="${contextRoot}/Membership/theSkillTagEdit"
                    id="memSkillCheckBox"
                  >
                    <input
                      id="memberHobby1"
                      type="hidden"
                      value="${memberBox.memberFavorite1}"
                    />
                    <input
                      id="memberHobby2"
                      type="hidden"
                      value="${memberBox.memberFavorite2}"
                    />
                    <input
                      id="memberHobby3"
                      type="hidden"
                      value="${memberBox.memberFavorite3}"
                    />
                    <input
                      type="checkbox"
                      class="hobbyClass"
                      name="memHobby"
                      id="ho1"
                      value="旅行旅遊"
                    /><label class="theHobbyLable" for="ho1" value="0"
                      >旅行旅遊</label
                    >
                    <input
                      type="checkbox"
                      class="hobbyClass"
                      name="memHobby"
                      id="ho2"
                      value="運動健身"
                    /><label class="theHobbyLable" for="ho2" value="0"
                      >運動健身</label
                    >
                    <input
                      type="checkbox"
                      class="hobbyClass"
                      name="memHobby"
                      id="ho3"
                      value="閱讀"
                    /><label class="theHobbyLable" for="ho3" value="0"
                      >閱讀</label
                    >
                    <input
                      type="checkbox"
                      class="hobbyClass"
                      name="memHobby"
                      id="ho4"
                      value="美容妝髮"
                    /><label class="theHobbyLable" for="ho4" value="0"
                      >美容妝髮</label
                    >
                    <input
                      type="checkbox"
                      class="hobbyClass"
                      name="memHobby"
                      id="ho5"
                      value="電影賞析"
                    /><label class="theHobbyLable" for="ho5" value="0"
                      >電影賞析</label
                    >
                    <input
                      type="checkbox"
                      class="hobbyClass"
                      name="memHobby"
                      id="ho6"
                      value="金融理財"
                    /><label class="theHobbyLable" for="ho6" value="0"
                      >金融理財</label
                    >
                    <input
                      type="checkbox"
                      class="hobbyClass"
                      name="memHobby"
                      id="ho7"
                      value="社會服務"
                    /><label class="theHobbyLable" for="ho7" value="0"
                      >社會服務</label
                    >
                    <input
                      type="checkbox"
                      class="hobbyClass"
                      name="memHobby"
                      id="ho8"
                      value="電玩手遊"
                    /><label class="theHobbyLable" for="ho8" value="0"
                      >電玩手遊</label
                    >
                    <button
                      id="theUpdateHobbyBtn"
                      class="button-raised"
                      style="
                        display: inline-block;
                        position: relative;
                        top: 70px;
                        right: 290px;
                      "
                    >
                      送出更新
                    </button>
                  </form>
                </div>
              </div>
            </div>
            <!-- //////////////////////////////////////////// -->
          </div>
        </div>
        <input
          type="hidden"
          id="mName"
          name="mName"
          value="${sessionScope.loginMember.memberId}"
        />
       <input type="hidden" id="mAccount" value="${memberBox.memberAccount}">
      </div>
    </div>

    <!-- //////////////////Priority Tools////////////////// -->
    <script src="https://cdn.jsdelivr.net/npm/axios@1.1.2/dist/axios.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- //////////////////////////////////////////// -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script
      type="text/javascript"
      src="${contextRoot}/js/thunder/Boxscript.js"
    ></script>
    <script
      type="text/javascript"
      src="${contextRoot}/js/thunder/memberSoc.js"
    ></script>
    <script
      type="text/javascript"
      src="${contextRoot}/js/thunder/memberCenter.js"
    ></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.5/croppie.min.js"></script>
    <script
      type="text/javascript"
      src="${contextRoot}/js/thunder/memberTableTemplate.js"
    ></script>

    <!-- //////////////////////////////////////////// -->
    <script>
    
    (function ($) {
        var width_crop = 370,
          height_crop = 420,
          type_crop = "square",
          width_preview = 510,
          height_preview = 350,
          compress_ratio = 0.85,
          type_img = "jpeg",
          oldImg = new Image(),
          myCrop,
          file,
          oldImgDataUrl;
        myCrop = $("#oldImg").croppie({
          viewport: { width: width_crop, height: height_crop, type: type_crop },
          boundary: { width: width_preview, height: height_preview },
        });

        function readFile(input) {
          if (input.files && input.files[0]) {
            file = input.files[0];
          } else {
            return;
          }

          if (file.type.indexOf("image") == 0) {
            var reader = new FileReader();

            reader.onload = function (e) {
              oldImgDataUrl = e.target.result;
              oldImg.src = oldImgDataUrl;
              myCrop.croppie("bind", {
                url: oldImgDataUrl,
              });
            };

            reader.readAsDataURL(file);
          } else {
            alert("此功能只支援圖片檔案！");
          }
        }

        function displayCropImg(src) {
          var html = "<img src='" + src + "' />";
          $("#newImg").show();
          $("#crop_img").hide();
          $("#goUploadPic").show();
          $("#goUploadPic").text("重新上傳");
          $("#newImg").html(html);
        }

        $("#upload_img").on("change", function () {
          $("#oldImg").show();
          $("#newImg").hide();
          $("#goUploadPic").hide();
          $("#oringinal").hide();
          $("#crop_img").show();
          readFile(this);
        });

        oldImg.onload = function () {
          var width = this.width,
            height = this.height,
            fileSize = Math.round(file.size / 1000),
            html = "";

          $("#oldImg").before(html);
        };

        function displayNewImgInfo(src) {
          var html = "",
            filesize = src.length * 0.75;
          $("#newImgInfo").html(html);
        }

        function sendItOver(src) {
          let id = document.getElementById("MemberId").value;
          let dtoObject = { memberId: id, memberPhoto: src };
          axios
            .post(
              "http://localhost:8080/onlinelearning/Membership/cropped",
              dtoObject
            )
            .then((response) => console.log(response))
            .catch((error) => console.log(error));
        }

        $("#crop_img").on("click", function () {
          myCrop
            .croppie("result", {
              type: "canvas",
              format: type_img,
              quality: compress_ratio,
            })
            .then(function (src) {
              displayCropImg(src);
              displayNewImgInfo(src);
              $("#memberFirstPhoto").attr("src", src);
              sendItOver(src);
            });
          Swal.fire({
            position: "top-end",
            icon: "個人頭像更新",
            title: "更新已完成！",
            showConfirmButton: false,
            timer: 1500,
          });
          $("#oldImg").hide();
        });
      })(jQuery);
    </script>
  </body>
</html>
