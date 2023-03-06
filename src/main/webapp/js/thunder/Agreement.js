var checkresult = 0;

$("#agreeCheck").change(function () {
    var item = $(this).is(':checked');

    if (checkresult == 0) {
        checkresult = 1;
    } else if (checkresult == 1) {
        checkresult = 0;
    }
});

$("#sendNextStep").click(function () {
    if (checkresult == 0) {
        Swal.fire({
            title: '註冊前必須同意本站的會員條款！',
            showClass: {
                popup: 'animate__animated animate__fadeInDown'
            },
            hideClass: {
                popup: 'animate__animated animate__fadeOutUp'
            }
        })
        return;
    }
    window.location.href = 'http://localhost:8080/onlinelearning/Membership/register'
})


  document.oncontextmenu = function(){
  window.event.returnValue=false; 
}

document.body.oncopy = function(){
  event.returnValue=false;
}
