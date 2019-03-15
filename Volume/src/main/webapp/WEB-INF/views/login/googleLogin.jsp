<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="727891470099-ibar4c1mhvf5564uraeoeh9o8itf3i10.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
</head>
<script type="text/javascript">
window.onload=function(){
	location.href='${google_url}';
}
</script>
<body>
<%--     <a href="${google_url}"><button id="btnJoinGoogle" class="btn btn-primary btn-round"
        style="width: 100%">
        <i class="fa fa-google" aria-hidden="true"></i>Google Login
    </button></a>  --%>
</body>
</html>