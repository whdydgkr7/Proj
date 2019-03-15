<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardViewSkin.jsp</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">	
	<div class="row">
		<!-- Top영역(GNB영역 : Global Navigation Bar) -->
		<%-- <jsp:include page="/resources/BoardSkin/commonTop.jsp"></jsp:include> --%>
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
<h3>게시판 상세보기 - 
	<small>이런저런 기능이 있는 게시판입니다.</small></h3>
 
<form enctype="multipart/form-data">
<table class="table table-bordered">
<colgroup>
	<col width="20%"/>
	<col width="30%"/>
	<col width="20%"/>
	<col width="*"/>
</colgroup>
<tbody>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">작성자</th>
		<td>
			${viewRow.name }
		</td>
		<th class="text-center" 
			style="vertical-align:middle;">작성일</th>
		<td>
			${viewRow.postdate }
		</td>
	</tr>
	<tr>
		<!-- <th class="text-center" 
			style="vertical-align:middle;">이메일</th>
		<td>
			nakjasabal@naver.com
		</td> -->
		<th class="text-center" 
			style="vertical-align:middle;">조회수</th>
		<td>
			${viewRow.hits }
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">제목</th>
		<td colspan="3">
			${viewRow.title }
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">내용</th>
		<td colspan="3">
			${viewRow.contents }
		</td>
	</tr>
	<!-- <tr>
		<th class="text-center" 
			style="vertical-align:middle;">첨부파일</th>
		<td colspan="3">
			파일명.jpg
		</td>
	</tr> -->
</tbody>
</table>

<div class="row text-center" style="">
	<!-- 각종 버튼 부분 -->
			
	<button type="button" class="btn btn-info"onclick="location.href='reply.do?idx=${viewRow.idx}&nowPage=${nowPage }';">답글쓰기</button>
	<button type="button" class="btn btn-primary"onclick="location.href='password.do?idx=${viewRow.idx}&mode=modify&nowPage=${nowPage }';">수정하기</button>
	<button type="button" class="btn btn-success"onclick="location.href='password.do?idx=${viewRow.idx}&mode=delete&nowPage=${nowPage }';">삭제하기</button>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="button" class="btn btn-warning"onclick="location.href='list.do?&nowPage=${param.nowPage }';">리스트보기</button>
	
</div>
</form> 
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