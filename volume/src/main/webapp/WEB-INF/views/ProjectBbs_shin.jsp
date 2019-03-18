<%@page import="model.ProjectBbsDTO"%>
<%@page import="java.util.ArrayList"%>
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
</style>
<body>


	<div class="w3-row">
		<img src="./resources/images/10.jpg" alt="" />
	</div>
	<jsp:include page="/resources/navbar/navbarTop.jsp" />
<!-- First Grid -->
<div class="w3-row-padding w3-padding-64 w3-container-fluid " style="height: 900px; ">
		<h1 class="w3-text-lime" style="font-weight:bold;">PROjECT</h1>
		<small>전체페이지:${totalPage } / 현재페이지:${nowPage }</small></h3>
		<div class="w3-row">
			  <div class="w3-col s8 w3">
					  <form class="form-inline" name="searchFrm" onsubmit="return searchValidate(this);">
					  
							<div class="form-group">
								<select name="searchColumn" class="form-control">
									<option value="title">프로젝트</option>
									<option value="name">작성자</option>
									<option value="content">내용</option>
								</select>
							</div>
							<div class="input-group">
								<input type="text" name="searchWord" class="form-control"/>
								<div class="input-group-btn">
									<button type="submit" class="btn btn-success">
										<i class="glyphicon glyphicon-search"></i>
									</button>
								</div>
							</div>
					  </form>			  
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
					  <%
					  ArrayList<ProjectBbsDTO> list= new ArrayList<ProjectBbsDTO>();
					  
					  %>
					  <div></div>
					 <tbody>
						<c:choose>
							<c:when test="${empty lists }">
								<tr>
									<td colspan="8" class="text-center">
										등록된 프로젝트가 없습니다.
									</td>
									
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${lists }" var="row" varStatus="loop">
									<!-- 리스트반복시작 -->
									<tr >
										<td class="text-center">${row.thumbnail }</td>
										<td class="text-center">${row.start_date }</td>
										<td class="text-center">${row.end_date }</td>
										<td class="text-center">
										<%-- <a href="./view.do?idx=${row.idx}
												&nowPage=${nowPage}"> --%>
											${row.title}</td>
										<td class="text-left">
											<%-- <a href="./view.do?idx=${row.idx}
												&nowPage=${nowPage}"> --%>${row.content}</a>
										</td>
										<td class="text-center">${row.rec_count }</td>
										<td class="text-center">${row.visit_count }</td>
										<td class="text-center">${row.postdate }</td>
										<td class="text-center"> 			
											<c:if test="${not empty row.attachedfile }">
												<span class="glyphicon glyphicon-paperclip"></span>					
											</c:if>
										</td>
										
									</tr>
									<!-- 리스트반복끝 -->
								</c:forEach>
							</c:otherwise>
						</c:choose>
			       </tbody>
				</table>
					<div class="row text-center">
					<!-- 페이지번호 부분 -->
					<ul class="pagination">	
						${pagingImg }
					</ul>	
					</div>	
			</div>
			  <div class="w3-col s4 23 ">
					<jsp:include page="/resources/fullcalendar/fullcalendar.jsp" />
		</div>
    </div>
</div>




<footer class="w3-container w3-padding-64 w3-center w3-opacity w3-lime">  
  <div class="w3-xlarge w3-padding-32">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
 </div> -->
 <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
</footer>

	


</body>
</html>