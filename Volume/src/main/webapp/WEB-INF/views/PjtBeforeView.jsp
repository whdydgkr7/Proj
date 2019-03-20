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


<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}

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




  <!-- Header -->
  <header class="w3-container w3-text-lime " style="padding-top:22px;font-weight: bold; font-size:20px; ">
    <h5><b><i class="fa fa-dashboard"></i> 상세보기</b></h5>
  </header>

  <div class="w3-row-padding w3-margin-bottom">
    <div class="w3-quarter">
      <div class="w3-container w3-red w3-padding-16">
        <div class="w3-left"><i class="fa fa-comment w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3>52</h3>
        </div>
        <div class="w3-clear"></div>
        <h4>댓글수</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-blue w3-padding-16">
        <div class="w3-left"><i class="fa fa-eye w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3>99</h3>
        </div>
        <div class="w3-clear"></div>
        <h4>조회수</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-teal w3-padding-16">
        <div class="w3-left"><i class="fa fa-share-alt w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3>23</h3>
        </div>
        <div class="w3-clear"></div>
        <h4>후기</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-orange w3-text-white w3-padding-16">
        <div class="w3-left"><i class="fa fa-users w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3>50</h3>
        </div>
        <div class="w3-clear"></div>
        <h4>참여자수</h4>
      </div>
    </div>
  </div>

  <div class="w3-panel">
    <div class="w3-row-padding" style="margin:0 -16px">
      <div class="w3-twothird">
            <h5 class="w3-text-black">프로젝트 상세보기</h5>
   
      </div>
    </div>
       <table>
          <tr>
             <td>      
             이미지:
             </td>
          </tr>   
          <tr>
             <td>
             프로젝트이름:
             </td>
          </tr>             
          <tr>
             <td>
             프로젝트 기간:
             </td>
          </tr>      
          <tr>
          <td>
             프로젝트 설명:
          </td>
          </tr>   
          <tr>
          <td>
             프로젝트 참여인원:
          </td>
          </tr>                       
       </table>
    
    <hr>
  </div>
  
 
			<div id="map" style="width:100%;height:350px;"></div>

			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70a54cc4cc1852fb30a4ac2b3cd30ac3&libraries=services"></script>
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
			</script>
			<div class="w3-container">
			  <h2 style="font-weight: bold;'">프로젝트 참가인원</h2>
			
			  <div class="w3-light-grey">
			    <div id="myBar" class="w3-container w3-green"  style="height:24px;width:0%">
			    </div>
			  </div>
			
			  <p id="myP">현재 인원 <span id="demo">0</span> /  총 100 명</p>
			  <p id="Cmyp">참가하기를 클릭해주세요</p>
			  
			
			  <button class="w3-button w3-lime" onclick="move();">참가하기</button> 
			</div>
			  <hr>
<script>
function move() {
  var elem = document.getElementById("myBar");   
  var width=0;
  width = parseInt(elem.style.width);
  
  if (width >= 100) {
    clearInterval(id);

  } else {
    width+=1; 
    elem.style.width = width + '%'; 
    var num = parseInt(elem.style.width);
    num = num.toFixed(0)
    document.getElementById("demo").innerHTML = num;
    document.getElementById("Cmyp").className = "w3-text-green w3-animate-opacity";
    document.getElementById("Cmyp").innerHTML = "참가 신청되었습니다.!";
	alert("참가신청이 완료되었습니다.")

	
	
  }
}
</script>


  <div class="w3-container">
    <h5>Recent Comments</h5>
    <div class="w3-row">
      <div class="w3-col m2 text-center">
        <img class="w3-circle" src="/w3images/avatar3.png" style="width:96px;height:96px">
      </div>
      <div class="w3-col m10 w3-container">
        <h4>John <span class="w3-opacity w3-medium">Sep 29, 2014, 9:12 PM</span></h4>
        <p>Keep up the GREAT work! I am cheering for you!! Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p><br>
      </div>
    </div>

    <div class="w3-row">
      <div class="w3-col m2 text-center">
        <img class="w3-circle" src="/w3images/avatar1.png" style="width:96px;height:96px">
      </div>
      <div class="w3-col m10 w3-container">
        <h4>Bo <span class="w3-opacity w3-medium">Sep 28, 2014, 10:15 PM</span></h4>
        <p>Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p><br>
      </div>
    </div>
  </div>
  <br>


<jsp:include page="/resources/navbar/footer.jsp" />

</div>
</body>
</html>