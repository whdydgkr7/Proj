<%@page import="java.util.ArrayList"%>
<%@page import="model.ProjectBbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style>
body, h1, h2, h3, h4, h5, h6 {
   font-family: "Lato", sans-serif
}

.w3-bar, h1, button {
   font-family: "Montserrat", sans-serif
}

.fa-anchor, .fa-coffee {
   font-size: 200px
}

button {
   background: #CDDB39;
   color: black;
   border: none;
   position: relative;
   height: 60px;
   font-size: 1.6em;
   padding: 0 2em;
   cursor: pointer;
   transition: 800ms ease all;
   outline: none;
}

button:hover {
   background: #fff;
   color: #1AAB8A;
}

button:before, #proposal:after {
   content: '';
   position: absolute;
   top: 0;
   right: 0;
   height: 2px;
   width: 0;
   background: #1AAB8A;
   transition: 400ms ease all;
}

button:after {
   right: inherit;
   top: inherit;
   left: 0;
   bottom: 0;
}

button:hover:before, button:hover:after {
   width: 100%;
   transition: 800ms ease all;
}

html, body {
   background-color: #F2F3F2;
}
</style>
<jsp:include page="/resources/navbar/navbarTop.jsp" />
<body>
   <div>


      <!-- First Grid -->
      <div class="w3-row-padding w3-padding-64 w3-container-fluid "
         style="height: 1500px;">
         <h1 class="w3-text-BLACK" style="font-weight: bold;">승인 대기중인
            PROjECT</h1>
         <div class="w3-row">
            <form class="form-inline" name="searchFrm"
               onsubmit="return searchValidate(this);">
               <div class="form-group">
                  <select name="keyField" style="height: 50px;"
                     class="form-control">
					 <option value="title">제목</option>
					 <option value="id">작성자</option>
                     <option value="content">내용</option>
                  </select>
               </div>


               <div class="input-group">
                  <input type="text" name="keyString" style="height: 50px;"
                     class="form-control" />
                  <div class="input-group-btn">
                     <button type="submit"
                        style="height: 50px; width: 50px; border-radius: 15px;"
                        onclick="location.href='ProjectBbsWriteController.do';">
                        <i class="glyphicon glyphicon-search"
                           style="font-size: 18px; font-weight: bold;"></i>
                     </button>
                  </div>


               </div>
               <div class="input-group" style="margin-left: 50px;">
                  <div class="input-group-btn">
                     <button type="button"
                        style="height: 50px; width: 200px; border-radius: 15px;"
                        onclick="location.href='BeforeApprovalWriteController.do';">
                        <i class="glyphicon glyphicon-pencil"
                           style="font-size: 18px; font-weight: bold;">제안하기</i>
                     </button>
                  </div>
               </div>
            </form>

            <table class="table table-success" style="width: 90%; margin: 10px; ">
               <thead class="w3-lime">
                  <th>이미지</th>
                  <th>프로젝트시작일</th>
                  <th>프로젝트마감일</th>
                  <th>프로젝트명</th>
                  <th>프로젝트 내용</th>
                  <th>추천수</th>
                  <th>조회수</th>
                  <th>작성일</th>
                  <th>작성자(아이디)</th>
               </thead>
               <tbody style="vertical-align: middle;">
                  <c:choose>
                     <c:when test="${empty lists }">
                        <tr>
                           <td colspan="8" class="text-center">등록된 프로젝트가 없습니다.</td>
                        </tr>
                     </c:when>
                     <c:otherwise>
                        <c:forEach items="${lists }" var="row" varStatus="loop">
                           <!-- 리스트반복시작 -->
 
                              
                                 <c:choose>
                                    <c:when test="${not empty row.thumbnail }"> 
                                    <td class="text-center" style="vertical-align: middle;"> 
                                       <img src="./resources/18/${row.thumbnail}"  width="200" height="200">
                         </td>   
                                    </c:when>
                                    <c:otherwise>   
                                    <td class="text-center">
                                       <img src="./resources/images/defaultimage.jpg" width="200" height="200">
                                    </td>
                                    </c:otherwise>      
                                 </c:choose>          
                           
                              <td class="text-center">${fn:substring(row.start_date,0,11)}</td>
                              <td class="text-center">${fn:substring(row.end_date,0,11)}</td>
                              <td class="text-center"><a
                                 href="./BeforeApprovalViewController.do?idx=${row.idx}">
                                    ${row.title}</a></td>
                              <td class="text-left"><a
                                 href="./BeforeApprovalViewController.do?idx=${row.idx}">${fn:substring(row.content,0,50)}</a>
                              </td>
                              <td class="text-center">${row.recommend }</td>
                              <td class="text-center">${row.visit_count }</td>
                              <td class="text-center">${fn:substring(row.postdate,0,11)}</td>
                              <td class="text-center">${row.id}</td>


                           </tr>
                           <!-- 리스트반복끝 -->
                        </c:forEach>
                     </c:otherwise>
                  </c:choose>
               </tbody>
            </table>
            <div class="row text-center">
               <!-- 페이지번호 부분 -->
               <ul class="pagination">${pagingImg }
               </ul>
            </div>
         </div>
      </div>
   </div>
   </div>
   <jsp:include page="/resources/navbar/footer.jsp" />



</body>
</html>