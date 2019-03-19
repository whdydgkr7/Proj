<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>ProjectBbsViewtle</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

	<!--summernote  -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script> 


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <style>
html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
</style> -->

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

		<div class="w3-container w3-lime">
 			 <h2>프로젝트 제안하기</h2>
		</div>
		<form enctype="multipart/form-data" class="w3-container" style="margin: 100px;">

		<label style="margin-top: 20px; font-weight: bold;" >ID</label>
		<input class="w3-input" type="text" style="width: 200px;">
		
		<label style="margin-top: 20px; font-weight: bold;">썸네일 등록하기</label>
		<input class="w3-input" type="text" style="width: 200px;">
		
		<label style="margin-top: 20px; font-weight: bold;">프로젝트 명</label>
		<input class="w3-input" type="text" style="width: 200px;">
		
		<label style="margin-top: 20px; font-weight: bold;">프로젝트 시작일</label>
		<input class="w3-input" type="text" style="width: 200px;">
		
		<label style="margin-top: 20px;font-weight: bold;">프로젝트 종료일</label>
		<input class="w3-input" type="text" style="width: 200px;">		
		
		<label style="margin-top: 20px;font-weight: bold;">프로젝트 필요인원</label>
		<input class="w3-input" type="text" style="width: 200px;">	
		
		<label style="margin-top: 20px; font-weight: bold;">프로젝트 설명</label>
		<textarea id="summernote" rows="5" class="form-control" name="content"></textarea>
		<script>
		$(document).ready(function() {
			$('#summernote').summernote();
		});
		</script>		
		<input class="w3-input" type="text" style="width: 200px;">
		
		<label style="margin-top: 20px; font-weight: bold;">장소</label>
		
		<input type="text" id="sample4_postcode" placeholder="우편번호">
		
		<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
		<span id="guide" style="color:#999;display:none"></span>
		<input type="text" id="sample4_detailAddress" placeholder="상세주소">
		<input type="hid-den" id="address" value="<% %>">
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		
	<script>
	    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수
	
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample4_postcode').value = data.zonecode;
	                document.getElementById("sample4_roadAddress").value = roadAddr;
	                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){
	                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
	                } else {
	                    document.getElementById("sample4_extraAddress").value = '';
	                }
	
	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';
	
	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                    guideTextBox.style.display = 'block';
	                } else {
	                    guideTextBox.innerHTML = '';
	                    guideTextBox.style.display = 'none';
	                }
	            }
	        }).open();
	    }
	</script>
		</form>
		 
	
</div>
<%@ include file="/resources/navbar/footer.jsp" %>
</body>


<!--footer  -->
<%-- <jsp:include page="/resources/navbar/footer.jsp" /> --%>


</html>
