<%@ page language="java" contentType="text/html; charset=UTF-8"
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
</html>