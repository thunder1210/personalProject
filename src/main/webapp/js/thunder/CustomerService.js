var websocket = null;
if ("WebSocket" in window) {
  socketUrl = "ws://localhost:8080/onlinelearning/theMessenger/CS";
  websocket = new WebSocket(socketUrl);
} else {
  alert("很抱歉，您的瀏覽器版本不支援WebSocket");
}

websocket.onerror = function () {
  console.log("客服系統連線失敗");
};

var counter = 1;

websocket.onopen = function (data) {
  console.log("客服系統連線成功！");
  refreshTheList();
};

websocket.onmessage = function (event) {
  var msg = JSON.parse(event.data);
  console.log(msg.message.message)
  var reciver = msg.message;
  var tyType1 = "data:image/jpeg;base64";
  var tyType2 = "data:image/png;base64";
  if (reciver.includes(tyType1) || reciver.includes(tyType2)) {
    var senderId = msg.senderId;
    var chats = document.getElementsByClassName("chat");
    var Person = document.getElementsByClassName("person");
    for (let i = 0; i < chats.length; i++) {
      var memberchatBox = chats[i];
      var personPrev = Person[i];
      var memberChatId = chats[i].getAttribute("data-memberid");
      var personId = Person[i].getAttribute("data-memberid");
      if (memberChatId == senderId) {
        let div = document.createElement("div");
        div.className = "bubble you";
        div.innerHTML = "<img id=\"" + msg.messageTime + "\" width=\"100px\" src=\"" + msg.message + "\">";
        memberchatBox.appendChild(div);
        let revicedPic = document.getElementById(msg.messageTime)
        console.log(revicedPic)
        revicedPic.addEventListener("click", function (e) {
          this.setAttribute("height", 400);
          this.setAttribute("width", "90%");
          var $div = $(".active-chat");
          $div.scrollTop($div[0].scrollHeight);
        });
        revicedPic.addEventListener("dblclick", function (e) {
          this.setAttribute("width", 100);
          this.setAttribute("height", 120);
        });
      }
      if (personId == senderId) {
        Person[i].childNodes[3].innerText = "圖片";
      }
    }
    var $div = $(".active-chat");
    $div.scrollTop($div[0].scrollHeight);
    return;
  }

  var auth = "NewMember";
  if (msg.sendType == auth) {
    var theList = document.getElementById("allUsers");
    for (let i = 0; i < theList.childNodes.length; i++) {
      if (theList.children[i].getAttribute("data-memberid") == msg.senderId) {
        return;
      }
    }
    var boxAmount = document.getElementsByClassName("chat").length + 1;
    var innerCode = "";
    innerCode +=
      '<li class="person" data-memberid="' +
      msg.senderId +
      '" data-chat="person' +
      boxAmount +
      '">';
    innerCode += '<img src="' + msg.senderPhoto + '" />';
    innerCode += '<span class="name">' + msg.senderAccount + "</span>";
    innerCode += '<span class="time">' + msg.messageTime + "</span>";
    innerCode += '<span id="preview" class="preview"></span>';
    innerCode += "</li></ul>";

    var sunny =
      '<div class="chat" data-memberid="' +
      msg.senderId +
      '" data-chat="person' +
      boxAmount +
      '"><div class="conversation-start"><span>' +
      msg.senderId +
      "</span></div></div>";
    $("#theStartofChat").after(sunny);

    if (theList.childElementCount == 0) {
      theList.innerHTML = innerCode;
      document
        .querySelector(".chat[data-chat=person1]")
        .classList.add("active-chat");
      document
        .querySelector(".person[data-chat=person1]")
        .classList.add("active");
      document.getElementById("hiddenSendOutId").value = document
        .querySelector(".person[data-chat=person1]")
        .getAttribute("data-memberid");
    } else {
      $("#allUsers").children(":last-child").after(innerCode);
    }
    let friends = {
        list: document.querySelector("ul.people"),
        all: document.querySelectorAll(".left .person"),
        name: "",
      },
      chat = {
        container: document.querySelector(".container .right"),
        current: null,
        person: null,
        name: document.querySelector(".container .right .top .name"),
      };

    friends.all.forEach((f) => {
      f.addEventListener("mousedown", () => {
        f.classList.contains("active") || setAciveChat(f);
      });
    });

    function setAciveChat(f) {
      friends.list.querySelector(".active").classList.remove("active");
      f.classList.add("active");
      chat.current = chat.container.querySelector(".active-chat");
      chat.currentId = chat.container
        .querySelector(".active-chat")
        .getAttribute("data-memberid");
      chat.person = f.getAttribute("data-chat");
      chat.current.classList.remove("active-chat");
      chat.container
        .querySelector('[data-chat="' + chat.person + '"]')
        .classList.add("active-chat");
      friends.name = f.querySelector(".name").innerText;
      currentSendTo = f.getAttribute("data-memberid");
      chat.name.innerHTML = friends.name;
      document.getElementById("hiddenSendOutId").value = currentSendTo;
    }
    return;
  }
  var senderId = msg.senderId;
  var chats = document.getElementsByClassName("chat");
  var Person = document.getElementsByClassName("person");
  for (let i = 0; i < chats.length; i++) {
    var memberchatBox = chats[i];
    var personPrev = Person[i];
    var memberChatId = chats[i].getAttribute("data-memberid");
    var personId = Person[i].getAttribute("data-memberid");
    if (memberChatId == senderId) {
      let div = document.createElement("div");
      div.className = "bubble you";
      let translated = htmlEscape(msg.message);
      div.innerHTML = translated;
      memberchatBox.appendChild(div);
    }
    if (personId == senderId) {
      Person[i].childNodes[3].innerText = msg.message;
    }
  }
  var $div = $(".active-chat");
  $div.scrollTop($div[0].scrollHeight);
};

websocket.onclose = function () {
  console.log("it's all closed");
};

function sendMsg(msg) {
  websocket.send(msg);
}
function send() {
  var text = document.getElementById("theSenderInput").value;
  document.getElementById("theSenderInput").value = "";

  var toUser = document.getElementById("imSendingToYou").value;
  let date = new Date().toDateString();

  var req = {
    senderId: 99999999999,
    sendTo: document.getElementById("hiddenSendOutId").value,
    sendType: "客服回應",
    senderPhoto: "",
    message: text,
    messageTime: date,
    senderAccount: "CS",
  };
  console.log(req);

  var chats = document.getElementsByClassName("chat");
  for (let i = 0; i < chats.length; i++) {
    var memberchatBox = chats[i];
    var memberChatId = chats[i].getAttribute("data-memberid");
    if (memberChatId == document.getElementById("hiddenSendOutId").value) {
      let div = document.createElement("div");
      div.className = "bubble me";
      let translated = htmlEscape(text);
      div.innerHTML = translated;
      memberchatBox.appendChild(div);
    }
  }
  if (websocket) {
    websocket.send(JSON.stringify(req));
    var $div = $(".active-chat");
    $div.scrollTop($div[0].scrollHeight);
  }
}

function refreshTheList() {
  var reqUrl = "http://localhost:8080/onlinelearning/Membership/launchTheList";
  axios
    .post(reqUrl)
    .then((response) => {
      var theList = document.getElementById("allUsers");
      var innerCode = "";
      var chatBoxCounter = 1;
      theList.innerHTML = "";
      for (let i = 0; i < response.data.length; i++) {
        var boxAmount = document.getElementsByClassName("chat").length + 1;
        innerCode +=
          '<li class="person" data-memberid="' +
          response.data[i].chatMemberId +
          '" data-chat="person' +
          counter +
          '">';
        innerCode += '<img src="' + response.data[i].chatMemberPhoto + '" />';
        innerCode +=
          '<span class="name">' +
          response.data[i].chatMemberAccount +
          "</span>";
        innerCode += '<span class="time"></span>';
        innerCode += '<span id="preview" class="preview"></span>';
        innerCode += "</li>";
        var sunny =
          '<div class="chat" data-memberid="' +
          response.data[i].chatMemberId +
          '" data-chat="person' +
          boxAmount +
          '"><div class="conversation-start"><span>Today, 6:48 AM</span></div></div>';
        $("#theStartofChat").after(sunny);
        counter++;
      }
      counter = 1;
      theList.innerHTML = innerCode;
      document
        .querySelector(".chat[data-chat=person1]")
        .classList.add("active-chat");
      document
        .querySelector(".person[data-chat=person1]")
        .classList.add("active");
      document.getElementById("hiddenSendOutId").value = document
        .querySelector(".person[data-chat=person1]")
        .getAttribute("data-memberid");

      let friends = {
          list: document.querySelector("ul.people"),
          all: document.querySelectorAll(".left .person"),
          name: "",
        },
        chat = {
          container: document.querySelector(".container .right"),
          current: null,
          person: null,
          name: document.querySelector(".container .right .top .name"),
        };

      friends.all.forEach((f) => {
        f.addEventListener("mousedown", () => {
          f.classList.contains("active") || setAciveChat(f);
        });
      });

      function setAciveChat(f) {
        friends.list.querySelector(".active").classList.remove("active");
        f.classList.add("active");
        chat.current = chat.container.querySelector(".active-chat");
        chat.currentId = chat.container
          .querySelector(".active-chat")
          .getAttribute("data-memberid");
        chat.person = f.getAttribute("data-chat");
        chat.current.classList.remove("active-chat");
        chat.container
          .querySelector('[data-chat="' + chat.person + '"]')
          .classList.add("active-chat");
        friends.name = f.querySelector(".name").innerText;
        currentSendTo = f.getAttribute("data-memberid");
        chat.name.innerHTML = friends.name;
        document.getElementById("hiddenSendOutId").value = currentSendTo;
      }
    })
    .catch((error) => {
      console.log(error);
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

function requestComment() {
  var chats = document.getElementsByClassName("chat");
  var Person = document.getElementsByClassName("person");
  for (let i = 0; i < chats.length; i++) {
    var memberchatBox = chats[i];
    var memberChatId = chats[i].getAttribute("data-memberid");
    if (memberChatId == document.getElementById("hiddenSendOutId").value) {
      let div = document.createElement("div");
      div.className = "bubble me";
      div.innerText = "已送出本次對話評分邀請！";
      memberchatBox.appendChild(div);
      var $div = $(".active-chat");
      $div.scrollTop($div[0].scrollHeight);

      var req = {
        senderId: 99999999999,
        sendTo: document.getElementById("hiddenSendOutId").value,
        sendType: "客服評分",
        senderPhoto: "",
        message: "客服評分ZFKQP",
        messageTime: new Date().toDateString(),
        senderAccount: "CS",
      };
      if (websocket) {
        websocket.send(JSON.stringify(req));
      }
    }
  }
}

function upload(f) {
  for (var i = 0; i < f.length; i++) {
    var reader = new FileReader();
    reader.readAsDataURL(f[i]);
    reader.onload = function (e) {
      const base64Img = e.target.result;
      var chats = document.getElementsByClassName("chat");
      var Person = document.getElementsByClassName("person");
      for (let i = 0; i < chats.length; i++) {
        var memberchatBox = chats[i];
        var memberChatId = chats[i].getAttribute("data-memberid");
        if (memberChatId == document.getElementById("hiddenSendOutId").value) {
          let div = document.createElement("div");
          div.className = "bubble me";
          var img = document.createElement("img");
          img.src = base64Img;
          img.width = 100;
          div.appendChild(img);
          memberchatBox.appendChild(div);
          var $div = $(".active-chat");
          $div.scrollTop($div[0].scrollHeight);

          var pic = "";
          pic = base64Img;

          var req = {
            senderId: 99999999999,
            sendTo: document.getElementById("hiddenSendOutId").value,
            sendType: "客服圖片",
            senderPhoto: "",
            message: base64Img,
            messageTime: new Date().toDateString(),
            senderAccount: "CS",
          };
          if (websocket) {
            websocket.send(JSON.stringify(req));
          }

          img.addEventListener("click", function (e) {
            this.setAttribute("height", 400);
            this.setAttribute("width", "80%");
            var $div = $(".active-chat");
            $div.scrollTop($div[0].scrollHeight);
          });

          img.addEventListener("dblclick", function (e) {
            this.setAttribute("width", 100);
            this.setAttribute("height", 120);
          });
        }
      }
    };
  }
  var $div = $(".active-chat");
  $div.scrollTop($div[0].scrollHeight);
}
