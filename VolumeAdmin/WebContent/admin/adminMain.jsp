<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en">
<title>관리자 페이지</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
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
  <div class="w3-bar-block">
    <!-- <a href="#" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">회원 관리</a>  -->
    <a href="#uManagement" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">회원 관리</a> 
    <a href="#projectManagement" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">프로젝트 관리</a> 
    <a href="#eManagement" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">원데이 클래스 관리</a> 
	<a href="#admin" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">관리자 계정 설정</a> 
    <!-- <a href="#contact" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Contact</a> -->
  </div>
</nav>

<!-- Top menu on small screens -->
<header class="w3-container w3-top w3-hide-large w3-red w3-xlarge w3-padding">
  <a href="javascript:void(0)" class="w3-button w3-red w3-margin-right" onclick="w3_open()">☰</a>
  <span>Volume 관리자 페이지</span>
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:340px;margin-right:40px">

  <!-- Header -->
  <div class="w3-container" style="margin-top:80px;" id="uManagement">
    <!-- <h1 class="w3-jumbo"><b>회원 관리</b></h1> -->
    <h1 class="w3-xxxlarge w3-text-red"><b>회원 관리</b></h1>
    <hr style="width:50px;border:5px solid red" class="w3-round">
    <jsp:include page="UserMain.jsp"></jsp:include>
  </div>
  
  <br /><br /><br /><br /><br /><br /><br /><br />
  
  <!-- projectManagement -->
  <div class="w3-container" id="projectManagement" style="margin-top:75px">
    <h1 class="w3-xxxlarge w3-text-red"><b>프로젝트 제안하기 관리</b></h1>
    <hr style="width:50px;border:5px solid red" class="w3-round">
    <jsp:include page="ProposeMain.jsp"></jsp:include>
    
  </div>
  
  <br /><br /><br /><br /><br /><br /><br /><br />
  
  <!-- eManagement -->
  <div class="w3-container" id="eManagement" style="margin-top:75px">
    <h1 class="w3-xxxlarge w3-text-red"><b>원데이 클래스 관리</b></h1>
    <hr style="width:50px;border:5px solid red" class="w3-round">
    <jsp:include page="OnedayMain.jsp"></jsp:include>
    
  </div>

  <br /><br /><br /><br /><br /><br /><br /><br />  

	<!-- eManagement -->
  <div class="w3-container" id="admin" style="margin-top:75px">
    <h1 class="w3-xxxlarge w3-text-red"><b>관리자 계정 설정</b></h1>
    <hr style="width:50px;border:5px solid red" class="w3-round">
    <jsp:include page="adminSetUp.jsp"></jsp:include>
    
  </div>

  <br /><br /><br /><br /><br /><br /><br /><br />  
  <!-- Packages / Pricing Tables -->
  <!-- <div class="w3-container" id="packages" style="margin-top:75px">
    <h1 class="w3-xxxlarge w3-text-red"><b>Packages.</b></h1>
    <hr style="width:50px;border:5px solid red" class="w3-round">
    <p>Some text our prices. Lorem ipsum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>
  </div>

  <div class="w3-row-padding">
    <div class="w3-half w3-margin-bottom">
      <ul class="w3-ul w3-light-grey w3-center">
        <li class="w3-dark-grey w3-xlarge w3-padding-32">Basic</li>
        <li class="w3-padding-16">Floorplanning</li>
        <li class="w3-padding-16">10 hours support</li>
        <li class="w3-padding-16">Photography</li>
        <li class="w3-padding-16">20% furniture discount</li>
        <li class="w3-padding-16">Good deals</li>
        <li class="w3-padding-16">
          <h2>$ 199</h2>
          <span class="w3-opacity">per room</span>
        </li>
        <li class="w3-light-grey w3-padding-24">
          <button class="w3-button w3-white w3-padding-large w3-hover-black">Sign Up</button>
        </li>
      </ul>
    </div>
        
    <div class="w3-half">
      <ul class="w3-ul w3-light-grey w3-center">
        <li class="w3-red w3-xlarge w3-padding-32">Pro</li>
        <li class="w3-padding-16">Floorplanning</li>
        <li class="w3-padding-16">50 hours support</li>
        <li class="w3-padding-16">Photography</li>
        <li class="w3-padding-16">50% furniture discount</li>
        <li class="w3-padding-16">GREAT deals</li>
        <li class="w3-padding-16">
          <h2>$ 249</h2>
          <span class="w3-opacity">per room</span>
        </li>
        <li class="w3-light-grey w3-padding-24">
          <button class="w3-button w3-red w3-padding-large w3-hover-black">Sign Up</button>
        </li>
      </ul>
    </div>
  </div>
  
  Contact
  <div class="w3-container" id="contact" style="margin-top:75px">
    <h1 class="w3-xxxlarge w3-text-red"><b>Contact.</b></h1>
    <hr style="width:50px;border:5px solid red" class="w3-round">
    <p>Do you want us to style your home? Fill out the form and fill me in with the details :) We love meeting new people!</p>
    <form action="/action_page.php" target="_blank">
      <div class="w3-section">
        <label>Name</label>
        <input class="w3-input w3-border" type="text" name="Name" required>
      </div>
      <div class="w3-section">
        <label>Email</label>
        <input class="w3-input w3-border" type="text" name="Email" required>
      </div>
      <div class="w3-section">
        <label>Message</label>
        <input class="w3-input w3-border" type="text" name="Message" required>
      </div>
      <button type="submit" class="w3-button w3-block w3-padding-large w3-red w3-margin-bottom">Send Message</button>
    </form>  
  </div> -->

<!-- End page content -->
</div>

<!-- W3.CSS Container -->
<div class="w3-light-grey w3-container w3-padding-32" style="margin-top:75px;padding-right:58px"><p class="w3-right">관리자 페이지 <a href="home" title="W3.CSS" target="_blank" class="w3-hover-opacity">Volume</a></p></div>

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
