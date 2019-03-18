<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
</style>

<meta charset="UTF-8">
<title>BoardViewSkin.jsp</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="w3-light-grey">
		<!-- Top영역(GNB영역 : Global Navigation Bar) -->
		<jsp:include page="/resources/navbar/navbarTop.jsp"></jsp:include>
		<!-- Top영역(GNB영역 : Global Navigation Bar) -->		
<div class="container" style=" margin-left: 400px; width: 1500px;">	
	<div class="row">
		<div class="col-xs-9 col-lg-9">
			<!-- Contents부분 -->
			
			<form enctype="multipart/form-data">

	<!-- w3-content defines a container for fixed size centered content, 
	and is wrapped around the whole page content, except for the footer in this example -->
	<div class="w3-content" style="max-width:1400px;">
	
	<!-- Header -->
		<header class="w3-container w3-center w3-padding-32"> 
		  <h1><b>원데이클래스</b></h1>
		  
		</header>
		
		<!-- Grid -->
		<div class="w3-row">
		
		<!-- Blog entries -->
		<div class="w3-col l8 s12">
		  <!-- Blog entry -->
		  <div class="w3-card-4 w3-margin w3-white">
		    <img src="./resources/images/12.jpg" alt="Nature" style="width:100%">
		    <div class="w3-container">
		      <h3><b>TITLE HEADING</b></h3>
		      <h5>Title description, <span class="w3-opacity">April 7, 2014</span></h5>
		    </div>
		    
		    <ul class="nav nav-tabs">
			  <li class="active"><a data-toggle="tab" href="#home">상세보기</a></li>
			  <li><a data-toggle="tab" href="#menu1">위치정보</a></li>
			  <li><a data-toggle="tab" href="#menu2">후기</a></li>
			</ul>
			
			<div class="tab-content">
			  <div id="home" class="tab-pane fade in active">
			    <h3>상세정보</h3>
			    <p>${boardInfo.content}</p>
			  </div>
			  <div id="menu1" class="tab-pane fade">
			    <h3>위치정보</h3>
			    <p>Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.
			    Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.
			    Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.
			    Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.Some content in menu 1.
			    </p>
			  </div>
			  <div id="menu2" class="tab-pane fade">
			    <h3>후기</h3>
			    <p>Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.
			    Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu Some content in menu 2.
			    Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.
			    Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.
			    Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.Some content in menu 2.
			    </p>
			  </div>
			</div>

   
  </div>
  <hr>


    
	
		
<!-- END BLOG ENTRIES -->
</div>

<!-- Introduction menu -->
	<div class="w3-col l4" >
	  <!-- About Card -->
	  <div class="w3-card w3-margin w3-margin-top" style="margin-left: 10px;">
	  <div class="w3-card w3-round w3-white">
	        <div class="w3-container">
		         <h4 class="w3-center">My Profile</h4>
		         <p class="w3-center"><img src="./resources/images/img_avatar1.png" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
		         <hr>
		         <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> 수업시간 : ${boardInfo.t_time }</p><br />
		         <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i> 참여가능인원 : ${boardInfo.e_limit }</p><br />
		         <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i> point : ${boardInfo.t_point }</p><br />
		         
		         <button type="button" class="btn btn-success"onclick="location.href='password.do?idx=${viewRow.idx}&mode=delete&nowPage=${nowPage }';">참여하기</button>
		   </div>
	   </div>
	  </div><hr>
	  
	
	  
	  
	<!-- END Introduction Menu -->
	</div>

	<!-- END GRID -->
	</div><br>

	<!-- END w3-content -->
	</div>

<!-- Footer -->
<!-- <footer class="w3-container w3-dark-grey w3-padding-32 w3-margin-top">
  <button class="w3-button w3-black w3-disabled w3-padding-large w3-margin-bottom">Previous</button>
  <button class="w3-button w3-black w3-padding-large w3-margin-bottom">Next »</button>
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
</footer> -->



</form> 
			<!-- Contents부분 -->
		</div>
	</div>
	<div class="row">
		<!-- Bottom영역(Copyright정보) -->
		<%-- <jsp:include page="/resources/BoardSkin/commonBottom.jsp"></jsp:include> --%>
		<!-- Bottom영역(Copyright정보) -->
	</div>
</div>
</body>

</html>