<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>file.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
/* $("tr#").click(function(){
	  $(this).css("background-color","yellow");
	  $("input:radio[name='user']:radio[value='"+param+"']").prop('checked', true); 
	});
} */
$.ajax({
	url: "../admin/AdminCtrl.do",
	type: "get",
	data: {
		menu: "view"
	},
	contentType: "text/html;charset:utf-8;",
	dataType: "json",
	success: function(responseData) {
		var str="";
		$.each(responseData, function(index, data) {
			str+="<tr id='"+data.id+"' style='background-color:white;' onmouseover=\"this.style.backgroundColor='#ffb0a5';\" onmouseout=\"this.style.backgroundColor='white';\">";
			str+="<td class='text-center'><input type='radio' name='user' id='"+data.id+"' value='"+data.id+"' onClick='selectAdmin(this.value);'/></td>";
			str+="<td class='text-center'>"+data.id+"</td>";
			str+="<td class='text-center'>"+data.pass+"</td>";
			str+="<td class='text-center'>"+data.name+"</td>";
			str+="<td class='text-center'>"+data.regidate+"</td>";
			str+="<td class='text-center'>"+data.email+"</td>";
			str+="<td class='text-center'>"+data.point+"</td>";
			str+="<td class='text-center'>"+data.enabled+"</td>";
			str+="<td class='text-center'>"+data.authority+"</td>";
			str+="</tr>";
		});
		$("#ajaxTableAdmin").html(str);
	},
	error: function(e) {
		alert("오류발생:"+e.status+":"+e.statusText);
	}
});

function selectAdmin(param) {
	document.getElementById("selectAdmin").value=param;
}

function deleteAdmin() {
	$.ajax({
		url: "../admin/AdminCtrl.do",
		type: "get",
		data: {
			id: $("#selectAdmin").val(),
			menu: "delete"
		},
		contentType: "text/html;charset:utf-8;",
		success: function() {
			alert("관리자 ["+$("#selectAdmin").val()+"] 를 삭제했습니다.");
			document.location.reload(); 
		},
		error: function(e) {
			alert("오류발생:"+e.status+":"+e.statusText);
		}
	});
}
function modifyAdmin() {
	
	window.name = "parentForm";
    window.open("adminUpdate.jsp?id="+document.getElementById("selectAdmin").value,
                "replyForm", "width=350, height=600, resizable = no, scrollbars = no");
}
function addAdmin() {
	window.name = "parentForm";
    window.open("adminAdd.jsp?id="+document.getElementById("selectAdmin").value,
                "replyForm", "width=350, height=600, resizable = no, scrollbars = no");
}
</script>
<div class="container">
	<div class="row text-center">
		<h2 style="text-align:center;">관리자 계정 설정(<span style="color:red;">목록</span>)</h2>
 		<form>
			<input type="hidden" id="selectAdmin" />
			<!-- <input type="text" id="searchId" placeholder="아이디 입력" onkeyup="user();"/>
			<input type="button" onclick="user();" class="btn btn-info" value="실시간검색"/> -->
		</form>
	</div>
	<div class="row">
		<table class="table table-striped table-bordered table-hover">
		<thead>
			<tr class="info">
				<th class="text-center">선택</th>
				<th class="text-center">아이디</th>
				<th class="text-center">비밀번호</th>
				<th class="text-center">이름</th>
				<th class="text-center">등록일</th>
				<th class="text-center">이메일</th>
				<th class="text-center">포인트</th>
				<th class="text-center">상태(1:정상/ 0:정지)</th>
				<th class="text-center">권한</th>
			</tr>
		</thead>
		<tbody id="ajaxTableAdmin"></tbody>
		</table>
	</div>
	<table>
		<tr>
			<td align="center"><button type="button" class="btn btn-success" onclick="addAdmin();">관리자 계정 추가</button></td>
			<td align="center"><button type="button" class="btn btn-warning" onclick="modifyAdmin();">선택 관리자 수정</button></td>
			<td align="center"><button type="button" class="btn btn-danger" onclick="deleteAdmin();">선택 관리자 삭제</button></td>
		</tr>
	</table>
</div>

</body>
</html>