

const trick = document.getElementById('advicePhotoSize');
trick.addEventListener('dblclick', function(e){
  document.getElementById('MemberAccount').value = "eeit157039"
  document.getElementById('MemberPassword').value = "test1234"
  document.getElementById('MemberPassword2').value = "test1234"
  document.getElementById('MemberName').value = "趙衛雷"
  document.getElementById('NickName').value = "小雷"
  document.getElementById('MemberAge').value = 18
  document.getElementById('MemberEmail').value = "nathanielredemption1210@gmail.com"
  document.getElementById('IdentityNumber').value = "A12345678"
  document.getElementById('MemberTelephone').value = "0981783243"
  document.getElementById('MemberAddress').value = "台北市復興南路一段390號2樓"
})


document.getElementById('MemberAccount').addEventListener("input", function(e){

  let theAc = document.getElementById('MemberAccount').value;

  axios({
    url: 'http://localhost:8080/onlinelearning/Membership/checkAC',
    method: 'get',
    params: {
      theWantedAccount: theAc
    }
})
    .then(res => {
        if(res.data==="no"){
          document.getElementById('accountHint').setAttribute("class", "ExampleTemplate2");
          document.getElementById('accountHint').innerHTML = "此帳號已存在！"
          Swal.fire({
            title: '此帳號已存在！',
            showClass: {
              popup: 'animate__animated animate__fadeInDown'
            },
            hideClass: {
              popup: 'animate__animated animate__fadeOutUp'
            }
          })
        } else if (res.data==="yes"){
          document.getElementById('accountHint').setAttribute("class", "ExampleTemplate2");
          document.getElementById('accountHint').innerHTML = "恭喜您，此帳號可以使用！"
        }
    })
    .catch(err => {
        console.log(err)
    })
})


document.onkeydown = function(event) { 
   var target, code, tag; 
   if (!event) { 
    event = window.event; 
    target = event.srcElement; 
    code = event.keyCode; 
    if (code == 13) { 
     tag = target.tagName; 
     if (tag == "TEXTAREA") { return true; } 
     else { return false; } 
    } 
   } 
   else { 
    target = event.target; 
    code = event.keyCode; 
    if (code == 13) { 
     tag = target.tagName; 
     if (tag == "INPUT") { return false; } 
     else { return true; } 
    } 
   } 
  }; 


function show() {

  let accountConfirm = document.getElementById("MemberAccount").value;
  let pwConfirm = document.getElementById("MemberPassword").value;
  let pw2Confirm = document.getElementById("MemberPassword2").value;
  let mailConfirm = document.getElementById("MemberEmail").value;
  let name = document.getElementById("MemberName").value;
  
    if (accountConfirm == "" || pwConfirm == "" || pw2Confirm == "") {
    Swal.fire({
      title: '會員帳號/密碼不可為空！',
      showClass: {
        popup: 'animate__animated animate__fadeInDown'
      },
      hideClass: {
        popup: 'animate__animated animate__fadeOutUp'
      }
    })
    return;
  }
  
    if (accountConfirm.length < 8) {
    Swal.fire({
      title: '帳號至少需要輸入8位英數字！',
      showClass: {
        popup: 'animate__animated animate__fadeInDown'
      },
      hideClass: {
        popup: 'animate__animated animate__fadeOutUp'
      }
    })
    return;
  }

  if (pwConfirm.length < 8 || pw2Confirm.length < 8) {
    Swal.fire({
      title: '密碼必須超過8位英數字！',
      showClass: {
        popup: 'animate__animated animate__fadeInDown'
      },
      hideClass: {
        popup: 'animate__animated animate__fadeOutUp'
      }
    })
    return;
  }

  if (name.length <= 1) {
    Swal.fire({
      title: '請填寫完整姓氏與您的名字，謝謝',
      showClass: {
        popup: 'animate__animated animate__fadeInDown'
      },
      hideClass: {
        popup: 'animate__animated animate__fadeOutUp'
      }
    })
    return;
  }

  if (mailConfirm == "") {
    Swal.fire({
      title: 'Email地址不可為空！',
      showClass: {
        popup: 'animate__animated animate__fadeInDown'
      },
      hideClass: {
        popup: 'animate__animated animate__fadeOutUp'
      }
    })
    return;
  }
  
    if (pwConfirm != pw2Confirm) {
    Swal.fire({
      title: '您輸入的兩次密碼不相同！',
      showClass: {
        popup: 'animate__animated animate__fadeInDown'
      },
      hideClass: {
        popup: 'animate__animated animate__fadeOutUp'
      }
    })
    return;
  }

  var show = $(".dialog").css("display");
  $(".dialog").css("display", show == "none" ? "block" : "none");
  let a = document.getElementById("MemberEmail").value;
  let b = document.getElementById("popWindowEmail");
  b.setAttribute("value", a);
}

function close() {
  var show = $(".dialog").css("display");
  $(".dialog").css("display", show == "none" ? "block" : "none");
}

function go() {
  var here = document.getElementById("hiddenButtSubmit");
  here.click();
}

function sendTheMail() {

  let mailRequest = "http://localhost:8080/onlinelearning/Membership/sendTheMail";
  let theButtonWord = document.getElementById("theMailWords");
  let theButton = document.getElementById("sendItNow");
  let alert = document.getElementById("alert");
  let a = document.getElementById("MemberEmail").value;
  let MemberAccount = document.getElementById("MemberAccount");

  let dtoObject = { "memberAccount": MemberAccount.value, "memberEmail": a };
  const jsonString = JSON.stringify(dtoObject);

  theButtonWord.innerText = "已送出";
  theButton.disabled = true;
  theButton.setAttribute("style", "background-color:#878787;margin-left : 3%;");
  document.getElementById("veriverify").removeAttribute("readonly");
  document.getElementById("veriverify").setAttribute("style", "background-color:white;width: 70px;");

  fetch(mailRequest, {
    method: 'POST',
    body: jsonString,
    headers: { "Content-Type": "application/json" },
  })
    .then(response => {
      return response.text()
    })
    .then(text => {
      alert.innerText = text;
    })
}

var verifyCodeItem = document.getElementById("veriverify");

verifyCodeItem.addEventListener("input", rightVeriCode);

function rightVeriCode() {
  let urlRequest = "http://localhost:8080/onlinelearning/Membership/verifyCode";
  let account = document.getElementById("MemberAccount");
  let alert = document.getElementById("alert");

  let dtoObject = { "memberAccount": account.value, "verifyCode": parseInt(verifyCodeItem.value) };
  const jsonString = JSON.stringify(dtoObject);

  fetch(urlRequest, {
    method: 'POST',
    body: jsonString,
    headers: { "Content-Type": "application/json" },
  })
    .then(response => {
      return response.text()
    })
    .then(text => {
      if (text == "錯誤") {
        alert.innerText = "驗證碼不正確";
      } else if (text == "正確") {
        fetchMebmerID();
        alert.innerText = "謝謝您的填寫，驗證碼正確";
        document.getElementById("MailVerifyStatus").setAttribute("value", "已驗證");
        document.getElementById("passAndNextStep").innerText = "繼續下一步";
        document.getElementById("passAndNextStep").setAttribute("style", "margin-left:20%");
        document.getElementById("turnBackBtn1").remove();
      }
    })
}

function fetchMebmerID() {

  let getID = "http://localhost:8080/onlinelearning/Membership/callAndFindId";

  let account = document.getElementById("MemberAccount");
  let dtoObject = { "memberAccount": account.value };
  const jsonString = JSON.stringify(dtoObject);

  fetch(getID, {
    method: 'POST',
    body: jsonString,
    headers: { "Content-Type": "application/json" },
  })
    .then(response => {
      return response.text()
    })
    .then(text => {
      document.getElementById("MemberId").setAttribute("value", text);
    })
}


window.addEventListener("contextmenu", e => e.preventDefault());

document.oncontextmenu = function () {
  window.event.returnValue = false;
}
