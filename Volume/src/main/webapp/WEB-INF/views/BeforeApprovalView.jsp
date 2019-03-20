<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>ProjectBbsViewtle</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"> 
<link rel="stylesheet" href="./resources/stars/fontawesome-stars.css"> 
<script type="text/javascript" src="./resources/stars/jquery.barrating.min.js"></script>

<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}

 html,body{
background-color:#F2F3F2;
 }
 
 button{
  background:#CDDB39;
  color:black;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}

 html,body{
background-color:#F2F3F2;
 }
</style>
<body>

<div class="container">
<div class="w3-row">
      <img src="./resources/images/10.jpg" alt="" />
</div>
<jsp:include page="/resources/navbar/navbarTop.jsp" />



<body class="w3-theme-l5">



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
          <div><h3>장소 : ${boardInfo.address }</h3></div>
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
    

    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->
</div>
<br>

			
			
			<div id="map" style="width:1000px;height:500px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70a54cc4cc1852fb30a4ac2b3cd30ac3&libraries=services"></script>
			
			
				
			<div class="w3-container" style="text-align: center;">

			 	 <p id="Cmyp">마음에 드신다면 추천하기를 클릭해주세요</p>
			 	<button type="button" style="height: 50px; width: 200px; border-radius: 15px;"  onclick="move();" >
					<i class="glyphicon glyphicon-pencil" style="font-size: 25px; font-weight: bold;">추천하기</i>
				</button>			
			</div>
	  
<script>


var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
var addstr = "";
var addstr = "";
// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${dto.f}', function(result, status) {

   
   
   
    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">경기장 위치</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
    
});    

function move() {
  var elem = document.getElementById("myBar");   
  document.getElementById("Cmyp").className = "w3-text-green w3-animate-opacity";
  document.getElementById("Cmyp").innerHTML = "추천되었습니다.!";
	alert("추천하기가 완료되었습니다.")

    clearInterval(id);


}
</script>




<jsp:include page="/resources/navbar/footer.jsp" />

</div>
</body>
</html>