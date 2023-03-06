var checkEye = document.getElementById("checkEye");
var floatingPassword = document.getElementById("floatingPassword");
checkEye.addEventListener("click", function (e) {
	if (e.target.classList.contains("fa-eye")) {
		e.target.classList.remove("fa-eye");
		e.target.classList.add("fa-eye-slash");
		floatingPassword.setAttribute("type", "text");
	} else {
		floatingPassword.setAttribute("type", "password");
		e.target.classList.remove("fa-eye-slash");
		e.target.classList.add("fa-eye");
	}
});

var keyStr = "ABCDEFGHIJKLMNOP" + "QRSTUVWXYZabcdef" + "ghijklmnopqrstuv" + "wxyz0123456789+/" + "=";

function encode64(input) {

	var output = "";
	var chr1, chr2, chr3 = "";
	var enc1, enc2, enc3, enc4 = "";
	var i = 0;
	do {
		chr1 = input.charCodeAt(i++);
		chr2 = input.charCodeAt(i++);
		chr3 = input.charCodeAt(i++);
		enc1 = chr1 >> 2;
		enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
		enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
		enc4 = chr3 & 63;
		if (isNaN(chr2)) {
			enc3 = enc4 = 64;
		} else if (isNaN(chr3)) {
			enc4 = 64;
		}
		output = output +
			keyStr.charAt(enc1) +
			keyStr.charAt(enc2) +
			keyStr.charAt(enc3) +
			keyStr.charAt(enc4);
		chr1 = chr2 = chr3 = "";
		enc1 = enc2 = enc3 = enc4 = "";
	} while (i < input.length);

	return output;

}

const sendSendOut = document.getElementById('theShowingLoginBtn');

sendSendOut.addEventListener('click', function (e) {
	e.preventDefault();
	var theAccount = document.getElementById('TypeAccount');
	var thePassword = document.getElementById('floatingPassword');
	theAccount.value = encode64(theAccount.value);
	thePassword.value = encode64(thePassword.value);
	theAccount.setAttribute("type", "password")
	thePassword.setAttribute("type", "password")
	var sender = document.getElementById('hiddenBtn');
	sender.click();
})

window.addEventListener("contextmenu", e => e.preventDefault());

document.oncontextmenu = function () {
	window.event.returnValue = false;
}


 		var channel_id = "1657803555";
      var channel_secret = "68eda045f1fe1565465f6ca821e93e7a";
      var uri = "http://localhost:8080/onlinelearning/Membership/login";

      $("#lineLoginBtn").on("dblclick", function (e) {
        let client_id = channel_id;
        let redirect_uri = uri;
        let link = "https://access.line.me/oauth2/v2.1/authorize?";
        link += "response_type=code";
        link += "&client_id=" + client_id;
        link += "&redirect_uri=" + redirect_uri;
        link += "&state=login";
        link += "&scope=openid%20profile%20email";
        window.location.href = link;
      });

      var url = new URL(window.location.href);
      var code = url.searchParams.get("code");

      var result = $(".result");
      var id_token = "";
      $.ajax({
        method: "POST",
        dataType: "json",
        url: "https://api.line.me/oauth2/v2.1/token",
        async: false,
        data: {
          grant_type: "authorization_code",
          code: code,
          redirect_uri: uri,
          client_id: channel_id,
          client_secret: channel_secret,
        },
        success: function (data) {
          id_token = data.id_token;
        },
      });

      var end="";
      	
      $.ajax({
        method: "POST",
        dataType: "json",
        url: "https://api.line.me/oauth2/v2.1/verify",
        async: false,
        data: { client_id: channel_id, id_token: id_token },
        success: function (data) {
        	console.log(data)
        	var name = data.name;
        	var picture = data.picture;
        	var email = data.email;
        	var sub = data.sub;
        	if(data){
        		window.location.href = "http://localhost:8080/onlinelearning/Membership/greenLogin?name="+name+"&photo="+picture+"&email="+email+"&sub="+sub;
        	}
        },
      });

document.onkeydown = function(event) { 
   var target, code, tag; 
   if (!event) { 
    event = window.event; //針對ie瀏覽器 
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

  function sendOutResetPassword(){
    let theMail = document.getElementById('subscribe_pemail').value;
    let theAccount = document.getElementById('subscribe_account').value;
    if(theMail=="" || theAccount=="" || !theMail.includes("@") || theMail.length<9 || theAccount.length<6){
      document.getElementById('sendOutFeedback').textContent = "請填寫完整資料再提交，謝謝！";
      return;
    }
    let url = 'http://localhost:8080/onlinelearning/Membership/resetPassword?mail=' + theMail + '&account=' + theAccount;
    axios.post(url)
      .then(res => {
        document.getElementById('sendOutFeedback').textContent = res.data;
        let btn = document.getElementById('resetBtn')
        btn.remove();
  }).catch(err => {
		console.log(err);
	})

}

$('body').loading({
  stoppable: true
});
  