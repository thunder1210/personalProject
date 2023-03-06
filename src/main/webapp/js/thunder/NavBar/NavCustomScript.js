  $(function(){
			var $marqueeUl = $('div#abgne_marquee ul'),
				$marqueeli = $marqueeUl.append($marqueeUl.html()).children(),
				_height = $('div#abgne_marquee').height() * -1,
				scrollSpeed = 600,
				timer,
				speed = 3000 + scrollSpeed;
			$marqueeUl.css('top', $marqueeli.length / 2 * _height);
			$marqueeli.hover(function(){
				clearTimeout(timer);
			}, function(){
				timer = setTimeout(showad, speed);
			});
		 
			function showad(){
				var _now = $marqueeUl.position().top / _height;
				_now = (_now - 1 + $marqueeli.length) % $marqueeli.length;
				$marqueeUl.animate({
					top: _now * _height
				}, scrollSpeed, function(){
					if(_now == 0){
						$marqueeUl.css('top', $marqueeli.length / 2 * _height);
					}
				});
				timer = setTimeout(showad, speed);
			}
			timer = setTimeout(showad, speed);
		 
			$('a').focus(function(){
				this.blur();
			});
		});    
	  function openSearch() {
		  document.getElementById("myOverlay").style.display = "block";
		  console.log(232323)
		}
		function closeSearch() {
		  document.getElementById("myOverlay").style.display = "none";
		} 
	  
		function logout(){
			let getID = "http://localhost:8080/onlinelearning/Membership/logout";
			fetch(getID, {
			method: 'POST',
			})
			.then(response => {
				window.location.href= "http://localhost:8080/onlinelearning/";
				})
			}
