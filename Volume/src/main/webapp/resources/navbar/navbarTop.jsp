<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="w3">
  <div class="w3-bar w3-lime w3-card w3-center-align w3-large">
    <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="/Volume" class="w3-bar-item w3-button w3-padding-large w3-white" style="z-index:3;width:300px;font-weight:bold;">HOME(VOLUME)</a>
    <a href="ProjectController.do" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" style="z-index:3;width:300px;font-weight:bold;">PROJECT</a>
    <a href="BeforeApproval.do" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" style="z-index:3;width:300px;font-weight:bold;">PROJECT(승인전)</a>
    <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" style="z-index:3;width:300px;font-weight:bold;">PROPOSAL</a>
    <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" style="z-index:3;width:300px;font-weight:bold;">REVIEW</a>
    <!-- <a href="login" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" style="z-index:3;width:280px;font-weight:bold;">LOGIN</a> -->
  </div>

  <!-- Navbar on small screens -->
  <div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large">
    <a href="ProjectController.do" class="w3-bar-item w3-button w3-padding-large">PROJECT</a>
    <a href="BeforeApproval.do" class="w3-bar-item w3-button w3-padding-large">PROJECT(승인전)</a>
    <a href="#" class="w3-bar-item w3-button w3-padding-large">EXCHANGE</a>
    <a href="#" class="w3-bar-item w3-button w3-padding-large">REVIEW</a>
  </div>
</div>
