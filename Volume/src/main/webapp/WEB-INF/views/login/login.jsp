<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<title>로그인</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

<div class="container">
	<br> <br />
	<hr>
	<script type="text/javascript">
		window.onload = function msg() {
			if ('${loginCheck }' == 'false') {
				alert("아이디 또는 비밀번호가 틀렸습니다.");
				regiFrm.id.focus();
			}
		}

		function inputValidate(f) {
			if (!f.id.value) {
				alert("아이디를 입력 해 주세요.");
				f.id.focus();
				return false;
			}
			if (!f.pass.value) {
				alert("비밀번호를 입력 해 주세요.");
				f.pass.focus();
				return false;
			}
		}
	</script>

	<div style="margin-right: 200px;">
		<jsp:include page="/resources/navbar/sidebar.jsp" />
	</div>

	<div class="card bg-light">
		
		<article class="card-body mx-auto" style="max-width: 400px;">
			<h4 class="card-title mt-3 text-center">로그인</h4>
			<p id="msg" class="text-center">Volume 과 함께 해요</p>
			<hr />
			<form action="loginAction" onsubmit="return inputValidate(this);"
				method="post" name="regiFrm">
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-user"></i>
						</span>
					</div>
					<input name="id" class="form-control" placeholder="아이디입력"
						type="text">
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-lock"></i>
						</span>
					</div>
					<input class="form-control" placeholder="비밀번호 입력" type="password"
						name="pass">
				</div>
				<!-- form-group// -->
				<div class="form-group">
					<button type="submit" class="btn btn-primary btn-block">
						로그인</button>
				</div>
				<!-- form-group// -->

			</form>
			<hr />
			<!-- <form action="findId"> -->
			<p class="divider-text" style="text-align: center;">

				<button type="button" class="btn btn-primary" id="find_id_btn"
					onclick="location.href='findId';">아이디 찾기</button>
				<button type="button" class="btn btn-primary" id="find_pass_btn"
					onclick="location.href='findPass';">비밀번호 찾기</button>
			</p>
			<!--  </form> -->

			<hr />
			<p class="text-center">
				<a href="googleLogin"><img
					src="./resources/images/login_google.png" alt=""
					style="width: 100%;" /></a> <a
					href="https://kauth.kakao.com/oauth/authorize?client_id=b311350538692c9393bb8d785b0a0ef8&redirect_uri=http://localhost:8080/Volume/oauth&response_type=code"><img
					src="./resources/images/login_kakao.png" alt=""
					style="width: 100%;" /></a> <a href="naverLogin"><img
					src="./resources/images/login_naver.png" alt=""
					style="width: 100%;" /></a>
			</p>
			<hr />
			<p class="text-center">
				아직 계정이 없으신가요? <a href="register">회원가입 하러가기</a>
			</p>
		</article>
	</div>
	<!-- card.// -->
	

</div>
<!--container end.//-->