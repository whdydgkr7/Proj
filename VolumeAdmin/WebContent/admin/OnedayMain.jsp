<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en">
<title>회원관리</title>
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
$.ajax({
	url: "../admin/OnedayCtrl.do",
	type: "get",
	data: {
		menu: "view"
	},
	dataType: "json",
	contentType: "text/html;charset:utf-8;",
	success: function(responseData) {
		var str="";
			str+="<thead>";
				str+="<tr class='info'>";
				str+="<th class='text-center'>선택</th>";
				str+="<th class='text-center'>신고수</th>";
				str+="<th class='text-center'>게시글번호</th>";
				str+="<th class='text-center'>작성자</th>";
				str+="<th class='text-center'>제목</th>";
				str+="<th class='text-center'>등록일</th>";
				str+="</tr>";
			str+="</thead>";
			str+="<tbody>";
		$.each(responseData, function(index, data) {
			str+="<tr onclick='eBbsClicked();' style='background-color:white;' onmouseover=\"this.style.backgroundColor='#ffb0a5';\" onmouseout=\"this.style.backgroundColor='white';\">";
			str+="<td class='text-center'><input type='radio' name='eBBS' value='"+data.idx+"' onClick='FselecteBBS(this.value);'/></td>";
			str+="<td class='text-center'>"+data.report_count+"</td>";
			str+="<td class='text-center'>"+data.idx+"</td>";
			str+="<td class='text-center'>"+data.id+"</td>";
			str+="<td class='text-center'>"+data.title+"</td>";
			str+="<td class='text-center'>"+data.postdate+"</td>";
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

function deleteOneday() {
	var select=document.getElementById("selecteBBS").value
	if (select=="" || select==null){
		alert("삭제할 항목을 선택 해 주세요.");
		return;
	}
	$.ajax({
		url: "../admin/OnedayCtrl.do",
		type: "get",
		data: {
			idx: $("#selecteBBS").val(),
			menu: "delete"
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

function FselecteBBS(param) {
	document.getElementById("selecteBBS").value=param;
}
function eBbsClicked() {
	//$("input:radio[name='eBBS']:radio[value='"++"']").prop('checked', true); 
}
</script>
<!-- Sidebar/menu -->
<jsp:include page="../common/commonBar.jsp"></jsp:include>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:340px;margin-right:40px">

  <!-- Header -->
  <div class="w3-container" style="margin-top:80px;" id="uManagement">
    <h1 class="w3-xxxlarge w3-text-red"><b>원데이 클래스 관리</b></h1>
    <hr style="width:50px;border:5px solid red" class="w3-round">
	<div class="container">
	    <form name="updateInfo" target="parentForm">
	    <input type="hidden" id="selecteBBS" />        
		<div class="row">
			<h2 style="text-align:center;">원데이 클래스(<span style="color:red;">신고 수 - 50▲</span>)</h2>
			<table class="table table-striped table-bordered table-hover paginated" id="ajaxTable"></table>
		</div>
	        <!-- <button type="button" class="btn btn-success" onclick="submitPropose();">선택 삭제하기</button> -->
	        <button type="button" class="btn btn-danger" onclick="deleteOneday();">선택 삭제하기</button>
		</form>
		<!-- <br /><br />
		<form name="updateInfo2" target="parentForm">
	    <input type="hidden" id="selecteBBS2" />        
		<div class="row">
			<h2 style="text-align:center;">원데이 클래스(<span style="color:red;">거래 사고 접수</span>)</h2>
			<table class="table table-striped table-bordered table-hover">
				<thead>
				<tr class="info">
					<th class="text-center">선택</th>
					<th class="text-center">신고한 사람</th>
					<th class="text-center">게시글번호</th>
					<th class="text-center">판매자</th>
					<th class="text-center">제목</th>
					<th class="text-center">등록일</th>
				</tr>
				</thead>
				<tbody id="ajaxTableOneday"></tbody>
			</table>
		</div>
	        <button type="button" class="btn btn-success" onclick="submitPropose();">진행시키기</button>
	        <button type="button" class="btn btn-danger" onclick="deleteOneday();">삭제하기</button>
		</form> -->
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
<title>원데이 클래스</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$.ajax({
	url: "../admin/OnedayCtrl.do",
	type: "get",
	data: {
		menu: "view"
	},
	dataType: "json",
	contentType: "text/html;charset:utf-8;",
	success: function(responseData) {
		var str="";
		$.each(responseData, function(index, data) {
			str+="<tr onclick='eBbsClicked();' style='background-color:white;' onmouseover=\"this.style.backgroundColor='#ffb0a5';\" onmouseout=\"this.style.backgroundColor='white';\">";
			str+="<td class='text-center'><input type='radio' name='eBBS' value='"+data.idx+"' onClick='FselecteBBS(this.value);'/></td>";
			str+="<td class='text-center'>"+data.report_count+"</td>";
			str+="<td class='text-center'>"+data.idx+"</td>";
			str+="<td class='text-center'>"+data.id+"</td>";
			str+="<td class='text-center'>"+data.title+"</td>";
			str+="<td class='text-center'>"+data.postdate+"</td>";
			str+="</tr>";
		});
		$("#ajaxTableOneday").html(str);
	},
	error: function(e) {
		alert("오류발생:"+e.status+":"+e.statusText);
	}
});

function deleteOneday() {
	$.ajax({
		url: "../admin/OnedayCtrl.do",
		type: "get",
		data: {
			idx: $("#selecteBBS").val(),
			menu: "delete"
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

function FselecteBBS(param) {
	document.getElementById("selecteBBS").value=param;
}
function eBbsClicked() {
	//$("input:radio[name='eBBS']:radio[value='"++"']").prop('checked', true); 
}

</script>
</head>
<body>
<div class="container">
    <form name="updateInfo" target="parentForm">
    <input type="hidden" id="selecteBBS" />        
	<div class="row">
		<h2 style="text-align:center;">원데이 클래스(<span style="color:red;">신고 수 - 50▲</span>)</h2>
		<table class="table table-striped table-bordered table-hover">
			<thead>
			<tr class="info">
				<th class="text-center">선택</th>
				<th class="text-center">신고수</th>
				<th class="text-center">게시글번호</th>
				<th class="text-center">작성자</th>
				<th class="text-center">제목</th>
				<th class="text-center">등록일</th>
			</tr>
			</thead>
			<tbody id="ajaxTableOneday"></tbody>
		</table>
	</div>
        <!-- <button type="button" class="btn btn-success" onclick="submitPropose();">선택 삭제하기</button> -->
        <button type="button" class="btn btn-danger" onclick="deleteOneday();">선택 삭제하기</button>
	</form>
	<!-- <br /><br />
	<form name="updateInfo2" target="parentForm">
    <input type="hidden" id="selecteBBS2" />        
	<div class="row">
		<h2 style="text-align:center;">원데이 클래스(<span style="color:red;">거래 사고 접수</span>)</h2>
		<table class="table table-striped table-bordered table-hover">
			<thead>
			<tr class="info">
				<th class="text-center">선택</th>
				<th class="text-center">신고한 사람</th>
				<th class="text-center">게시글번호</th>
				<th class="text-center">판매자</th>
				<th class="text-center">제목</th>
				<th class="text-center">등록일</th>
			</tr>
			</thead>
			<tbody id="ajaxTableOneday"></tbody>
		</table>
	</div>
        <button type="button" class="btn btn-success" onclick="submitPropose();">진행시키기</button>
        <button type="button" class="btn btn-danger" onclick="deleteOneday();">삭제하기</button>
	</form> -->
</div>
</body>
</html> --%>