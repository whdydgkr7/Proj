<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"> 
<link rel="stylesheet" href="./resources/stars/fontawesome-stars.css"> 
<script type="text/javascript" src="./resources/stars/jquery.barrating.min.js"></script>



<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<script src="http://code.jquery.com/jquery-latest.min.js"></script>




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
    
    

    
      <div class="w3-row-padding">
        <div class="w3-col m12">
          <div class="w3-card w3-round w3-white">
           
          </div>
        </div>
      </div>
      <div class="w3-container">
           <header class="w3-container"  style="padding-top:25px;font-weight: bold; font-size:20px; text-align: center;">
   			 <h1><b>프로젝트 상세보기</b></h1>
 			 </header>
      </div>
      
      <div class="w3-container w3-card w3-white w3-round w3-margin" style="border: solid white 1px; text-align:center;"><br>
        <h2>${boardInfo.title }</h2><br>
        <hr class="w3-clear">
          <div class="w3-row-padding" style="margin:0 -16px; border: solid white 1px; text-align:center;" >
            <div class="w3" style="margin-left: 12%;  width:1000px; text-align: center;">
              <img src="./resources/images/13.jpg" style="width:700px;" alt="Northern Lights" class="w3-margin-bottom"><br />
        
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


  <script>
function commValidate(frm) {
   if(frm.co_content.value==""){
      alert("내용을입력해주세요");
      frm.con.focus();
      return false;
   }
}
</script>



   <!-- 댓글달기s -->
   <h5>댓글</h5>
   
      <form action="./DataComment.do" method="post" name="commentFrm" onsubmit="return commValidate(this);">
      <input type="hidden" name="idx" value="${param.idx }" />
      <input type="hidden" name="id" value="${login.id }" />
      <!-- 원게시물 일련번호 -->
         <table class="table table-bordered" style="margin-left: auto; margin-right: auto;">
            <tr >
               <td rowspan="2">
                  <img class="w3-circle" src="./resources/defaultimg.png" style="width:96px;height:96px">
               </td>
               <td>작성자: ${login.id }</td>
               <td><input type="hidden" /></td>
               <td rowspan="2" ><input type="submit" value="댓글달기" style="width: 80px; height: 96px;"/></td>
            </tr>
            <tr>
               <td colspan="2">
                  <textarea name="content" style="width: 700px; height: 76px; " ></textarea>
               </td>      
            </tr>
         </table>
      </form>
   
   <!-- 댓글달기e -->
   <br /><br /><br /><br />
   
   <!-- 댓글리스트s -->   
   <script>
   function isDelete(){
      var ans = confirm("정말로 삭제하시겠습니까?");
      if(ans == true){
         var f = document.getElementById("pcReply");
         f.action = "./pcDelete";
         f.method="post";
         f.submit();
      }
   }
</script>
   <c:choose>
      <c:when test="${empty pcomment }">
         
      </c:when>
      <c:otherwise>
         <c:forEach items="${pcomment }" var="pclist" varStatus="loop">
            <form action="./pcDelete" method="post" id="pcReply">
                 <table class="table table-bordered"  style="margin-left: 250px; margin-right: auto;">
                    <tr style="text-align: left;">
                       <td rowspan="2">
                         <img src="./resources/defaultimg.png" class="media-object" style="width:60px">
                       </td>
                       <td>
          작성자: ${pclist.id } &nbsp;&nbsp; 작성일:${pclist.postdate }
                       </td>
                    </tr>
                    <tr>
                       <td>
          &nbsp;&nbsp;&nbsp;&nbsp;${pclist.content }
                       </td>
                    </tr>
                 <c:choose>
                    <c:when test="${login.id == pclist.id }">
                    <input type="hidden" value="${param.idx }" name="idx" />
                    <input type="hidden" value="${pclist.comment_idx }" name="cidx" />
                       <tr>
                          <td>
                          <input type="submit" value="삭제하기" onclick="isDelete(this);"/>
                          </td>
                       </tr>                     
                    </c:when>
                    <c:otherwise>
                    </c:otherwise>
                 </c:choose>
                 </table>
                 <br />
            </form>   
         </c:forEach>
      </c:otherwise>
   </c:choose>
   </div>
   <!-- 댓글리스트e -->
   <br />
            </div>
         </div>
      </div>
 
    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->
</div>
<br>


<jsp:include page="/resources/navbar/footer.jsp" />
 


</body>
</html> 