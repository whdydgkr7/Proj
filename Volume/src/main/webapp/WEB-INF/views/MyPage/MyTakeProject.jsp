<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>MyInformodifi.jsp</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif}
.w3-bar,h1,button {font-family: "Montserrat", sans-serif}
.fa-anchor,.fa-coffee {font-size:200px}
button{
  background:#CDDB39;
  color:black;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}

 html,body{
background-color:#F2F3F2;
 }
</style>

</head>
<body>

	<h1 class="w3-text-BLACK" style="font-weight:bold;">내가 참여한 프로젝트</h1>
		<div class="w3-row">
			<!-- 검색, 셀렉트박스 들어갔던 자리 -->
		
		  	<table class="table table-success"style="width:90%; margin:10px;">
				  <thead class="w3-lime">
				    <th>이미지</th>
				    <th>프로젝트시작일</th> 
				    <th>프로젝트마감일</th>
				    <th>프로젝트명</th>
				    <th>프로젝트 내용</th>	
				   	<th>추천수</th>	 				    
				    <th>조회수</th>					    
				    <th>작성일</th>
				    <th>첨부파일</th>
				  </thead>
				 <tbody id="ajaxProj">
					<!-- c:choose문 들어갔던 자리 -->
		       	</tbody>
			</table>
			<!-- 페이징 처리 부분 -->
		</div>

</body>
</html>