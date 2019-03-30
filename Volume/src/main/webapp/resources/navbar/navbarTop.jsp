<%@page import="user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <style>
       body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif}
      .w3-bar,h1,button {font-family: "Montserrat", sans-serif}
      .fa-anchor,.fa-coffee {font-size:200px}
    </style>
<div class="w3">

       <div class="w3-right w3-bar w3-white">
      <%if(session.getAttribute("login")!=null) { 
         if( !((UserDTO)session.getAttribute("login")).getAuthority().equals("ADMIN")) { %>
            <button type="button" class="w3-white w3-bar-item w3-button" style="z-index:1;width:160;;font-weight:bold;">${login.id }(${login.name }) 님 환영합니다.</button>
   
            
            <button type="button" onclick="location.href='MyPage'" class="w3-bar-item w3-button" style="z-index:2;width:160px;font-weight:bold;">마이페이지</button>
            <button type="button" onclick="location.href='logout'" class="w3-bar-item w3-button" style="z-index:3;width:160px;font-weight:bold;">로그아웃</button>
            <span id="plusfriend-chat-button" data-plusfriend-id="_kxgxbkj" data-title="consult" data-size="small" data-color="yellow" data-shape="pc" data-support-multiple-densities="true"></span>
         <%} else {%>
            <button type="button" onclick="location.href='http://localhost:8080/VolumeAdmin/admin/adminMain.jsp'" class="w3-bar-item w3-button" style="z-index:1;width:150px;font-weight:bold;">관리자페이지</button>
            
         <%} 
      } 
      else{%>
         <button type="button" onclick="location.href='login'" class="w3-bar-item w3-button" style="z-index:1;width:160px;font-weight:bold; margin-left: 1700px;">로그인</button>
         <%}
      if(request.getParameter("logoutMsg")!=null) {%>
      <script type="text/javascript">
         alert('로그아웃 되었습니다.');
      </script>
      <%}%>
      </div>

 
 
  <div class="w3-bar w3-lime w3-card w3-center-align w3-large" >
     
     
    <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-large w3-lime w3-hover-pale-yellow " href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="/Volume" class="w3-bar-item w3-button w3-padding-large w3-lime w3-hover-pale-yellow" style="z-index:1;width:340px;font-weight:bold;">HOME(VOLUME)</a>
    <a href="ProjectController.do" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-lime w3-hover-pale-yellow" style="z-index:2;width:340px;font-weight:bold;">진행중인 프로젝트</a>
    <a href="BeforeApproval.do" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-lime w3-hover-pale-yellow" style="z-index:3;width:340px;font-weight:bold;">프로젝트 제안하기</a>
    <a href="oneDay" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-lime w3-hover-pale-yellow" style="z-index:4;width:340px;font-weight:bold;">원데이 클래스</a>
    <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-lime w3-hover-pale-yellow" style="z-index:5;width:340px;font-weight:bold;">REVIEW</a>

    
  
  </div>

  <!-- Navbar on small screens -->
   <div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large">
    <a href="ProjectController.do" class="w3-bar-item w3-button w3-padding-large">진행중인 프로젝트</a>
    <a href="BeforeApproval.do" class="w3-bar-item w3-button w3-padding-large">프로젝트 제안하기</a>
    <a href="#" class="w3-bar-item w3-button w3-padding-large">원데이 클래스</a>
    <a href="#" class="w3-bar-item w3-button w3-padding-large">REVIEW</a>
  </div>
</div>