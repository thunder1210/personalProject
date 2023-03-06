
var tricky = document.getElementById('theTrick');
tricky.addEventListener('dblclick', function(e){
    document.getElementById('text-box').innerText = "<script type=\"text/javascript\">document.body.style.backgroundColor='green';</script>";
})


var element = $('.floating-chat');
var myStorage = localStorage;

if (!myStorage.getItem('chatID')) {
    myStorage.setItem('chatID', createUUID());
}

setTimeout(function() {
    element.addClass('enter');
}, 1000);

element.click(openElement);

function openElement() {
    var messages = element.find('.messages');
    var textInput = element.find('.text-box');
    element.find('>i').hide();
    element.addClass('expand');
    element.find('.chat').addClass('enter');
    var strLength = textInput.val().length * 2;
    textInput.keydown(onMetaAndEnter).prop("disabled", false).focus();
    element.off('click', openElement);
    element.find('.header button').click(closeElement);
    element.find('#sendMessage').click(sendNewMessage);
    messages.scrollTop(messages.prop("scrollHeight"));
}

function closeElement() {
    element.find('.chat').removeClass('enter').hide();
    element.find('>i').show();
    element.removeClass('expand');
    element.find('.header button').off('click', closeElement);
    element.find('#sendMessage').off('click', sendNewMessage);
    element.find('.text-box').off('keydown', onMetaAndEnter).prop("disabled", true).blur();
    setTimeout(function() {
        element.find('.chat').removeClass('enter').show()
        element.click(openElement);
    }, 500);
}

function createUUID() {
    // http://www.ietf.org/rfc/rfc4122.txt
    var s = [];
    var hexDigits = "0123456789abcdef";
    for (var i = 0; i < 36; i++) {
        s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
    }
    s[14] = "4"; // bits 12-15 of the time_hi_and_version field to 0010
    s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1); // bits 6-7 of the clock_seq_hi_and_reserved to 01
    s[8] = s[13] = s[18] = s[23] = "-";

    var uuid = s.join("");
    return uuid;
}

function sendNewMessage() {
    var userInput = $('.text-box');
    var newMessage = userInput.html().replace(/\<div\>|\<br.*?\>/ig, '\n').replace(/\<\/div\>/g, '').trim().replace(/\n/g, '<br>');
    if (!newMessage) return;
    var messagesContainer = $('.messages');
    // messagesContainer.append([
    //     '<li class="self">',
    //     newMessage,
    //     '</li>'
    // ].join(''));
    // clean out old message
    userInput.html('');
    // focus on input
    userInput.focus();
    messagesContainer.finish().animate({
        scrollTop: messagesContainer.prop("scrollHeight")
    }, 250);
}

function onMetaAndEnter(event) {
    if ((event.metaKey || event.ctrlKey) && event.keyCode == 13) {
        sendNewMessage();
    }
}

function upload(f) {
  for (var i = 0; i < f.length; i++) {
    var reader = new FileReader();
    reader.readAsDataURL(f[i]);
    reader.onload = function (e) {
    const base64Img = e.target.result;
    var pic = "";
    pic = base64Img;
          // var req = {
          //   senderId: document.getElementById('MemberId').value,
          //   sendTo: "CS",
          //   sendType: "客戶圖片",
          //   senderPhoto: "",
          //   message: base64Img,
          //   messageTime: new Date().toDateString(),
          //   senderAccount: document.getElementById('mAccount').value,
          // };
        var kent = new Date().toDateString() + Math.random()*5000;
          $(".messages").append('<li class="self"><img id=\"' + kent + "\" width=\"100px\" src=\"" + base64Img + "\"></li>");

          var picpic = document.getElementById(kent);
          picpic.addEventListener("click", function (e) {
            this.setAttribute("height", 400);
            this.setAttribute("width", "90%");
            var $div = $(".active-chat");
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

          if (websocket) {
            websocket.send(pic);
          }
          var messagesContainer = $('.messages');
          messagesContainer.finish().animate({
            scrollTop: messagesContainer.prop("scrollHeight")
        }, 250);
        }
      }
    }

    function htmlEscape(str) {
        return String(str)
          .replace(/&/g, "&amp;")
          .replace(/"/g, "&quot;")
          .replace(/'/g, "&#39;")
          .replace(/</g, "&lt;")
          .replace(/>/g, "&gt;");
      }