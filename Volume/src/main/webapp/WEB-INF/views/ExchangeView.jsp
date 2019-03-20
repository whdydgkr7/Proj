<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"> 
<link rel="stylesheet" href="./resources/stars/fontawesome-stars.css"> 
<script type="text/javascript" src="./resources/stars/jquery.barrating.min.js"></script>


<style>
html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}

</style>

<script>
function openEx(evt, cityName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("Ex");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" w3-border-red", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.firstElementChild.className += " w3-border-red";
}

$(function() { $('#example').barrating({ 
	theme: 'fontawesome-stars' 
	}); 
}); 


$('#example').barrating({ 
	theme: 'fontawesome-stars' , onSelect: function(value, text, event){ 
		// 별점 클릭 후 처리는 여기서 코드 // 선택한 별점 값을 value로 받음 
		
	} 
	
	});

	
</script>


<body class="w3-theme-l5">

<!-- Navbar -->
<div class="w3-row">
      <img src="./resources/images/10.jpg" alt="" />
</div>
<jsp:include page="/resources/navbar/navbarTop.jsp" />


<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">    
  <!-- The Grid -->
  <div class="w3-row ">
    
    
    <!-- Middle Column -->
    <div class="w3-col m8 w3-center" >
    
      <div class="w3-row-padding">
        <div class="w3-col m12">
          <div class="w3-card w3-round w3-white">
           
          </div>
        </div>
      </div>
      <div class="w3-container">
	      <h2 style="text-align: center;">oneday class</h2>
      </div>
      
      <div class="w3-container w3-card w3-white w3-round w3-margin" style="border: solid white 1px;"><br>
        <h2>${boardInfo.title }</h2><br>
        <hr class="w3-clear">
          <div class="w3-row-padding" style="margin:0 -16px;border: solid white 1px;">
            <div class="w3-half" style="margin-left: 10%; width:700px;">
              <img src="./resources/images/13.jpg" style="width:100%" alt="Northern Lights" class="w3-margin-bottom"><br />
		  
		
		  <div class="w3-row">
		    <a href="javascript:void(0)" onclick="openEx(event, 'view');">
		      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">상세정보</div>
		    </a>
		    <a href="javascript:void(0)" onclick="openEx(event, 'location');">
		      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">위치정보</div>
		    </a>
		    <a href="javascript:void(0)" onclick="openEx(event, 'review');">
		      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">후기</div>
		    </a>
		  </div>
		
		 <div id="view" class="w3-container Ex" style="display:block; height:800px; text-align: left;">
		    <h2>상세정보</h2>
		    <div><h3>클래스명 : ${boardInfo.title }</h3></div>
		    <div class="fa fa-map-marker"><h3>장소 : ${boardInfo.address }</h3></div>
		    <div><h3>참여인원 : 0/${boardInfo.e_limit }</h3></div>
		    <div><h3>클래스 시작시간 : ${boardInfo.start_date }</h3></div>
		    <div><h3>클래스 종료시간 : ${boardInfo.end_date }</h3></div>
		    <div><h3>class 내용 : ${boardInfo.content }</h3></div>
		  </div>
		
		  <div id="location" class="w3-container Ex" style="display:none; height:800px; text-align: left;">
		    <h2>위치정보</h2>
		    <p>Paris is the capital of France.</p> 
		  </div>
		
		  <div id="review" class="w3-container Ex" style="display:none; height:800px; text-align: left;">
		    <h2>후기</h2><br />
		    
		    <p>Class별점</p>
		    <select id="example"> 
			    <option value="1">1</option> 
			    <option value="2">2</option> 
			    <option value="3">3</option> 
			    <option value="4">4</option> 
			    <option value="5">5</option> 
		    </select> 
		    


		    
		    <div class="w3-container w3-content w3-padding-64" style="max-width:800px" id="contact">
		    
		    
		    <div class="w3-row w3-padding-32">
		      
		    
	        
		        <form action="/action_page.php" target="_blank">
		          <div class="w3-row-padding" style="margin:0 -16px 8px -16px">
		            <div class="w3-half">
		              <input class="w3-input w3-border" type="text" placeholder="Name" required name="Name">
		            </div>
		            <div class="w3-half">
		              <input class="w3-input w3-border" type="text" placeholder="Email" required name="Email">
		            </div>
		          </div>
		          <input class="w3-input w3-border" type="text" placeholder="Message" required name="Message">
		          <button class="w3-button w3-black w3-section w3-right" type="submit">SEND</button>
		        </form>
		      
		    </div>
		  </div>
		  </div>
            </div>
         </div>
      </div>
     
      
      <!-- <div class="w3-container"> -->
		<!-- </div> -->
      
    <!-- End Middle Column -->
    </div>
    
    <!--  Right Column -->
    <div class="w3-col m4" style="padding: 80px;">
      <!-- Profile -->
      <div class="w3-card w3-round w3-white">
        <div class="w3-container">
         <h4 class="w3-center">My Profile</h4>
         <p class="w3-center"><img src="./resources/images/img_avatar1.png" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
         <hr>
         <p><i class="fa fa-book fa-fw w3-margin-right w3-text-theme"></i> 수업시간 : ${boardInfo.t_time }</p>
         <p><i class="fa fa-map-marker fa-fw w3-margin-right w3-text-theme"></i> 수업방식 : ${boardInfo.t_method }</p>
         <p><i class="fa fa-heart fa-fw w3-margin-right w3-text-theme"></i> Point : ${boardInfo.t_point }</p>
        </div>
      </div>
      <br>
      
      
    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->
</div>
<br>


<jsp:include page="/resources/navbar/footer.jsp" />
 


</body>
</html> 
