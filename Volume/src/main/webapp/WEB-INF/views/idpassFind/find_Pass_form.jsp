<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<div class="container">
<br>
<br />
<hr>
<script type="text/javascript">
	
	//아이디 & 스토어 값 저장하기 위한 변수
	var idV = "";
	//아이디 값 받고 출력하는 ajax

	function passFindclick(){
		 $.ajax({
		    type:"post",
		    url: "passFind.do",
		    data:{
		    	user_email: $('#user_email').val()
		    },
		    dataType: "text",
		 	contentType: "application/x-www-form-urlencoded;charset:utf-8",
		    success: function(data){
		       /* if(!data){
		          $('#id_value').text("회원 정보를 확인해주세요!");
		       } else { */
		          // 아이디값 별도로 저장
		          idV = data;
		       var email = document.getElementById("user_email").value;
		       alert("회원님의 비밀번호는 입력하신 메일로 발송했습니다" );
		       location.href='EmailSend.do?data='+data+"&email="+email;
		       
		    },
		    error: function(e) {
				alert("오류발생:"+e.status+":"+e.statusText);
			}
		 });
	}
	
</script>
<div class="card bg-light">
<article class="card-body mx-auto" style="max-width: 400px;">
	<h4 class="card-title mt-3 text-center">비밀번호 찾기</h4>
	<p id="msg" class="text-center">Volume 과 함께 해요</p>
	<hr />
	<!-- <form action="loginAction" onsubmit="return inputValidate(this);" method="post" name="regiFrm"> -->
	
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
		</div>
        <input class="form-control" placeholder="이메일을 입력해주세요"  name="email" type="text" id="user_email">
    </div> <!-- form-group// -->
    <div class="form-group">
        <button type="button" id=findPass class="btn btn-primary btn-block" onclick='passFindclick();'> 비밀번호 찾기  </button>
        <button type="button" onclick="history.go(-1);" class="btn btn-primary btn-block"> 취소 </button>
    </div> <!-- form-group// -->    
                                                                
<!-- </form> -->
</article>
</div> <!-- card.// -->

</div> 
<!--container end.//-->