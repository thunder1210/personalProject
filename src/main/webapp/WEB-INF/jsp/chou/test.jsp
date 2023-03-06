<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 隱藏所有tab內容 */
.tabcontent {
  display: none;
}

/* 樣式化tab頁籤按鈕 */
.tab button {
  background-color: #ccc;
  color: black;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 10px 20px;
  transition: 0.3s;
  font-size: 16px;
}

/* 樣式化被選中的tab頁籤按鈕 */
.tab button.active {
  background-color: #ddd;
}

/* 樣式化tab內容區域 */
.tabcontent {
  padding: 20px;
  border: 1px solid #ccc;
}
</style>
</head>
<body>
<div class="tab">
  <button class="tablinks" onclick="openTab(event, 'tab1')">Tab 1</button>
  <button class="tablinks" onclick="openTab(event, 'tab2')">Tab 2</button>
  <button class="tablinks" onclick="openTab(event, 'tab3')">Tab 3</button>
</div>

<div id="tab1" class="tabcontent">
  <h3>Tab 1</h3>
  <p>內容 1</p>
</div>

<div id="tab2" class="tabcontent">
  <h3>Tab 2</h3>
  <p>內容 2</p>
</div>

<div id="tab3" class="tabcontent">
  <h3>Tab 3</h3>
  <p>內容 3</p>
</div>
<script type="text/javascript">
function openTab(event, tabName) {
	  var i, tabcontent, tablinks;
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }
	  tablinks = document.getElementsByClassName("tablinks");
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].className = tablinks[i].className.replace(" active", "");
	  }
	  document.getElementById(tabName).style.display = "block";
	  event.currentTarget.className += " active";
	}

</script>
</body>
</html>