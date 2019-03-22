<%@ page language="java" contentType="text/html; charset=UTF-8"
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
		<h2 style="text-align:center;">프로젝트 제안(<span style="color:red;">추천 수 - 100▲</span>)</h2>
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
</html>