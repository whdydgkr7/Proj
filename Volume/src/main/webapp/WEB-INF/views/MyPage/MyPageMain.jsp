<%@page import="user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<title>W3.CSS Template</title>
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
<script type="text/javascript">
window.onload= function() {
	$.ajax({
			url: "MyPageProjView",
			type: "get",
			data: {
				id: "<%=((UserDTO)(session.getAttribute("login"))).getId() %>"
			},
			contentType: "text/html;charset:utf-8;",
			dataType: "json",
			success: function(responseData) {
				var str="";
				$.each(responseData, function(index, data) {
					str+="<tr id='"+data.id+"' style='background-color:white;' onmouseover=\"this.style.backgroundColor='#ffb0a5';\" onmouseout=\"this.style.backgroundColor='white';\">";
					//str+="<td class='text-center'><input type='radio' name='user' id='"+data.id+"' value='"+data.id+"' onClick='selectAdmin(this.value);'/></td>";
					str+="<td class='text-center'>"+data.idx+"</td>";
					str+="<td class='text-center'>"+data.id+"</td>";
					str+="<td class='text-center'>"+data.title+"</td>";
					str+="<td class='text-center'>"+data.postdate+"</td>";
					str+="<td class='text-center'>"+data.visit_count+"</td>";
					str+="<td class='text-center'>"+data.attachedfile+"</td>";
					str+="<td class='text-center'>"+data.m_limit+"</td>";
					str+="<td class='text-center'>"+data.add_point+"</td>";
					str+="</tr>";
				});
				$("#ajaxProj").html(str);
			},	
			error: function(errorData) {
				alert("오류발생:"+errorData.status+": "+errorData.statusText);
			}
		});
}
</script>

<!-- <script type="text/javascript">
	
	function changeView(value){
		
		if(value == "0"){
			location.href="MyInfo.do";
			
		}
		else if(value == "1"){
			location.href="MyTakeProject.do";
		}
		else if(value == "2"){
			location.href="MyOfferProject.do";
		}
		else if(value == "3"){
			location.href="MyOneDayClass.do";
		}
		else if(value == "4"){
			location.href="MyProjectLatter.do";
		}
	}

</script> -->
<body>
<div>
	<jsp:include page="../../../resources/navbar/navbarTop.jsp" />
	<!-- First Grid -->
	<div class="w3-row-padding w3-padding-64 w3-container-fluid"> <!--  " style="height: 900px;  -->
	
	
	</div>
	
	<div class="container">    
	  <div class="row">
	    
	    <a href="MyInfo.do">
	    <div class="col-sm-4">
	      <div class="panel panel-success">
	        <div class="panel-heading">개인정보 수정하기</div>
	        <div class="panel-body"><img src="../../../resources/images/my1.jpg" class="img-responsive" style="width:100%" alt="Image"></div>
	      </div>
	    </div>
	    </a>
	    
	    <a href="MyTakeProject.do">
	    <div class="col-sm-4"> 
	      <div class="panel panel-success">
	        <div class="panel-heading">내가 참여한 프로젝트</div>
	        <div class="panel-body"><img src="../../../resources/images/my2.jpg" class="img-responsive" style="width:100%" alt="Image"></div>
	      </div>
	    </div>
	    </a>
	    
	    <a href="MyOfferProject.do">
		    <div class="col-sm-4"> 
		      <div class="panel panel-success">
		        <div class="panel-heading">내 프로젝트 제안</div>
		        <div class="panel-body"><img src="../../../resources/images/my3.jpg" class="img-responsive" style="width:100%" alt="Image"></div>
		      </div>
		    </div>
	    </a>
	  
	  </div>
	</div><br>
	
	<div class="container">    
	  <div class="row">
	    <a href="MyOneDayClass.do">
		    <div class="col-sm-4">
		      <div class="panel panel-success">
		        <div class="panel-heading">나의 원데이 클래스</div>
		        <div class="panel-body"><img src="../../../resources/images/my4.jpg" class="img-responsive" style="width:100%" alt="Image"></div>
		      </div>
		    </div>
	    </a>
	    
	     <a href="MyProjectLatter.do">
		    <div class="col-sm-4"> 
		      <div class="panel panel-success">
		        <div class="panel-heading">내가 작성한 후기</div>
		        <div class="panel-body"><img src="../../../resources/images/my5.jpg" class="img-responsive" style="width:100%" alt="Image"></div>
		      </div>
		    </div>
	    </a>
	    
	    <a href="MyInfo.do">
		    <div class="col-sm-4"> 
		      <div class="panel panel-success">
		        <div class="panel-heading">MyPoint</div>
		        <div class="panel-body"><img src="../../../resources/images/my6.jpg" class="img-responsive" style="width:100%" alt="Image"></div>
		      </div>
		    </div>
	    </a>
	  </div>
	</div><br><br>
	
	
	
	
	
	<jsp:include page="../../../resources/navbar/footer.jsp" />
</div>
</body>
</html>