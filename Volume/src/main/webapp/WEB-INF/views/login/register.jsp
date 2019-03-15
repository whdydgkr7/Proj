<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<title>회원가입</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<div class="container">
<br>
<br />
<hr>
<script type="text/javascript">
function inputValidate(f) {
	
	if (!f.id.value) {
		alert("아이디를 입력 해 주세요.");
		f.id.focus();
		return false;
	}
	
	if (!f.name.value) {
		alert("닉네임을 입력 해 주세요.");
		f.name.focus();
		return false;
	}
	if (!f.email.value) {
		alert("이메일을 입력 해 주세요.");
		f.email.focus();
		return false;
	}
	if (!f.pass.value) {
		alert("비밀번호를 입력 해 주세요.");
		f.pass.focus();
		return false;
	}
	if (f.pass2.value!=f.pass.value) {
		alert("비밀번호 입력을 확인 해 주세요.");
		f.pass.value="";
		f.pass2.value="";
		f.pass.focus();
		return false;
	}
}

function checkInputId(param) {
	
	var idLen=param.length;
	var idFLA=(param.toUpperCase()).charCodeAt(0);
	
	//A의 아스키코드 65, Z의 아스키 코드 90
	if(!(idFLA>=65 && idFLA<=90)) {
		alert("아이디는 반드시 영문으로 시작해야 합니다");
		regiFrm.id.focus();
		return false;
	}
	else if(idLen>12 || idLen<2) {
		alert("아이디는 8~12자 이내여야 합니다");
		regiFrm.id.focus();
		return false;
	}
	else if(!isAlphaNumber(param)) {
		alert("영문과 숫자의 조합으로만 구성해야 합니다");
		regiFrm.id.focus();
		return false;
	}
	return true;
}
</script>

<script type="text/javascript">
function isAlphaNumber(param){
	var idFLA=param.toUpperCase();
	for (var i = 0; i < idFLA.length; i++) {
		var aCode=idFLA[i].charCodeAt(0);
		if ( !((aCode>=65 && aCode<=90) || (aCode>=48 && aCode<=57))) return false;
	}
	return true;
}
      
function idOverlap() {
  	if (regiFrm.id.value=="") {
  		alert("아이디를 입력 후 중복확인을 누르삼");
  		regiFrm.id.focus();
  	}
  	
  	else if(checkInputId(f.id.value)==false){
  		alert("아이디를 입력 해 주세요.");
  		regiFrm.id.focus();
  		return false;
  	}
  	else{
  		$.ajax({
  			url: "idCheck.do",
  			type: "post",
  			data: {
  				id: $("#id").val()
  			},
  			contentType: "application/x-www-form-urlencoded;charset:utf-8",
  			dataType: "text",
  			success: function(responseData) {
  				if (responseData=="true") {
  					alert("사용 가능한 아이디입니다.");
      				regiFrm.id.readOnly = true;
				}
  				else{
  					alert("중복 된 아이디입니다.\n 다시 입력 해 주세요.");
  					regiFrm.id.value="";
  					regiFrm.id.focus();
  				}
  			},	
  			error: function(errorData) {
  				alert("오류발생:"+errorData.status+": "+errorData.statusText);
  			}
  		});
  	}
}
</script>
<div class="card bg-light">
<article class="card-body mx-auto" style="max-width: 400px;">
	<h4 class="card-title mt-3 text-center">회원가입</h4>
	<p class="text-center">Volume 과 함께 해요</p>
	<hr />
	<p class="text-center">
		<a href=""><img src="./resources/images/login_google.png" alt="" style="width: 100%;"/></a><br />
		<a href=""><img src="./resources/images/login_kakao.png" alt="" style="width: 100%;"/></a><br />
		<a href="naverLogin"><img src="./resources/images/login_naver.png" alt="" style="width: 100%;"/></a>
	</p>
	<hr />
	<p class="divider-text" style="text-align: center;">
	       <span class="bg-light">또는</span>
	</p>
	<hr />
	<form action="registerAction" onsubmit="return inputValidate(this);" method="post" name="regiFrm">
	<input type="hidden" id="hidden1" name="hidden1"/>
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input id="id" name="id" class="form-control" placeholder="2~12자 내의 영문" type="text">

        <input class="btn btn-danger" type="button" value="아이디 중복체크" style="max-width: 150px;" onclick="idOverlap();">
    </div> <!-- form-group// -->
    <div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input name="name" class="form-control" placeholder="닉네임입력" type="text">
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
		 </div>
        <input name="email" class="form-control" placeholder="이메일주소 입력" type="email">
        <script type="text/javascript">
        function checkemailaddy(){
            if (regiFrm.email_select.value == 'custom') {
            	regiFrm.email_select.style.display = 'none';
            }
            else if (regiFrm.hidden1.value==""){
            	regiFrm.hidden1.value=regiFrm.email.value;
            	regiFrm.email.value=regiFrm.email.value+regiFrm.email_select.value;
            }
            else{
            	regiFrm.email.value=regiFrm.hidden1.value+regiFrm.email_select.value;
            }
        }
        </script>
        <select class="custom-select" name="email_select" id="email_select" style="max-width: 200px;" onchange="checkemailaddy();">
		    <option selected="selected" value="">-선택하세요-</option>
		    <option value="@naver.com">naver.com</option>
		    <option value="@gmail.com">gmail.com</option>
		    <option value="@daum.net">daum.net</option>
		    <option value="@nate.com">nate.com</option>
		    <option value="custom">직접 입력하기</option>
		</select>
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input class="form-control" placeholder="비밀번호 입력" type="password" name="pass">
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input class="form-control" placeholder="비밀번호 재입력" type="password" name="pass2">
    </div> <!-- form-group// -->                                      
    <div class="form-group">
        <button type="submit" class="btn btn-primary btn-block"> 회원 가입  </button>
    </div> <!-- form-group// -->      
    <hr />
    <p class="text-center">이미 계정이 있으신가요? <a href="login">로그인 하러가기</a> </p>                                                                 
</form>
</article>
</div> <!-- card.// -->

</div> 
<!--container end.//-->