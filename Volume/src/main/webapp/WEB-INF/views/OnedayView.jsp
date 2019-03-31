<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트 스킨</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- <link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat"> -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


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
	height: 300px;
	text-align: center;
}

table.greenTable td, table.greenTable th {
	border: 0px solid #FFFFFF;
	padding: 3px 2px;
}

table.greenTable tbody td {
	font-size: 15px;
	background-color: #F2F0E8;
	color: #000000;
	font-weight: bold;
}
</style>

<jsp:include page="/resources/navbar/navbarTop.jsp" />
<body class="w3-theme-l5">


	
	<!-- Navbar -->
	<!-- <div class="w3-row">
		<img src="./resources/images/10.jpg" alt="" />
	</div> -->



	<!-- Page Container -->
	<div class="w3-container w3-content"
		style="max-width: 1400px; margin-top: 80px">
		<!-- The Grid -->
		<div class="w3-row ">


			<!-- Middle Column -->
			<div class="w3-col m8 w3-center">

				<div class="w3-row-padding">
					<div class="w3-col m12">
						<div class="w3-card w3-round w3-white"></div>
					</div>
				</div>
				<div class="w3-container">
					<h1 style="text-align: center; font-weight: bold;" >원데이 클래스</h1>
				</div>

				<div class="w3-container w3-card w3-white w3-round w3-margin"
					style="border: solid white 1px;">
					<input type="hi-dden" value="${onedayDTO.id}" id="id">
					<input type="hi-dden" value="${onedayDTO.idx}" id="idx">
					<input type="hi-dden" value="${onedayDTO.t_point}" id="point">
					<input type="hi-dden" value="${login.id}" id="userid">
					<div class="w3-row-padding"
						style="margin: 0 -16px; border: solid white 1px;">
						<div class="w3-half" style="margin-left: 10%; width: 700px;">
							<c:choose>
								<c:when test="${not empty thumbnail }">
									<td class="text-center"><img
										src="./resources/thumbnail/${onedayDTO.thumbnail}"></td>
								</c:when>
								<c:otherwise>
									<td class="text-center"><img
										src="./resources/images/defaultimage.jpg"></td>
								</c:otherwise>
							</c:choose>
							<br>
							<h2>
								<%-- <%=title%> --%>
							</h2>
							<br>


							<div class="w3-row-padding w3-margin-bottom">
								<div class="w3-col s4 ">
									<div class="w3-container w3-red w3-padding-16">
										<div class="w3-left">
											<i class="fa fa-comment w3-xxxlarge"></i>
										</div>
										<div class="w3-right">
											<h3>
												<%-- <%=size%> --%>
											</h3>
										</div>
										<div class="w3-clear">
											<h3>
											후기수()
											</h3>
										</div>
										<h4>후기수</h4>
									</div>
								</div>
								<div class="w3-col s4 ">
									<div class="w3-container w3-blue w3-padding-16">
										<div class="w3-left">
											<i class="fa fa-eye w3-xxxlarge"></i>
										</div>
										<div class="w3-right">
											<h3>
												 ${onedayDTO.visit_count }
											</h3>
										</div>
										<div class="w3-clear"></div>
										<h4>조회수</h4>
									</div>
								</div>

								<div class="w3-col s4 ">
									<div class="w3-container w3-orange w3-text-white w3-padding-16">
										<div class="w3-left">
											<i class="fa fa-users w3-xxxlarge"></i>
										</div>
										<div class="w3-right">
											<h3>
												  
											</h3>
										</div>
										<div class="w3-clear"></div>
										<h4>참여자수</h4>
									</div>
								</div>
							</div>
							<div class="w3-row">
								
									<div
										class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding"
										style="font-weight: bold;">상세정보</div>
								
									
									<div
										class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding"
										style="font-weight: bold;">위치정보</div>
								
									<div
										class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding"
										style="font-weight: bold;">후기</div>
							
							</div>
							
							<br>
							<div id="view" class="w3-container Ex"
								style="display: block; height: 800px; text-align: left;">
								<h2>클래스 정보</h2>
								<br>
								<table class="greenTable">
									<tbody>
										<tr>
											<td style="background-color: #F2F0E8;">클래스명:</td>
											<td> ${onedayDTO.title }</td>
											
										<tr>
											<td style="background-color: #F2F0E8;">클래스 개시자</td>
											<td> ${onedayDTO.id }</td>
										</tr>											
										</tr>

										<tr>
											<td style="background-color: #F2F0E8;">클래스 시작일 :</td>
											<td> ${onedayDTO.start_date }</td>
										</tr>
										<tr>
											<td style="background-color: #F2F0E8;">클래스 종료일:</td>
											<td> ${onedayDTO.end_date }</td>
										</tr>
																				<tr>
											<td style="background-color: #F2F0E8;">클래스 시간:</td>
											<td> ${onedayDTO.t_time }</td>
										</tr>
										<tr>
											<td style="background-color: #F2F0E8;">클래스 방식 :</td>
											<td> ${onedayDTO.t_method }</td>
										</tr>										
										<tr style="height: 300px;">
											<td style="background-color: #F2F0E8;">클래스 설명:</td>
											<td> ${onedayDTO.content }</td>
										</tr>
										<tr>
											<td style="background-color: #F2F0E8;">클래스 총 수용인원:</td>
											<td> ${onedayDTO.e_limit }</td>
										</tr>
										<tr>
											<td style="background-color: #F2F0E8;">클래스 상태 :</td>
											<td> ${onedayDTO.state }</td>
										</tr>										



									</tbody>

								</table>
				<div class="w3-container" style="text-align: center;">
						<h2 style="font-weight: bold;'">클래스 참가인원</h2>


						<p id="myP" style="font-size: 40px; font-weight:bold;">
							현재 인원 <span id="demo"></span>${num } 명  / 총 ${onedayDTO.e_limit } 명
						</p>
						<p id="Cmyp">참가하기를 클릭해주세요</p>

						<!-- 한번 신청하면 더이상신청안되게하기 -->
						<button class="w3-button w3-lime" onclick="move();">참가하기</button>
					</div>
					<hr>
<script>
						function move() {


								$.ajax({
									//요청할 서버의 페이지 경로(form의 action과 동일)
									url : "joinClass",
									//응답결과의 데이터 형식 (jsonm xml, html 등)
									dataType : "html",
									//전송방식
									type : "get",
									data : {
										id : $('#id').val(),
										idx : $('#idx').val(),
										point: $('#point').val(),
										userid: $('#userid').val()
									},
									//서버로 전송시의 컨텐츠 타입
									contentType : "text.html;charset:utf-8",

									//요청 성공 시 콜백 메소드
									success : function(data) {
										alert(data);
									},
									//요청 실패 시 콜백 메소드
									error : function(e) {
										alert("오류발생:" + e.status + ":"
												+ e.statusText);
									}
								});
							

						}
					</script>


							</div>

							<div id="location" class="w3-container Ex"
								style="display:block; height: 500px; text-align: left;">
								<h2>위치정보</h2>
								<br>
								<div id="map" style="width: 100%; height: 350px;"></div>
								<button onclick="zoomIn()" style="background-color: #DEE686;">지도레벨
									- 1</button>
								<button onclick="zoomOut()" style="background-color: #DEE686;">지도레벨
									+ 1</button>
								<span id="maplevel"></span>
								<script type="text/javascript"
									src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70a54cc4cc1852fb30a4ac2b3cd30ac3&libraries=services"></script>
								<script>
									var mapContainer = document
											.getElementById('map'), // 지도를 표시할 div 
									mapOption = {
										center : new daum.maps.LatLng(
												33.450701, 126.570667), // 지도의 중심좌표
										level : 3
									// 지도의 확대 레벨
									};
									var addstr = "";
									var addstr = "";
									// 지도를 생성합니다    
									var map = new daum.maps.Map(mapContainer,
											mapOption);

									// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
									var mapTypeControl = new daum.maps.MapTypeControl();

									// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
									// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
									map.addControl(mapTypeControl,
											daum.maps.ControlPosition.TOPRIGHT);

									// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
									var zoomControl = new daum.maps.ZoomControl();
									map.addControl(zoomControl,
											daum.maps.ControlPosition.RIGHT);

									// 주소-좌표 변환 객체를 생성합니다
									var geocoder = new daum.maps.services.Geocoder();

									// 주소로 좌표를 검색합니다
									geocoder
											.addressSearch(
													' ${onedayDTO.address }',
													function(result, status) {

														// 정상적으로 검색이 완료됐으면 
														if (status === daum.maps.services.Status.OK) {

															var coords = new daum.maps.LatLng(
																	result[0].y,
																	result[0].x);

															// 결과값으로 받은 위치를 마커로 표시합니다
															var marker = new daum.maps.Marker(
																	{
																		map : map,
																		position : coords
																	});

															// 인포윈도우로 장소에 대한 설명을 표시합니다
															var infowindow = new daum.maps.InfoWindow(
																	{
																		content : '<div style="width:150px;text-align:center;padding:6px 0;">수업 장소</div>'
																	});
															infowindow
																	.open(map,
																			marker);

															// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
															map
																	.setCenter(coords);
														}

													});

									displayLevel();

									// 지도 레벨은 지도의 확대 수준을 의미합니다
									// 지도 레벨은 1부터 14레벨이 있으며 숫자가 작을수록 지도 확대 수준이 높습니다
									function zoomIn() {
										// 현재 지도의 레벨을 얻어옵니다
										var level = map.getLevel();

										// 지도를 1레벨 내립니다 (지도가 확대됩니다)
										map.setLevel(level - 1);

										// 지도 레벨을 표시합니다
										displayLevel();
									}

									function zoomOut() {
										// 현재 지도의 레벨을 얻어옵니다
										var level = map.getLevel();

										// 지도를 1레벨 올립니다 (지도가 축소됩니다)
										map.setLevel(level + 1);

										// 지도 레벨을 표시합니다
										displayLevel();
									}

									function displayLevel() {
										var levelEl = document
												.getElementById('maplevel');
										levelEl.innerHTML = '현재 지도 레벨은 '
												+ map.getLevel() + ' 레벨 입니다.';
									}
								</script>
								<p></p>
							</div>

							<div id="review" class="w3-container Ex"
								style="display: none; height: 800px; text-align: left;">
								<h2>후기</h2>
								<br />

								<p>Class별점</p>
								<select id="example">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>




								<div class="w3-container w3-content w3-padding-64"
									style="max-width: 800px" id="contact">


									<div class="w3-row w3-padding-32">



										<form action="/action_page.php" target="_blank">
											<div class="w3-row-padding" style="margin: 0 -16px 8px -16px">
												<div class="w3-half">
													<input class="w3-input w3-border" type="text"
														placeholder="Name" required name="Name">
												</div>
												<div class="w3-half">
													<input class="w3-input w3-border" type="text"
														placeholder="Email" required name="Email">
												</div>
											</div>
											<input class="w3-input w3-border" type="text"
												placeholder="Message" required name="Message">
											<button class="w3-button w3-black w3-section w3-right"
												type="submit">SEND</button>
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
						<p class="w3-center">
							<img src="./resources/images/img_avatar1.png" class="w3-circle"
								style="height: 106px; width: 106px" alt="Avatar">
						</p>
						<hr>
						<p>
							<i class="fa fa-book fa-fw w3-margin-right w3-text-theme"></i>
						 님
						</p>
						<p>
							<i class="fa fa-map-marker fa-fw w3-margin-right w3-text-theme"></i>
							수업방식 : ${boardInfo.t_method }
						</p>
						<p>
							<i class="fa fa-heart fa-fw w3-margin-right w3-text-theme"></i>
							Point : ${boardInfo.t_point }
						</p>
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
</html>
