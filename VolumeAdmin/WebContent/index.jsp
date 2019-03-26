<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<title>관리자 페이지</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1}
</style>
<body>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-red w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
  <div class="w3-container">
    <h3 class="w3-padding-64"><b>Volume<br>관리자 페이지</b></h3>
  </div>
</nav>

<!-- Top menu on small screens -->
<header class="w3-container w3-top w3-hide-large w3-red w3-xlarge w3-padding">
  <a href="javascript:void(0)" class="w3-button w3-red w3-margin-right" onclick="w3_open()">☰</a>
  <span>Volume 관리자 페이지</span>
</header>
<script type="text/javascript">
window.onload= function() {
	if('${authority}'=="ADMIN")
		location.href='./admin/UserMain.jsp';
	if('${param.msg}'){
		alert("아이디 또는 비밀번호를 확인 해 주세요.");
		adminFrm.id.focus();
	}
}

function inputValidate(f) {
	if (!f.id.value) {
		alert("관리자 아이디 입력을 확인 해 주세요.");
		f.id.focus();
		return false;
	}
	if(!f.pass.value){
		alert("관리자 비밀번호 입력을 확인 해 주세요.");
		f.pass.focus();
		return false;
	}
}
</script>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:340px;margin-right:40px">
  <div class="w3-container" style="margin-top:80px;">
    <h1 class="w3-xxxlarge w3-text-red"><b>관리자 로그인</b></h1>
    <hr style="width:50px;border:5px solid red" class="w3-round">
   	<div class="w3-panel w3-pale-red w3-leftbar w3-border-red">
	  <p>Volume의 관리자 페이지 입니다. <br />관리자 로그인 후 이용 해 주세요.</p>
	</div>
	<br />
	<div class="w3-row">
	  <div class="w3-col s4 w3-center"><p></div>
	  <div class="w3-col s4 w3-center">
	  	<form action="Login.do" method="post" id="adminFrm" onsubmit="return inputValidate(this);" class="w3-container w3-card-4 w3-light-grey w3-text-red w3-margin" style="width: 80%;">
		<div class="w3-row w3-section">
		  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
		    <div class="w3-rest">
		      <input class="w3-input w3-border" name="id" type="text" placeholder="관리자 아이디">
		    </div>
		</div>
		<div class="w3-row w3-section">
		  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-lock"></i></div>
		    <div class="w3-rest">
		      <input class="w3-input w3-border" name="pass" type="password" placeholder="관리자 비밀번호">
		    </div>
		</div>
		<button class="w3-button w3-block w3-section w3-red w3-ripple w3-padding" type="submit">로그인</button>
		</form>
	  </div>
	  <div class="w3-col s4 w3-center"><p></p></div>
	</div>	
	
	
  </div>
</div>


<!-- W3.CSS Container -->
<div class="w3-light-grey w3-container w3-padding-32 w3-bottom" style="margin-top:75px;padding-right:58px"><p class="w3-right">관리자 페이지 <a href="home" title="W3.CSS" target="_blank" class="w3-hover-opacity">Volume</a></p></div>

<script>
// Script to open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}

// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}
</script>

</body>
</html>
