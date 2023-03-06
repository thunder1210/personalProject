	function logout(){
		let getID = "http://localhost:8080/onlinelearning/Membership/logout";
		fetch(getID, {
		method: 'POST',
		})
		.then(response => {
			return response.text();
			})
			.then(text =>{
				var memberinfo = document.getElementById("memberInfo");
				var hidden = document.getElementById("theHiddenLogin");
				hidden.setAttribute("class", "loginbutt");
				memberinfo.remove();
				})
		}

/*==========================================*/
var swiper = new Swiper(".slide-content", {
    slidesPerView: 3,
    spaceBetween: 25,
    loop: true,
    centerSlide: 'true',
    fade: 'true',
    grabCursor: 'true',
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
      dynamicBullets: true,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },

    breakpoints:{
        0: {
            slidesPerView: 1,
        },
        520: {
            slidesPerView: 2,
        },
        950: {
            slidesPerView: 3,
        },
    },
  });
  
  document.oncontextmenu = function(){
  window.event.returnValue=false; 
}

  $.fn.autotype = function() {
    var $text = $(this);
    console.log('$text:', $text);
    var str = $text.html(); 
    var index = 0;
    var x = $text.html('');
    var timer = setInterval(function() {
        var current = str.substr(index, 1);
        if (current == '<') {
            index = str.indexOf('>', index) + 1;
        } else {
            index++;
        }
        $text.html(str.substring(0, index) + (index & 1 ? '_' : ''));
        index > $text.html().length + 10 && (index = 0);
    }, 100);
};

