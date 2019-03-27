<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<!--summernote  -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>


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

button {
	background: #CDDB39;
	color: black;
	border: none;
	position: relative;
	height: 60px;
	font-size: 1.6em;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

button:hover {
	background: #fff;
	color: #1AAB8A;
}

button:before, button:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

button:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

button:hover:before, button:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

* {
	margin: 0;
	padding: 0;
}

#uploadPreview {
	border: 1px solid gray;
	height: 300px;
	width: 300px;
}

#uploadImage {
	width: 200px;
	float: left;
}

html, body {
	background-color: #F2F3F2;
}
</style>

<body>

	<!-- Header -->

	<div class="w3-row">
		<img src="./resources/images/10.jpg" alt="" />
	</div>
	<jsp:include page="/resources/navbar/navbarTop.jsp" />

	<!--///////////////////////////////////////////////  -->

	<form class="form-horizontal" enctype="multipart/form-data"
		name="writeFrm" method="post"
		action="<c:url value="OnedayWriteAction.do"/>"
		onsubmit="return fileCheck(this.thumbnail.value);">
		<fieldset>

			<!-- Form Name -->


			<!-- Text input-->

			<div class="form-group"></div>

			<h1 class="w3-text-BLACK"
				style="font-weight: bold; margin-left: 10px; margin-top: 50px;">PROPOSAL</h1>
			<!-- 작성자 입력칸-->
			<div class="form-group">

				<label class="w3=text-green col-md-4 control-label">작성자(ID)
					: </label>
				<div class="col-md-4">
					<input name="id" type="text" class="form-control input-md"
						style="width: 200px;" value="${sessionScope.login.id}">
				</div>

			</div>
			<!-- 프로젝트명  입력칸-->



			<div class="form-group">
				<label class="col-md-4 control-label"> 클래스 명 : </label>
				<div class="col-md-4">
					<input id="title" name="title" type="text" placeholder="프로젝트명"
						class="form-control input-md" style="width: 200px;">
				</div>
			</div>

		
			<div class="form-group">
			
				<label class="col-md-4 control-label"> 클래스 이미지 :</label>
				
				<div class="col-md-4">
						
					<input id="thumbnail" type="file" name="thumbnail"
						onchange="PreviewImage(); " data-width="500" data-height="500" />
						<h5>업로드 규격 가로,세로 500px 이하</h5>
				</div>
			</div>
			<script>
			
			$(document).on('change', 'input[type=file]', function(){
			
				 var $width = $(this).attr('data-width');
			
				 var $height = $(this).attr('data-height');
			
				 var $target = $(this);
			
				 
			
				 if(window.FileReader){ 
			
				   var reader = new FileReader();
			
				       reader.onload = function (e) {
			
				           $('body').append('<img src="" id="temp_img" style="display:none;" />');  //보이지 않는 임시 img 태그를 생성.
			
				           $img = $('#temp_img').attr('src', e.target.result);                          //파일을 선택했을 경우 정보를 $img 객체에 저장
			
				           if($img.width() != $width || $img.height() != $height){                  //가로 세로 사이즈 비교 후 반환
			
				                alert('지정된 크기와 맞지 않습니다.('+$width + 'x'+ $height +')');
			
				                $target.val('');
			
				                $('#temp_img').remove(); //위에서 생성한 임시 img 태그 삭제
			
				                return;
			
				            }
			
				      };
			
				      reader.readAsDataURL($(this)[0].files[0]);  //파일을 img 태그에 보여줄 수 있도록 base64로 url을 생성합니다.
			
				 } else {                                               
			
				    $(this)[0].select();
			
				    var src = document.selection.createRange().text;
			
				    $('body').append('<img src="" id="temp_img" style="display:none;" />');
			
				    $img = $('#temp_img').attr('src', src);
			
				    $('#temp_img').remove();
			
				    if($img.width() != $width || $img.height() != $height){
			
				        alert('지정된 크기와 맞지 않습니다.('+$width + 'x'+ $height +')');
			
				        $(this).val('');
			
				        return;
			
				    }
			
				 }
			
				 $('#temp_img').remove();
			
				});
			
			</script>



			<div class="form-group">
				<label class="col-md-4 control-label"> 미리보기 : </label>
				<div class="col-md-4">
					<img id="uploadPreview" style="width: 300px; height: 300px;" />
					<script type="text/javascript">
				
				function PreviewImage() {
				    var oFReader = new FileReader();
				    oFReader.readAsDataURL(document.getElementById("thumbnail").files[0]);
				
				    oFReader.onload = function (oFREvent) {
				        document.getElementById("uploadPreview").src = oFREvent.target.result;
				    };
				};
				</script>
				</div>
			</div>


			<!-- 작성자 입력칸-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="ln">클래스 수강일 :</label>
				<div class="col-md-4">
					<input type="date" name="start_date">
				</div>
			</div>
<!-- 			<div class="form-group">
				<label class="col-md-4 control-label" for="ln">클래스 종료일 : </label>
				<div class="col-md-4">
					<input type="date" name="end_date">
				</div>
			</div> -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="ln">클래스 시간 : </label>
				<div class="col-md-4">
					<input type="time" name="start_time"> &nbsp;~&nbsp;
					<input type="time" name="end_time">

						
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" for="ln">수업방식: </label>
				<div class="col-md-4">
					<input type=text style="width: 300px;" name="t_method">
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-4 control-label" for="ln">참여인원 수 : </label>
				<div class="col-md-4">
					<input type=text style="width: 50px;" name="e_limit"> 명
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" for="ln">수강시 소모 포인트 : </label>
				<div class="col-md-4">
					<input type=text style="width: 50px;" name="t_point">&nbsp;	POINT
				</div>
			</div>		

			<div class="form-group">
				<label class="col-md-4 control-label" for="ln" > 설명 : </label>
				<div class="col-md-4">
					<textarea id="summernote" class="form-control" name="content"></textarea>
					<script>
            $(document).ready(function() {
               $('#summernote').summernote();
                  height : 500;   
               });
            </script>
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-4 control-label" for="ln">장 소 : </label>
				<div class="col-md-4">
					<span> <input type="text" id="sample6_postcode"
						placeholder="우편번호""> <input type="button"
						onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br /></span><br />
					<input type="text" id="sample6_address" placeholder="주소"
						style="width: 600px;" name="address"><br /> <input
						type="text" id="sample6_detailAddress" placeholder="상세주소">
					<input type="text" id="sample6_extraAddress" placeholder="참고항목">
					<input type="hid den" id="address" name="address"
						disabled="disabled">
					<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
					<script>
             function sample6_execDaumPostcode() {
                 new daum.Postcode({
                     oncomplete: function(data) {
                         // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
         
                         // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                         // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                         var addr = ''; // 주소 변수
                         var extraAddr = ''; // 참고항목 변수
         
                         //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                         if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                             addr = data.roadAddress;
                         } else { // 사용자가 지번 주소를 선택했을 경우(J)
                             addr = data.jibunAddress;
                         }
         
                         // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                         if(data.userSelectedType === 'R'){
                             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                             // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                             if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                 extraAddr += data.bname;
                             }
                             // 건물명이 있고, 공동주택일 경우 추가한다.
                             if(data.buildingName !== '' && data.apartment === 'Y'){
                                 extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                             }
                             // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                             if(extraAddr !== ''){
                                 extraAddr = ' (' + extraAddr + ')';
                             }
                             // 조합된 참고항목을 해당 필드에 넣는다.
                             document.getElementById("sample6_extraAddress").value = extraAddr;
                         
                         } else {
                             document.getElementById("sample6_extraAddress").value = '';
                         }
         
                         // 우편번호와 주소 정보를 해당 필드에 넣는다.
                         document.getElementById('sample6_postcode').value = data.zonecode;
                         document.getElementById("sample6_address").value = addr;
                         // 커서를 상세주소 필드로 이동한다.
                         document.getElementById("sample6_detailAddress").focus();
                     }
                 }).open();
             }
         </script>
				</div>
			</div>

			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="submit"></label>
				<div class="col-md-4">
					<button type="submit" id="proposal"
						style="height: 50px; width: 200px; border-radius: 15px;">
						<i class="glyphicon glyphicon-pencil"
							style="font-size: 18px; font-weight: bold;">생성하기</i>
					</button>
				</div>
			</div>

		</fieldset>
	</form>
	<jsp:include page="/resources/navbar/footer.jsp" />
</body>

</html>