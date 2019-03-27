<%@page import="model.PcommentDTO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ProjectBbsDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- <link rel="stylesheet" href="./resources/stars/fontawesome-stars.css"> -->
<!-- <script type="text/javascript"
	src="./resources/stars/jquery.barrating.min.js"></script> -->



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

<
style>html, body, h1, h2, h3, h4, h5 {
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
	background-color: #F2F0E8;
	color: #000000;
	font-weight: bold;
}
</style>




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
			<%
				ProjectBbsDTO list = new ProjectBbsDTO();
				ArrayList<ProjectBbsDTO> dto = (ArrayList<ProjectBbsDTO>) request.getAttribute("lists");
				String id = "";
				int visitcount = 0;
				Date sdate = null;
				Date edate = null;
				String content = "";
				int m_limits = 0;
				String title = null;
				String address = null;
				String thumbnail=null;

				for (ProjectBbsDTO dt : dto) {
					title = dt.getTitle();
					id = dt.getTitle().toString();
					sdate = dt.getStart_date();
					edate = dt.getEnd_date();
					visitcount = dt.getVisit_count();
					content = dt.getContent();
					m_limits = dt.getM_limit();
					thumbnail=dt.getThumbnail();
				}
			%>
			<%
				ArrayList<PcommentDTO> pcdt = (ArrayList<PcommentDTO>) request.getAttribute("pcomment");
				int size = 0;

				for (PcommentDTO dt : pcdt) {
					size++;
				}
			%>


			<div class="w3-row-padding">
				<div class="w3-col m12">
					<div class="w3-card w3-round w3-white"></div>
				</div>
			</div>
			<div class="w3-container">
				<header class="w3-container"
					style="padding-top: 25px; font-weight: bold; font-size: 20px; text-align: center;">
					<h1>
						<b>프로젝트 상세보기</b>
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
						<!-- 디비에서 값 받아오기 -->
						<c:choose>
							<c:when test="${not empty thumbnail }">
								<td class="text-center"><img
									src="./resources/thumbnail/${thumbnail}"></td>
							</c:when>
							<c:otherwise>
								<td class="text-center"><img
									src="./resources/images/defaultimage.jpg"></td>
							</c:otherwise>
						</c:choose>
						<br>
						<h2><%=title%></h2>
						<br>


						<div class="w3-row-padding w3-margin-bottom" style="text-align: center;">
							<div class="w3-col s4 ">
								<div class="w3-container w3-red w3-padding-16">
									<div class="w3-left">
										<i class="fa fa-comment w3-xxxlarge"></i>
									</div>
									<div class="w3-right">
										<h3><%=size%></h3>
									</div>
									<div class="w3-clear"></div>
									<h4>후기수</h4>
								</div>
							</div>
							<div class="w3-col s4 ">
								<div class="w3-container w3-blue w3-padding-16">
									<div class="w3-left">
										<i class="fa fa-eye w3-xxxlarge"></i>
									</div>
									<div class="w3-right">
										<h3><%=visitcount%></h3>
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
										<h3><%=m_limits%></h3>
									</div>
									<div class="w3-clear"></div>
									<h4>참여자수</h4>
								</div>
							</div>
						</div>


						<table class="greenTable">
							<tbody>


								<tr>
									<td style="background-color: #F2F0E8;">프로젝트 시작일 :</td>
									<td><%=sdate%></td>
								</tr>
								<tr>
									<td style="background-color: #F2F0E8;">프로젝트 종료일:</td>
									<td><%=edate%></td>
								</tr>
								<tr style="height: 300px;">
									<td style="background-color: #F2F0E8;">프로젝트 설명:</td>
									<td><%=content%></td>
								</tr>
								<tr>
									<td style="background-color: #F2F0E8;">프로젝트 참가인원:</td>
									<td><%=m_limits%>명</td>
								</tr>
								<tr>
									<td colspan="2" style="background-color: #DEE686;">장소</td>
								</tr>
								<tr>
									<td colspan="2"><div id="map"
											style="width: 100%; height: 350px;"></div>
										<button onclick="zoomIn()" style="background-color: #DEE686;">지도레벨
											- 1</button>
										<button onclick="zoomOut()" style="background-color: #DEE686;">지도레벨
											+ 1</button> <span id="maplevel"></span> <script
											type="text/javascript"
											src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70a54cc4cc1852fb30a4ac2b3cd30ac3&libraries=services"></script>
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
											
											// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
											var mapTypeControl = new daum.maps.MapTypeControl();

											// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
											// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
											map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
											
											// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
											var zoomControl = new daum.maps.ZoomControl();
											map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
											
											
											
											
											// 주소-좌표 변환 객체를 생성합니다
											var geocoder = new daum.maps.services.Geocoder();
											
											// 주소로 좌표를 검색합니다
											geocoder.addressSearch('<%=address%>', function(result, status) {
											
												
												
												
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
											 
											function displayLevel(){
											    var levelEl = document.getElementById('maplevel');
											    levelEl.innerHTML = '현재 지도 레벨은 ' + map.getLevel() + ' 레벨 입니다.';
											}
											</script></td>
								</tr>
							</tbody>
						</table>

						<hr>
					</div>



					<div class="w3-container">
						<h2 style="font-weight: bold;'">프로젝트 참가인원</h2>

						<div class="w3-light-grey">
							<div id="myBar" class="w3-container w3-green"
								style="height: 24px; width: 0%"></div>
						</div>

						<p id="myP">
							현재 인원 <span id="demo">0</span> / 총 100 명
						</p>
						<p id="Cmyp">참가하기를 클릭해주세요</p>

						<!-- 한번 신청하면 더이상신청안되게하기 -->
						<button class="w3-button w3-lime" onclick="move();">참가하기</button>
					</div>
					<hr>
					<script>
						function move() {
							var elem = document.getElementById("myBar");
							var width = 0;
							width = parseInt(elem.style.width);

							if (width >= 100) {
								clearInterval(id);
								alert("정원초과입니다");
							} else {
								width += 1;
								elem.style.width = width + '%';
								var num = parseInt(elem.style.width);
								num = num.toFixed(0)
								document.getElementById("demo").innerHTML = num;
								document.getElementById("Cmyp").className = "w3-text-green w3-animate-opacity";
								document.getElementById("Cmyp").innerHTML = "참가 신청되었습니다.!";
								alert("참가신청이 완료되었습니다.")
								//location.href="";
							}
						}
					</script>



					<script>
						function commValidate(frm) {

							if (frm.id.value == "") {
								alert("로그인후 사용가능합니다");
								location.href = "login";
								return false;
								/* action = "login";
								submit(); */
							}
							if (frm.content.value == "") {
								alert("내용을입력해주세요");
								frm.content.focus();
								return false;
							}
						}
					</script>

					<!-- 댓글달기s -->
					<h5>댓글</h5>

					<form action="./DataComment.do" method="post" name="commentFrm"
						onsubmit="return commValidate(this);">
						<input type="hidden" name="idx" value="${param.idx }" /> <input
							type="hidden" name="id" value="${login.id }" />
						<!-- 원게시물 일련번호 -->
						<table class="table table-bordered"
							style="margin-left: auto; margin-right: auto;">
							<tr>
								<td rowspan="2"><img class="w3-circle"
									src="./resources/defaultimg.png"
									style="width: 96px; height: 96px"></td>
								<td>작성자: ${login.id }</td>
								<td><input type="hidden" /></td>
								<td rowspan="2"><input type="submit" value="댓글달기"
									style="width: 80px; height: 96px;" /></td>
							</tr>
							<tr>
								<td colspan="2"><textarea name="content"
										style="width: 700px; height: 76px;"></textarea></td>
							</tr>
						</table>
					</form>

					<!-- 댓글달기e -->
					<br /> <br /> <br /> <br />

					<!-- 댓글리스트s -->
					<script>
						function isDelete() {
							var ans = confirm("정말로 삭제하시겠습니까?");
							if (ans == true) {
								var f = document.getElementById("pcReply");
								f.action = "./pcDelete";
								f.method = "post";
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
									<table class="table table-bordered"
										style="margin-left: 250px; margin-right: auto;">
										<tr style="text-align: left;">
											<td rowspan="2"><img src="./resources/defaultimg.png"
												class="media-object" style="width: 60px"></td>
											<td>작성자: ${pclist.id } &nbsp;&nbsp;
												작성일:${pclist.postdate }</td>
										</tr>
										<tr>
											<td>&nbsp;&nbsp;&nbsp;&nbsp;${pclist.content }</td>
										</tr>
										<c:choose>
											<c:when test="${login.id == pclist.id }">
												<input type="hidden" value="${param.idx }" name="idx" />
												<input type="hidden" value="${pclist.comment_idx }"
													name="cidx" />
												<tr>
													<td><input type="button" value="삭제하기"
														onclick="isDelete(this);" /></td>
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
