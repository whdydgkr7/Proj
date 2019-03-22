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

var user=function() {
	$.ajax({
		url: "../admin/UserCtrl.do",
		type: "get",
		data: {
			id: $("#searchId").val(),
			menu: "search"
		},
		contentType: "text/html;charset:utf-8;",
		dataType: "json",
		success: function(responseData) {
			var str="";
			$.each(responseData, function(index, data) {
				str+="<tr id='"+data.id+"' style='background-color:white;' onmouseover=\"this.style.backgroundColor='#ffb0a5';\" onmouseout=\"this.style.backgroundColor='white';\">";
				str+="<td class='text-center'><input type='radio' name='user' id='"+data.id+"' value='"+data.id+"' onClick='selectUser(this.value);'/></td>";
				str+="<td class='text-center'>"+data.id+"</td>";
				str+="<td class='text-center'>"+data.name+"</td>";
				str+="<td class='text-center'>"+data.regidate+"</td>";
				str+="<td class='text-center'>"+data.email+"</td>";
				str+="<td class='text-center'>"+data.point+"</td>";
				str+="<td class='text-center'>"+data.enabled+"</td>";
				str+="<td class='text-center'>"+data.authority+"</td>";
				str+="<td class='text-center'>"+data.userType+"</td>";
				str+="</tr>";
			});
			$("#ajaxTable").html(str);
		},
		error: function(e) {
			alert("오류발생:"+e.status+":"+e.statusText);
		}
	});
}

function selectUser(param) {
	document.getElementById("selectUser").value=param;
}

function deleteUser() {
	$.ajax({
		url: "../admin/UserCtrl.do",
		type: "get",
		data: {
			id: $("#selectUser").val(),
			menu: "delete"
		},
		contentType: "text/html;charset:utf-8;",
		success: function() {
			alert("유저 ["+$("#selectUser").val()+"] 를 삭제했습니다.");
			document.location.reload(); 
		},
		error: function(e) {
			alert("오류발생:"+e.status+":"+e.statusText);
		}
	});
}

function pauseUser() {
	$.ajax({
		url: "../admin/UserCtrl.do",
		type: "get",
		data: {
			id: $("#selectUser").val(),
			menu: "pause"
		},
		contentType: "text/html;charset:utf-8;",
		success: function() {
			alert("유저 ["+$("#selectUser").val()+"]의 계정을 정지했습니다.");
			document.location.reload(); 
		},
		error: function(e) {
			alert("오류발생:"+e.status+":"+e.statusText);
			alert("이미 정지 된 계정 입니다.");
		}
	});
}

function activateUser() {
	$.ajax({
		url: "../admin/UserCtrl.do",
		type: "get",
		data: {
			id: $("#selectUser").val(),
			menu: "activate"
		},
		contentType: "text/html;charset:utf-8;",
		success: function() {
			alert("유저 ["+$("#selectUser").val()+"]의 계정을 복구했습니다.");
			document.location.reload(); 
		},
		error: function(e) {
			alert("오류발생:"+e.status+":"+e.statusText);
			alert("이미 활성화 된 계정 입니다.");
		}
	});
}
function modifyUser() {
	
	window.name = "parentForm";
    window.open("UserUpdate.jsp?id="+document.getElementById("selectUser").value,
                "replyForm", "width=350, height=600, resizable = no, scrollbars = no");
}
</script>
<div class="container">
	<div class="row text-center">
		<h2 style="text-align:center;">회원관리(<span style="color:red;">회원 찾기</span>)</h2>
		<form>
			<input type="hidden" id="selectUser" />
			<input type="text" id="searchId" placeholder="아이디 입력" onkeyup="user();"/>
			<input type="button" onclick="user();" class="btn btn-info" value="실시간검색"/>
		</form>	
	</div>
	<div class="row">
		<table class="table table-striped table-bordered table-hover">
		<thead>
			<tr class="info">
				<th class="text-center">선택</th>
				<th class="text-center">아이디</th>
				<th class="text-center">이름</th>
				<th class="text-center">가입일</th>
				<th class="text-center">이메일</th>
				<th class="text-center">포인트</th>
				<th class="text-center">상태(1:정상/ 0:정지)</th>
				<th class="text-center">권한</th>
				<th class="text-center">가입경로</th>
			</tr>
		</thead>
		<tbody id="ajaxTable"></tbody>
		</table>
	</div>
	<table>
		<tr>
			<td align="center"><button type="button" class="btn btn-success" onclick="modifyUser();">선택 유저 정보수정</button></td>
			<td align="center"><button type="button" class="btn btn-warning" onclick="pauseUser();">선택 유저 정지하기</button></td>
			<td align="center"><button type="button" class="btn btn-info" onclick="activateUser();">선택 유저 복구하기</button></td>
			<td align="center"><button type="button" class="btn btn-danger" onclick="deleteUser();">선택 유저 삭제하기</button></td>
		</tr>
	</table>
</div>

</body>
</html>