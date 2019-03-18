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
</style>
</style>
<script>//자료실 리스트에서 검색어 입력 확인부분


//자료실 글쓰기폼 공백 체크
function frmValidate(frm){

	if(frm.title.value==""){
		alert("제목을 입력해주세요");
		frm.title.focus();
		return false;
	}
	if(frm.content.value==""){
		alert("내용을 입력해주세요");
		frm.content.focus();
		return false;
	}
}</script>
<body class="container">


<div class="w3-row">
      <img src="./resources/images/10.jpg" alt="" />
</div>
<jsp:include page="/resources/navbar/navbarTop.jsp" />
<div class="w3-row-padding w3-padding-64 w3-container-fluid " style="height: 900px; ">
		<form action="/action_page.php" class="w3-container w3-card-4 w3-light-grey  w3-margin">
		<h2 class="w3-center" style="font-weight: bold;">프로젝트 제안하기</h2>
	
		 
		
		</form>
</div>
<!--footer  -->
<jsp:include page="/resources/navbar/footer.jsp" />
</body>
</html>