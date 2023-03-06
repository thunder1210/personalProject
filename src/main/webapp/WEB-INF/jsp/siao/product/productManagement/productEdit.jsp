<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<link href="${contextRoot}/css/siao/bootstrap.min.css" rel="stylesheet" />
<title>修改商品內容</title>
</head>

<body>
	<div class="container">


		<form:form action="${contextRoot}/products/putedit"
			modelAttribute="product" method="put" class="row g-3" enctype="multipart/form-data">
			
			<form:input type="hidden" path="productId" class="form-control"></form:input>


			<div class="col-md-12">
				<label class="form-label">商品名稱: </label>
				<form:input path="productName" class="form-control"></form:input>
			</div>
			<div class="col-md-6">
				<label class="form-label">商品價錢: </label>
				<form:input path="productPrice" class="form-control"></form:input>
			</div>
			<div class="col-md-6">
				<label for="validationCustom01" class="form-label">商品數量: </label>
				<form:input path="productAmount" class="form-control"></form:input>
			</div>

			<label class="form-label">商品種類: </label>
			<div class="flex">
			
				<form:input type="hidden" path="productType" class="form-control"
					id="type" value="${product.productType}"></form:input>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="Type"
						id="typeBook" value="1"> <label class="form-check-label"
						for="flexRadioDefault1"> 書籍 </label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="Type"
						id="typeMedia" value="2"> <label class="form-check-label"
						for="flexRadioDefault2"> 影音 </label>
				</div>
			</div>

			<div class="col-md-4">
				<label for="validationCustom01" class="form-label">作者: </label>
				<form:input path="productCreater" class="form-control"></form:input>
			</div>
			<div class="col-md-4">
				<label for="validationCustom01" class="form-label">出版社: </label>
				<form:input path="productPublisher" class="form-control"></form:input>
			</div>
			<div class="col-md-4">
				<label for="validationCustom01" class="form-label">製造日期: </label>
				<form:input path="productDate" class="form-control"></form:input>
			</div>

			<br> 商品圖片:
							<br>
							上傳檔案:

							<div>
				<!-- 			還是一樣先抓photo並顯示 上傳時先用原來的上傳 丟到controller -->
				<!-- 			另開一input 並設定名字，在controller 做判斷 若有輸入則取代 -->

				<form:input path="productPhoto" type="text"
					style="visibility: hidden;" value="${product.productPhoto}" />


				<img id="origin" style="width: 180px;" src="${product.productPhoto}">


				<img id="output" width="200" /> <input type="file" name="photoFile"
					id="photoFileInput" accept="image/*" 
					onchange="loadFile(event)">
			</div>
			
			<label class="form-label">上架: </label>
			
			<div class="flex">
			
				<form:input type="hidden" path="onSelve" class="form-control"
					id="inputselve" value="${product.onSelve}"></form:input>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="selve"
						id="onSelve" value="1"> <label class="form-check-label"
						for="flexRadioDefault1"> 上架 </label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="selve"
						id="offSelve" value="0"> <label class="form-check-label"
						for="flexRadioDefault2">下架</label>
				</div>
			</div>


			<button type="submit" class="btn btn-primary" id="change">修改</button>
		</form:form>
	</div>
	<script type="text/javascript">
		const type = document.getElementById('type');
		const typeBook = document.getElementById('typeBook');
		const typeMedia = document.getElementById('typeMedia');
		const inselve = document.getElementById('inputselve');
		const onSelve = document.getElementById('onSelve');
		const offSelve = document.getElementById('offSelve');
		window.onload = function productTypeConfirm() {
			if (type.value == 1) {
				typeBook.checked = true;
			} else {
				typeMedia.checked = true;
			}
			
			if (inselve.value == 1) {
				onSelve.checked = true;
			} else {
				offSelve.checked = true;
			}
		}
		const button = document.getElementById('change');
		button.addEventListener('click', returnTypeByInt)

		function returnTypeByInt() {
			if (typeBook.checked) {
				type.value = 1;
			} else {
				type.value = 2;
			}
			if (onSelve.checked) {
				inselve.value = 1;
			} else {
				inselve.value = 0;
			}
		}

		function loadFile(event) {
			var image = document.getElementById('output');
			image.src = URL.createObjectURL(event.target.files[0]);
			var originimage = document.getElementById("origin");
			originimage.style.display = "none";
		};
	</script>

</body>

</html>