		var inputFile = document.getElementById('customFileInput');

		inputFile.addEventListener('change', function(e) {

			var fileData = e.target.files[0];
			var fileName = fileData.name;
			var fileType = fileData.type;
			var fileSize = Math.floor(fileData.size * 0.001);
			var fileTime = fileData.lastModifiedDate;

			console.log(fileData);
			document.getElementById('file_thumbnail').src = URL
					.createObjectURL(fileData);
			document.getElementById('chooseAgain').textContent = "重新上傳";

		}, false);