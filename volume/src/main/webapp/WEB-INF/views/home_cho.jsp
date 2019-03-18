<%@page import="org.springframework.web.bind.annotation.SessionAttribute"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>메인페이지</title>
	<li><a href="login" target="_blank">로그인페이지</a></li>
	<li><a href="register" target="_blank">회원가입페이지</a></li>
	<li><a href="naverLogin" target="_blank">네이버 로그인 확인</a></li>
	<li><a href="googleLogin" target="_blank">구글 로그인 확인</a></li>
	<li><a href="https://kauth.kakao.com/oauth/authorize?client_id=b311350538692c9393bb8d785b0a0ef8&redirect_uri=http://localhost:8080/volume/oauth&response_type=code" target="_blank">카카오 로그인 확인</a></li>
</head>
<body>
${login.id } <br />
${login.name } <br />
${login.email } <br />

${sessionScope.token} <br />
님 환영해요.
<br />
<a href = "/api/logout/">카카오 로그아웃</a><br>
</body>
</html>