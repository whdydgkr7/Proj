<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ProjectBbsDTO"%>
<%@page import="user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<title>Volume</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Lato", sans-serif
}

.w3-bar, h1, button {
	font-family: "Montserrat", sans-serif
}

.fa-anchor, .fa-coffee {
	font-size: 200px
}
</style>

<body>

	</script>

	<!-- 카카오 플러스친구 -->

	<div>
		<jsp:include page="/resources/navbar/navbarTop.jsp" />
	</div>


	<!-- Header -->
	<div class="w3-row">

		<header class="w3-container w3-lime w3-center"
			style="padding: 120px 16px; height: 390px; background-image: url('./resources/images/8.png');">
			<h1 class="w3-margin w3-jumbo" style="font-weight: bold;">
				<span class="w3-padding w3-lime w3-opacity-min"
					style="font-size: 90px;">VolUMe</span>
			</h1>


		</header>

		<!-- Navbar -->




		<h3 style="font-weight: bold; padding: 100px;">진행중인 프로젝트</h3>

		<div class="w3-row-padding w3-padding-16 w3-center" id="food"
			style="padding: 100px;">
			<div class="row">
				<c:choose>
					<c:when test="${empty projectBbsDTO }">
						<div class="col-md-3">
							<div class="thumbnail">
								<a href="/w3images/lights.jpg"> <img
									src="/w3images/lights.jpg" alt="Lights" style="width: 100%">
									<div class="caption">
										<p>최근 진행중인 프로젝트가 없습니다.</p>
									</div>
								</a>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${projectBbsDTO }" var="row" varStatus="loop">

							<div class="col-md-3">
								<div class="thumbnail">
									<c:choose>
										<c:when test="${not empty row.thumbnail}">
											<td class="text-center"><img
												src="./resources/18/${row.thumbnail}"></td>
										</c:when>
										<c:otherwise>
											<td class="text-center"><img
												src="./resources/images/defaultimage.jpg"></td>
										</c:otherwise>
									</c:choose>
									<div class="caption">
										<p style="text-align: left;">
											프로젝트명 :&nbsp; ${row.title } <br /> 프로젝트 기간:&nbsp;
											${row.start_date }&nbsp;~&nbsp;${row.end_date } <br /> 프로젝트
											필요인원:&nbsp; ${row.m_limit }
										</p>
									</div>
									</a>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<br />

		<h3 style="font-weight: bold; padding: 100px;">원데이 클래스</h3>
		<div class="w3-row-padding w3-padding-16 w3-center" id="food"
			style="padding: 100px;">
			<div class="row">
				<c:choose>
					<c:when test="${empty onedayDTO }">
						<div class="col-md-3">
							<div class="thumbnail">
								<a href="/w3images/lights.jpg"> <img
									src="/w3images/lights.jpg" alt="Lights" style="width: 100%">
									<div class="caption">
										<p>최근 진행중인 프로젝트가 없습니다.</p>
									</div>
								</a>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${onedayDTO }" var="row" varStatus="loop">

							<div class="col-md-3">
								<div class="thumbnail">
									<c:choose>
										<c:when test="${not empty row.thumbnail}">
											<td class="text-center"><img
												src="./resources/18/${row.thumbnail}"></td>
										</c:when>
										<c:otherwise>
											<td class="text-center"><img
												src="./resources/images/defaultimage.jpg"></td>
										</c:otherwise>
									</c:choose>

									<div class="caption">
										<p style="text-align: left;">
											클래스명 :&nbsp; ${row.title } <br /> 수강날짜
											:&nbsp;${row.start_date }<br /> 수강인원:&nbsp; ${row.e_limit }
										</p>
									</div>
									</a>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<br />


		<jsp:include page="/resources/navbar/footer.jsp" />



		<script>
                  // Used to toggle the menu on small screens when clicking on the menu button
                  function myFunction() {
                     var x = document.getElementById("navDemo");
                     if (x.className.indexOf("w3-show") == -1) {
                        x.className += " w3-show";
                     } else {
                        x.className = x.className.replace(" w3-show",
                              "");
                     }
                  }
               </script>
</body>

<!-- 카카오 플러스친구 1234  -->
<script>
   window.kakaoAsyncInit = function() {
      Kakao.init('b458377709ca26b5cb9a3bc9d36c1860');
      Kakao.PlusFriend.createChatButton({
         container : '#plusfriend-chat-button'
      });
   };

   (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id))
         return;
      js = d.createElement(s);
      js.id = id;
      js.src = "//developers.kakao.com/sdk/js/kakao.plusfriend.min.js";
      fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'kakao-js-sdk'));
</script>
</html>