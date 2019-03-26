<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<script type="text/javascript">
window.onload=function msg(){
	if('${loginCheck }'=='false'){
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
  <c:choose>
  	<c:when test="${empty login}">
  		<hr />
  		<fieldset>
  		<legend>로그인</legend>
		<p id="msg" class="text-center">Volume 과 함께 해요</p>
	  	<form action="loginAction" onsubmit="return inputValidate(this);" method="post" name="regiFrm">
	  	<input type="hidden" name="backUrl" value="${param.backUrl }"/>
			<div class="input-group-prepend">
			    <span class="input-group-text"> <i class="fa fa-user"> 아이디</i></span>
	        	<input name="id" class="form-control" placeholder="아이디입력" type="text">
			</div><br />
	    	<div class="input-group-prepend">
			    <span class="input-group-text"> <i class="fa fa-lock"> 비밀번호</i></span>
			</div>
	        <input class="form-control" placeholder="비밀번호 입력" type="password" name="pass">
	        <br />
		    <div class="form-group">
			  <button class="w3-button w3-lime w3-small" type="submit" >로그인</button>&nbsp;
			  <button class="w3-button w3-orange w3-small" type="button">ID 찾기</button>&nbsp;
			  <button class="w3-button w3-green w3-small" type="button">PW 찾기</button>
		    </div>                           
		</form>
		</fieldset><br />
		<fieldset>
       		<legend>또는</legend>
			<p class="text-center"> 
				<a href="googleLogin"><img src="./resources/images/login_google.png" class="rounded" alt="" style="width: 100%;"/></a>
				<a href="https://kauth.kakao.com/oauth/authorize?client_id=b311350538692c9393bb8d785b0a0ef8&redirect_uri=http://localhost:8080/Volume/oauth&response_type=code"><img src="./resources/images/login_kakao.png" class="rounded" alt="" style="width: 100%;"/></a>
				<a href="naverLogin"><img src="./resources/images/login_naver.png" class="rounded" alt="" style="width: 100%;"/></a>
			</p>
			<hr />
			<p class="text-center">아직 계정이 없으신가요?<br /><a href="register" style="color: blue; font-weight: bold;">회원가입 하러가기</a> </p> 
		</fieldset>
		
  	</c:when>
  	<c:otherwise>
  		  <h2>About Me</h2>
		  <h5>Photo of me:</h5>
		  <div class="fakeimg">Fake Image</div>
		  <p>Some text about me in culpa qui officia deserunt mollit anim..</p>
		  <h3>Some Links</h3>
		  <p>Lorem ipsum dolor sit ame.</p>
		  <ul class="nav nav-pills flex-column">
		    <li class="nav-item">
		      <a class="nav-link active" href="#">Active</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="#">Link</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="#">Link</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link disabled" href="#">Disabled</a>
		    </li>
		  </ul>
		  <hr class="d-sm-none">
  	</c:otherwise>
  </c:choose>