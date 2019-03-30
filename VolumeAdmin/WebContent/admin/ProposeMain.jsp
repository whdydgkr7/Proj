<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en">
<title>프로젝트 제안하기</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1}
</style>
<body>
<script src="../common/js/paging.js"></script>
<script type="text/javascript">
if('${sessionScope.authority}'!='ADMIN'){
	alert("관리자 페이지입니다.\n관리자라면 로그인 후 이용 해 주세요.");
	location.href='../index.jsp';
}
window.onload=function() {
	$.ajax({
		url: "../admin/ProposeCtrl.do",
		type: "get",
		data: {
			menu: "view"
		},
		dataType: "json",
		contentType: "text/html;charset:utf-8;",
		success: function(responseData) {
			var idx= 0;
			var str="";
			str+="<thead>";
				str+="<tr class='info'>";
					str+="<th class='text-center'>선택</th>";
					str+="<th class='text-center'>추천수</th>";
					/* <th class='text-center'>순번</th> */
					str+="<th class='text-center'>작성자</th>";
					str+="<th class='text-center'>제목</th>";
					/* <th class="text-center">내용</th> */
					str+="<th class='text-center'>등록일</th>";
					/* <th class="text-center">조회수</th> */
					str+="<th class='text-center'>시작일</th>";
					str+="<th class='text-center'>종료일</th>";
					str+="<th class='text-center'>인원제한</th>";
					/* <th class="text-center">썸네일파일</th>
					<th class="text-center">첨부파일</th>
					<th class="text-center">주소</th> */
				str+="</tr>";
			str+="</thead>";
			str+"<tbody>";
			$.each(responseData, function(index, data) {
				
				idx= data.idx;
				str+="<tr onclick='pBbsClicked();' style='background-color:white;' onmouseover=\"this.style.backgroundColor='#ffb0a5';\" onmouseout=\"this.style.backgroundColor='white';\">";
				str+="<td class='text-center'><input type='radio' name='pBBS' value='"+data.idx+"' onclick='FselectpBBS("+data.idx+");'/></td>";
				str+="<td class='text-center'>"+data.recommend+"</td>";
				//str+="<td class='text-center'>"+data.propose_idx+"</td>";
				str+="<td class='text-center'>"+data.id+"</td>";
				str+="<td class='text-center'>"+data.title+"</td>";
				//str+="<td class='text-center'>"+data.content+"</td>";
				str+="<td class='text-center'>"+data.postdate+"</td>";
				//str+="<td class='text-center'>"+data.visit_count+"</td>";
				str+="<td class='text-center'>"+data.start_date+"</td>";
				str+="<td class='text-center'>"+data.end_date+"</td>";
				str+="<td class='text-center'>"+data.m_limit+"</td>";
				str+="</tr>";
			});
			str+="</tbody>";
			$("#ajaxTable").html(str);
			page();
		},
		error: function(e) {
			alert("오류발생:"+e.status+":"+e.statusText);
		}
	});
}
function FselectpBBS(param) {
	document.getElementById("selectpBBS").value=param;
}
function pBbsClicked() {
	//$("input:radio[name='pBBS']:radio[value='"++"']").prop('checked', true); 
}
function submitPropose() {
	var select=document.getElementById("selectpBBS").value
	if (select=="" || select==null){
		alert("승인할 항목을 선택 해 주세요.");
		return;
	}
	$.ajax({
		url: "../admin/ProposeCtrl.do",
		type: "get",
		data: {
			idx: $("#selectpBBS").val(),
			menu: "submit"
		},
		dataType: "text",
		contentType: "text/html;charset:utf-8;",
		success: function(responseData) {
			alert(responseData);
			document.location.reload();
		},
		error: function(e) {
			alert("오류발생:"+e.status+":"+e.statusText);
		}
	});
}
function refusePropose() {
	var select=document.getElementById("selectpBBS").value
	if (select=="" || select==null){
		alert("거절할 항목을 선택 해 주세요.");
		return;
	}
	$.ajax({
		url: "../admin/ProposeCtrl.do",
		type: "get",
		data: {
			idx: $("#selectpBBS").val(),
			menu: "refuse"
		},
		dataType: "text",
		contentType: "text/html;charset:utf-8;",
		success: function(responseData) {
			alert(responseData);
			document.location.reload();
		},
		error: function(e) {
			alert("오류발생:"+e.status+":"+e.statusText);
		}
	});
}
</script>
<!-- Sidebar/menu -->
<jsp:include page="../common/commonBar.jsp"></jsp:include>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:340px;margin-right:40px">

	  <!-- Header -->
	  <div class="w3-container" style="margin-top:80px;" id="uManagement">
	    <h1 class="w3-xxxlarge w3-text-red"><b>프로젝트 제안 관리</b></h1>
	    <hr style="width:50px;border:5px solid red" class="w3-round">
		<div class="container">
		    <form name="updateInfo" target="parentForm">
		    <input type="hidden" id="selectpBBS"/>        
			<div class="row">
				<h2 style="text-align:center;">프로젝트 제안(<span style="color:red;">추천 수 - 30▲</span>)</h2>
				<table class="table table-striped table-bordered table-hover paginated" id="ajaxTable"></table>
			</div>
		        <button type="button" class="btn btn-success" onclick="submitPropose();">선택 제안 승인</button>
		        <button type="button" class="btn btn-danger" onclick="refusePropose();">선택 제안 거절</button>
			</form>
		</div>
	</div>
</div>

<!-- W3.CSS Container -->
<jsp:include page="../common/commonBottom.jsp"></jsp:include>
</body>
</html>





<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 제안하기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
window.onload=function() {
	$.ajax({
		url: "../admin/ProposeCtrl.do",
		type: "get",
		data: {
			menu: "view"
		},
		dataType: "json",
		contentType: "text/html;charset:utf-8;",
		success: function(responseData) {
			var str="";
			$.each(responseData, function(index, data) {
				str+="<tr onclick='pBbsClicked();' style='background-color:white;' onmouseover=\"this.style.backgroundColor='#ffb0a5';\" onmouseout=\"this.style.backgroundColor='white';\">";
				str+="<td class='text-center'><input type='radio' name='pBBS' value='"+data.propose_idx+"' onClick='FselectpBBS(this.value);'/></td>";
				str+="<td class='text-center'>"+data.recommend+"</td>";
				//str+="<td class='text-center'>"+data.propose_idx+"</td>";
				str+="<td class='text-center'>"+data.id+"</td>";
				str+="<td class='text-center'>"+data.title+"</td>";
				//str+="<td class='text-center'>"+data.content+"</td>";
				str+="<td class='text-center'>"+data.postdate+"</td>";
				//str+="<td class='text-center'>"+data.visit_count+"</td>";
				str+="<td class='text-center'>"+data.start_date+"</td>";
				str+="<td class='text-center'>"+data.end_date+"</td>";
				str+="<td class='text-center'>"+data.p_limit+"</td>";
				//str+="<td class='text-center'>"+data.thumbnail+"</td>";
				//str+="<td class='text-center'>"+data.attachedfile+"</td>";
				//str+="<td class='text-center'>"+data.address+"</td>";
				str+="</tr>";
			});
			$("#ajaxTablePropose").html(str);
		},
		error: function(e) {
			alert("오류발생:"+e.status+":"+e.statusText);
		}
	});
}
function FselectpBBS(param) {
	document.getElementById("selectpBBS").value=param;
}
function pBbsClicked() {
	//$("input:radio[name='pBBS']:radio[value='"++"']").prop('checked', true); 
}
function submitPropose() {
	$.ajax({
		url: "../admin/ProposeCtrl.do",
		type: "get",
		data: {
			propose_idx: $("#selectpBBS").val(),
			menu: "submit"
		},
		dataType: "text",
		contentType: "text/html;charset:utf-8;",
		success: function(responseData) {
			alert(responseData);
			document.location.reload();
		},
		error: function(e) {
			alert("오류발생:"+e.status+":"+e.statusText);
		}
	});
}
function refusePropose() {
	$.ajax({
		url: "../admin/ProposeCtrl.do",
		type: "get",
		data: {
			propose_idx: $("#selectpBBS").val(),
			menu: "refuse"
		},
		dataType: "text",
		contentType: "text/html;charset:utf-8;",
		success: function(responseData) {
			alert(responseData);
			document.location.reload();
		},
		error: function(e) {
			alert("오류발생:"+e.status+":"+e.statusText);
		}
	});
}
</script>
</head>
<body>
<div class="container">
    <form name="updateInfo" target="parentForm">
    <input type="hidden" id="selectpBBS" />        
	<div class="row">
		<h2 style="text-align:center;">프로젝트 제안(<span style="color:red;">추천 수 - 30▲</span>)</h2>
		<table class="table table-striped table-bordered table-hover">
			<thead>
			<tr class="info">
				<th class="text-center">선택</th>
				<th class="text-center">추천수</th>
				<!-- <th class="text-center">순번</th> -->
				<th class="text-center">작성자</th>
				<th class="text-center">제목</th>
				<!-- <th class="text-center">내용</th> -->
				<th class="text-center">등록일</th>
				<!-- <th class="text-center">조회수</th> -->
				<th class="text-center">시작일</th>
				<th class="text-center">종료일</th>
				<th class="text-center">인원제한</th>
				<!-- <th class="text-center">썸네일파일</th>
				<th class="text-center">첨부파일</th>
				<th class="text-center">주소</th> -->
			</tr>
			</thead>
			<tbody id="ajaxTablePropose"></tbody>
		</table>
	</div>
        <button type="button" class="btn btn-success" onclick="submitPropose();">선택 제안 승인</button>
        <button type="button" class="btn btn-danger" onclick="refusePropose();">선택 제안 거절</button>
	</form>
</div>
</body>
</html> --%>