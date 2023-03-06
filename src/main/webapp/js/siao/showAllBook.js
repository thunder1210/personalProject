// const slideShow = document.getElementById('carouselExampleIndicators');
// const showAllBookBtn = document.getElementById('ShowAllBookBtn');
// const showAllBookArea = document.getElementById('showBookProductArea');
// const showSomeBookArea = document.getElementById('showSomeBookArea');
// const jumspPage = document.getElementById('jumpPage');
// const mainpage = document.getElementById('productMainPage');

mainpage.addEventListener('click',function(){
	slideShow.style.display = "block";
	showAllBookArea.style.display="none";

})

showAllBookBtn.addEventListener('click', function () {
	slideShow.style.display = "none";
	showAllBookArea.style.display="block";
	loadThatPage(1);
})

function loadThatPage(pageNumber){
    
	axios({
	 url:'http://localhost:8080/onlinelearning/productsFront/page',
	 method:'post',
	 params:{
		 p: pageNumber
	 }
	})
	.then(res =>{
	  console.log(res.data)
	  bookCardDisplay(res.data)
	  console.log(res.data.content)
	//   htmlMaker(res.data)
	})
	.catch(err =>{
	 console.log(err)
	})
 }


function bookCardDisplay(data){

	console.log("我現在的頁數: " + data.number)
	let nowpage=data.number+1;

	showSomeBookArea.innerHTML=""
	data.content.forEach( book=> {
		if(book.onSelve==1){
		book_data="";
		book_data=` <div class="col-1"><div class="card" style="width: 10rem;" id="${book.productId}">`
		book_data +=`<a href="http://localhost:8080/onlinelearning/productFront/selectedProduct?id=`+`${book.productId}`+`"><img src="${book.productPhoto}" class="card-img-top" style="height: 10rem;"></a>`
		book_data +=`<div class="card-body">`
		book_data +=`<a href="#" style="text-decoration: none; !important"><h5 class="card-title" >${book.productName}</h5></a>`
		book_data +=`<p>作者: ${book.productCreater}</p><p>售價: ${book.productPrice}</p></div>`
		book_data +=`</div></div> `
		showSomeBookArea.innerHTML+=book_data;
		}

		
	});	

	let msg_data="";
	 msg_data = ` <ul class="pagination pagination-sm">`;
	for(let i = 1; i <= data.totalPages; i++){
		if(i == nowpage){
			msg_data += `<li class="page-item active" aria-current="page">
			<span class="page-link">`+ i +`</span></li>`
		}else{		
			msg_data  += '<li class="page-item "><button class="pageBtn page-link" data-page="'+ i +'">' + i + '</button></li>'
		}

	  }
	  msg_data+=`</ul>`;
	  jumspPage.innerHTML = msg_data;


	  const buttonsArray = document.getElementsByClassName('pageBtn');

	  for(i=0; i<=buttonsArray.length; i++){
		buttonsArray[i].addEventListener('click',function(e){
			var pageNumber = this.getAttribute('data-page');
			// console.log('up',pageNumber)
			loadThatPage(pageNumber)
		})
			
	   }
}

