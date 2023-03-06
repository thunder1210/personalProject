var websocket = null;
if ("WebSocket" in window) {
  var id = document.getElementById("mName").value;
  socketUrl = "ws://localhost:8080/onlinelearning/theMessenger/" + id;
  websocket = new WebSocket(socketUrl);
} else {
  alert("很抱歉，您的瀏覽器版本不支援WebSocket");
}

websocket.onerror = function () {
  console.log("客服系統連線失敗");
};

websocket.onopen = function () {
  console.log("客服系統連線成功！");
  $(".messages").append(
    '<li style="margin-left:15%;">歡迎光臨OnlineLearning<br>客服通訊系統！</li>'
  );
};

websocket.onmessage = function (event) {
  console.log(event.data);

  if (event.data.includes("客服評分ZFKQP")) {
    $(".messages").append(`"<div class="CommentContainer">
      <div class="post"><div class="text" style="font-weight: bolder;text-align:center;font-size:17px">
      已收到您的寶貴意見！<br>感謝您的來訪！</div>
      </div><div id="thanksforCommming" style="text-align: center;font-weight: bolder;color:black;font-size:16px">
        感謝您的來訪，客服誠摯邀請您<br />
        對本次服務給予評價：</div>
      <div id="star-widget" class="star-widget">
        <input type="radio" name="rate" id="rate-5" />
        <label for="rate-5" class="fas fa-star"></label>
        <input type="radio" name="rate" id="rate-4" />
        <label for="rate-4" class="fas fa-star"></label>
        <input type="radio" name="rate" id="rate-3" />
        <label for="rate-3" class="fas fa-star"></label>
        <input type="radio" name="rate" id="rate-2" />
        <label for="rate-2" class="fas fa-star"></label>
        <input type="radio" name="rate" id="rate-1" />
        <label for="rate-1" class="fas fa-star"></label>
        <form class="commentForm">
        <header id="starCount"></header><div class="textarea"><textarea id="Scontents" cols="30" ></textarea></div>
        <div class="btn"><button type="reset" onclick="ScoreResult()" id="sendOutScore">送出評分！</button></div></Form></div></div>"`);
    return;
  }
  if (event.data.includes("data:image/jpeg;base64")) {
    $(".messages").append(
      '<li class="other"><img id="theSenderPic" src="' +
        event.data +
        '"width="100" heigh="80" ">' +
        "</li>"
    );
    var picpic = document.getElementById('theSenderPic');
    picpic.addEventListener("click", function (e) {
      this.setAttribute("height", 400);
      this.setAttribute("width", "90%");

            var messagesContainer = $('.messages');
            messagesContainer.finish().animate({
            scrollTop: messagesContainer.prop("scrollHeight")
          }, 250);
    });
    picpic.addEventListener("dblclick", function (e) {
      this.setAttribute("width", 100);
      this.setAttribute("height", 120);
      var messagesContainer = $('.messages');
      messagesContainer.finish().animate({
      scrollTop: messagesContainer.prop("scrollHeight")
    }, 250);
    });
    var messagesContainer = $('.messages');
    messagesContainer.finish().animate({
    scrollTop: messagesContainer.prop("scrollHeight")
  }, 250);
    return;
  }
  var TransText = htmlEscape(event.data);
  $(".messages").append('<li class="other">' + TransText + "</li>");
  //document.getElementById("textarea-cu").value='';
  var messagesContainer = $(".messages");
  messagesContainer.finish().animate(
    {
      scrollTop: messagesContainer.prop("scrollHeight"),
    },
    250
  );
};

websocket.onclose = function () {
  console.log("it's all closed");
};

$("#text-box").bind("keyup", function (event) {
  if (event.keyCode == "13") {
    var text = document.getElementById("text-box").textContent;
    if (text == "") {
      return;
    }

    var text = document.getElementById("text-box").textContent;
    document.getElementById("text-box").value = "";
    var textTran = htmlEscape(text);
    $(".messages").append('<li class="self">' + textTran + "</li>");
    sendMsg(text);
    var element = $(".floating-chat");
    var messages = element.find(".messages");
    var textInput = element.find(".text-box");
    element.find(">i").hide();
    element.addClass("expand");
    element.find(".chat").addClass("enter");
    var strLength = textInput.val().length * 2;
    textInput.keydown(onMetaAndEnter).prop("disabled", false).focus();
    element.off("click", openElement);
    element.find(".header button").click(closeElement);
    element.find("#sendMessage").click(sendNewMessage);
    messages.scrollTop(messages.prop("scrollHeight"));
    document.getElementById("text-box").innerText = "";

    var messagesContainer = $(".messages");
    messagesContainer.finish().animate({scrollTop: messagesContainer.prop("scrollHeight"),},250);
  }
});

function sendMsg(msg) {
  websocket.send(msg);
}

function send() {
  var text = document.getElementById("text-box").textContent;
  if (text == "") {
    Swal.fire({
      position: "top-end",
      icon: "未輸入內容",
      title: "請填寫內容再送出！",
      showConfirmButton: false,
      timer: 1500,
    });
    return;
  }
  var textTran = htmlEscape(text);
  document.getElementById("text-box").value = "";
  $(".messages").append('<li class="self">' + textTran + "</li>");
  sendMsg(text);
}

function ScoreResult() {
  const btn = document.querySelector(".sendOutScore");
  document.querySelector("#thanksforCommming").remove();
  const post = document.querySelector(".post");
  const widget = document.querySelector(".star-widget");
  const editBtnComment = document.querySelector(".edit");
  widget.style.display = "none";
  post.style.display = "block";
  var starArea = document.getElementById("starCount");
  const stars = window.getComputedStyle(starArea, "::before");
  var sAmount = 0;
  if (stars.content.includes("一星")) {
    sAmount = 1;
  } else if (stars.content.includes("二星")) {
    sAmount = 2;
  } else if (stars.content.includes("三星")) {
    sAmount = 3;
  } else if (stars.content.includes("四星")) {
    sAmount = 4;
  } else if (stars.content.includes("五星")) {
    sAmount = 5;
  }
  var date = new Date();
  const formatDate = (current_datetime) => {
    let formatted_date =
      current_datetime.getFullYear() +
      "-" +
      (current_datetime.getMonth() + 1) +
      "-" +
      current_datetime.getDate() +
      " " +
      current_datetime.getHours() +
      ":" +
      current_datetime.getMinutes() +
      ":" +
      current_datetime.getSeconds();
    return formatted_date;
  };
  const theid = document.getElementById("theId").value;
  var req = {
    starCounts: sAmount,
    feedbackContent: document.getElementById("Scontents").value,
    feedbackTime: formatDate(date),
    memberid: theid,
  };
  let url =
    "http://localhost:8080/onlinelearning/Membership/newExperienceComment";
  axios.post(url, req).then((response) => {
    console.log(response);
  });
}

function htmlEscape(str) {
  return String(str)
    .replace(/&/g, "&amp;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&#39;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;");
}

   