<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트 스킨</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<div class="w3-container">	
	<div class="row">
		<!-- Top영역(GNB영역 : Global Navigation Bar) -->
		<jsp:include page="/resources/navbar/navbarTop.jsp"></jsp:include>
		<!-- Top영역(GNB영역 : Global Navigation Bar) -->		
	</div>
	<div class="row">
		<div class="col-xs-3 col-lg-3">
			<!-- Left메뉴부분(LNB영역 : Local Navigation Bar) -->
			<%-- <jsp:include page="/resources/BoardSkin/commonLeft.jsp"></jsp:include> --%>
			<!-- Left메뉴부분(LNB영역 : Local Navigation Bar) -->
		</div>
		<div class="col-xs-9 col-lg-9">
			<!-- Contents부분 -->
<h3>EXCHANGE</h3>

<div class="row text-right" style="margin-bottom:20px;
		padding-right:50px;">
<!-- 검색부분 -->
<form class="form-inline">	
	<div class="form-group">
		<select name="keyField" class="form-control">
			<option value="title">제목</option>
			<option value="name">작성자</option>
			<option value="contents">내용</option>
		</select>
	</div>
	<div class="input-group">
		<input type="text" name="keyString"  class="form-control"/>
		<div class="input-group-btn">
			<button type="submit" class="btn btn-default">
				<i class="glyphicon glyphicon-search"></i>
			</button>
		</div>
	</div>
</form>	
</div>
<div class="row">
	<!-- 게시판리스트부분 -->
	<table class="table table-bordered table-hover table-striped" >
	<colgroup>
		<col width="80px"/>
		<col width="*"/>
		<col width="120px"/>
		<col width="120px"/>
		<col width="80px"/>
		<col width="50px"/>
	</colgroup>
	
	<thead>
	<tr class="success">
		<th class="text-center">번호</th>
		<th class="text-center">이미지</th>
		<th class="text-left">제목</th>
		<th class="text-center">작성자</th>
		<th class="text-center">작성일</th>
		<th class="text-center">조회수</th>
		<!-- <th class="text-center">첨부</th> -->
	</tr>
	</thead>
	
	<tbody>
<c:choose>
	<c:when test="${empty lists }">
		<tr>
			<td colspan="6" class=""text-center">
				등록된 게시물이 없습니다 ^^*
			</td>
		</tr>
	</c:when>
	<c:otherwise>
		<c:forEach items="${lists }" var="row" varStatus="loop">
	<!-- 리스트반복 -->
		<tr>
			<td class="text-center">${row.idx }</td>
			<td class="text-center">${row.thumbnail }</td>
			<td class="text-left">
				<a href="./Exchangeview.do?idx=${row.idx }&nowPage=${nowPage}">${row.title }</a>
			</td>
			<td class="text-center">${row.id }</td>
			<td class="text-center">${row.postdate }</td>
			<td class="text-center">${row.visit_count }</td>
			<!-- <td class="text-center"><i class="glyphicon glyphicon-hdd"></i></td> -->
		</tr>
	
		</c:forEach>
	</c:otherwise>
</c:choose>
	</tbody>
	</table>
</div>
<div class="row text-right" style="padding-right:50px;">
	<!-- 각종 버튼 부분 -->
	<!-- <button type="reset" class="btn">Reset</button> -->
		
	<!-- <button type="button" class="btn btn-default" 
		onclick="location.href='write.do';">글쓰기</button>	 -->			

</div>
<div class="row text-center">
	<!-- 페이지번호 부분 -->
	<ul class="pagination">	
		${pagingImg }
	</ul>	
</div>			
			<!-- Contents부분 -->
		</div>
	</div>
	<div class="row">
		<!-- Bottom영역(Copyright정보) -->
		<%-- <jsp:include page="/resources/BoardSkin/commonBottom.jsp"></jsp:include> --%>
		<!-- Bottom영역(Copyright정보) -->
	</div>
</div>
</body>
</html>
