<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Set"%>
<%@page import="model.BeforeApprovalDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">




<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<script src="http://code.jquery.com/jquery-latest.min.js"></script>




<style>
html, body, h1, h2, h3, h4, h5 {
	font-family: "Open Sans", sans-serif
}

table.greenTable {
  font-family: Arial, Helvetica, sans-serif;
  border: 5px solid #DEE686;
  background-color: #FFFFFF;
  width: 100%;
  height: 200px;
  text-align: center;
}
table.greenTable td, table.greenTable th {
  border: 0px solid #FFFFFF;
  padding: 3px 2px;
  
}
table.greenTable tbody td {
  font-size: 15px;
  background-color:#F2F0E8;
  color: #000000;
  font-weight: bold;
}

</style>

<%

BeforeApprovalDTO beforeApprovalDTO = (BeforeApprovalDTO)request.getAttribute("beforeApprovalDTO");
int propose_idx=beforeApprovalDTO.getPropose_idx();


%>


<body class="w3-theme-l5">

	<!-- Navbar -->
	<div class="w3-row">
		<img src="./resources/images/10.jpg" alt="" />
	</div>
	<jsp:include page="/resources/navbar/navbarTop.jsp" />


	<!-- Page Container -->
	<div class="w3-container w3-content"
		style="max-width: 1400px; margin-top: 80px">
		<!-- The Grid -->
		<div class="w3-row ">


			<div class="w3-row-padding">
				<div class="w3-col m12">
					<div class="w3-card w3-round w3-white"></div>
				</div>
			</div>
			<div class="w3-container">
				<header class="w3-container"
					style="padding-top: 25px; font-weight: bold; font-size: 20px; text-align: center;">
					<h1>
						<b>PROPOSAL 제안하기 </b>
					</h1>
				</header>
			</div>

			<div class="w3-container w3-card w3-white w3-round w3-margin"
				style="border: solid white 1px; text-align: center;">

				<hr class="w3-clear">
				<div class="w3-row-padding"
					style="margin: 0 -16px; border: solid white 1px; text-align: center;">
					<div class="w3"
						style="margin-left: 12%; width: 1000px; text-align: center;">
						<img src="./resources/images/${beforeApprovalDTO.thumbnail}" 
							>
							${beforeApprovalDTO.thumbnail}
							
				<br>
				
				<h2>${beforeApprovalDTO.title }</h2>
				<br>
						<div class="w3-row-padding w3-margin-bottom">
							<div class="w3-half">
								<div class="w3-container w3-red w3-padding-8">
									<div class="w3-left">
										<i class="	fa fa-thumbs-o-up w3-xxxlarge"></i>
									</div>
									<div class="w3-right">
										<h3>${beforeApprovalDTO.recommend}</h3>
									</div>
									<div class="w3-clear"></div>
									<h4>추천수 :</h4>
								</div>
							</div>
							<div class="w3-half">
								<div class="w3-container w3-orange w3-padding-8">
									<div class="w3-left">
										<i class="fa fa-eye w3-xxxlarge"></i>
									</div>
									<div class="w3-right">
										<h3>${beforeApprovalDTO.visit_count}</h3>
									</div>
									<div class="w3-clear"></div>
									<h4>조회수</h4>
								</div>
							</div>

						</div>

			
<table class="greenTable">
<tbody>
<%-- <tr>
<td>이미지:</td><td></td>${beforeApprovalDTO.thumbnail}</div></tr> --%>

<tr>
<td style="background-color:#F2F0E8; ">프로젝트 시작일 :</td><td>${beforeApprovalDTO.start_date}</td></tr>
<tr>
<td style="background-color:#F2F0E8; ">프로젝트 종료일:</td><td>${beforeApprovalDTO.end_date}</td></tr>
<tr style="height: 300px;">
<td style="background-color:#F2F0E8; ">프로젝트 설명:</td><td>${beforeApprovalDTO.content}</td></tr>
<tr>
<td style="background-color:#F2F0E8; " >프로젝트 참가인원:</td><td>${beforeApprovalDTO.p_limit} 명 </td></tr>
<tr>
<td colspan="2" style="background-color:#DEE686; ">장소</td></tr>
<tr>
<td colspan="2"><div id="map" style="width:100%;height:350px;"></div>

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
geocoder.addressSearch('${beforeApprovalDTO.address}', function(result, status) {

	
	
	
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
            content: '<div style="width:150px;text-align:center;padding:6px 0;">프로젝트 위치</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
    
});    
</script></td></tr>

</tbody>
</tr>
</table>






						<p id="Cmyp">이 프로젝트가 시행되길 바라신다면 추천하기를 눌러주세요</p>
						
						<button class="w3-button w3-lime"  onclick="move();">추천하기</button>
					</div>
					<hr>
					<script>
				function move() {
				  document.getElementById("Cmyp").className = "w3-text-green w3-animate-opacity";
				  document.getElementById("Cmyp").innerHTML = "추천 되었습니다.!";
				alert("추천하기가 완료되었습니다.");
				location.href='./recommendAction.do?idx=<%=propose_idx%>';
				}
				</script>

				</div>
			</div>
		</div>

	</div>
	
	<br>


	<jsp:include page="/resources/navbar/footer.jsp" />



</body>
</html>
