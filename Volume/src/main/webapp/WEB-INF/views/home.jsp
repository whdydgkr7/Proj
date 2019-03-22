<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif}
.w3-bar,h1,button {font-family: "Montserrat", sans-serif}
.fa-anchor,.fa-coffee {font-size:200px}
</style>
<body>
<%if(session.getAttribute("login")!=null){ %>
<div class="text-right" style="padding-top: 30px; padding-right: 30px;">
	<button type="button" class="btn btn-primary">${login.id }(${login.name })</button>&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="button" onclick="location.href='MyPage'" class="btn btn-info">마이페이지</button>&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="button" onclick="location.href='logout'" class="btn btn-danger">로그아웃</button>&nbsp;&nbsp;&nbsp;&nbsp;
	<span id="plusfriend-chat-button" data-plusfriend-id="_kxgxbkj" data-title="consult" data-size="small" data-color="yellow" data-shape="pc" data-support-multiple-densities="true"></span>
</div>
<%} else{%>
<div class="text-right" style="padding-top: 30px; padding-right: 30px;">
	<a href="login"><button type="button" class="btn btn-primary">로그인</button></a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="http://localhost:8080/VolumeAdmin/admin/adminMain.jsp">관리자 페이지</a>
</div>
<%}
if(request.getParameter("logoutMsg")!=null) {%>
<script type="text/javascript">
	alert('로그아웃 되었습니다.');
<%}%>

</script>


<!-- 카카오 플러스친구 -->



<!-- Header -->
<div >
<header class="w3-container w3-lime w3-center" style="padding:120px 16px; height: 390px; background-image: url('./resources/images/8.png'); ">
  <h1 class="w3-margin w3-jumbo" style="font-weight:bold;"> <span class="w3-padding w3-lime w3-opacity-min" style="font-size: 90px;">VolUMe</span></h1>
</div> 
<jsp:include page="/resources/navbar/navbarTop.jsp" />
</header>
<!-- Navbar -->
	

<!-- ---------------------------------------------------------------------------------- -->


<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">

  First Photo Grid
  <div class="w3-row-padding w3-padding-16 w3-center" id="food">
    <div class="w3-quarter">
      <img src="./resources/images/13.jpg" alt="Sandwich" style="width:100%">
      <h3>The Perfect Sandwich, A Real NYC Classic</h3>
      <p>Just some random text, lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
    <div class="w3-quarter">
      <img src="./resources/images/11.jpg" alt="Steak" style="width:100%">
      <h3>Let Me Tell You About This Steak</h3>
      <p>Once again, some random text to lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
    <div class="w3-quarter">
      <img src="./resources/images/12.jpg" alt="Cherries" style="width:100%">
      <h3>Cherries, interrupted</h3>
      <p>Lorem ipsum text praesent tincidunt ipsum lipsum.</p>
      <p>What else?</p>
    </div>
    <div class="w3-quarter">
      <img src="./resources/images/13.jpg" alt="Pasta and Wine" style="width:100%">
      <h3>Once Again, Robust Wine and Vegetable Pasta</h3>
      <p>Lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
  </div>
  
  Second Photo Grid
  <div class="w3-row-padding w3-padding-16 w3-center">
    <div class="w3-quarter">
      <img src="./resources/images/14.jpg" alt="Popsicle" style="width:100%">
      <h3>All I Need Is a Popsicle</h3>
      <p>Lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
    <div class="w3-quarter">
      <img src="./resources/images/15.jpg" alt="Salmon" style="width:100%">
      <h3>Salmon For Your Skin</h3>
      <p>Once again, some random text to lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
    <div class="w3-quarter">
      <img src="./resources/images/16.jpg" alt="Sandwich" style="width:100%">
      <h3>The Perfect Sandwich, A Real Classic</h3>
      <p>Just some random text, lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
    <div class="w3-quarter">
      <img src="./resources/images/17.jpg" alt="Croissant" style="width:100%">
      <h3>Le French</h3>
      <p>Lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
  </div>
 
  <!-- Pagination -->
 <!--  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
      <a href="#" class="w3-bar-item w3-black w3-button">1</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">2</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">3</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">4</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
    </div>
     -->
   </div>   
<jsp:include page="/resources/navbar/footer.jsp" />



<script>
// Used to toggle the menu on small screens when clicking on the menu button
function myFunction() {
  var x = document.getElementById("navDemo");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}
</script>


</body>

<!-- 카카오 플러스친구 1234  -->
<script>
  window.kakaoAsyncInit = function () {
    Kakao.init('b458377709ca26b5cb9a3bc9d36c1860');
    Kakao.PlusFriend.createChatButton({
      container: '#plusfriend-chat-button'
    });
  };

  (function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//developers.kakao.com/sdk/js/kakao.plusfriend.min.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'kakao-js-sdk'));
</script>
</html>
