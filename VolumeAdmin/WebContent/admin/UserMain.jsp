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
$(document).ready(user);
function user() {
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
			str+="<thead>"
					+"<tr class='info'>"
						+"<th class='text-center'>선택</th>"
						+"<th class='text-center'>아이디</th>"
						+"<th class='text-center'>이름</th>"
						+"<th class='text-center'>가입일</th>"
						+"<th class='text-center'>이메일</th>"
						+"<th class='text-center'>포인트</th>"
						+"<th class='text-center'>계정상태</th>"
						+"<th class='text-center'>권한</th>"
						+"<th class='text-center'>가입경로</th>"
					+"</tr>"
				+"</thead>"
				+"<tbody>";
			$.each(responseData, function(index, data) {
				var enabled=data.enabled;
				if(enabled==1) enabled='정상';
				else enabled='비승인';
				str+="<tr id='"+data.id+"' style='background-color:white;' onmouseover=\"this.style.backgroundColor='#ffb0a5';\" onmouseout=\"this.style.backgroundColor='white';\">";
				str+="<td class='text-center'><input type='radio' name='user' id='"+data.id+"' value='"+data.id+"' onClick='selectUser(this.value);'/></td>";
				str+="<td class='text-center'>"+data.id+"</td>";
				str+="<td class='text-center'>"+data.name+"</td>";
				str+="<td class='text-center'>"+data.regidate+"</td>";
				str+="<td class='text-center'>"+data.email+"</td>";
				str+="<td class='text-center'>"+data.point+"</td>";
				str+="<td class='text-center'>"+enabled+"</td>";
				str+="<td class='text-center'>"+data.authority+"</td>";
				str+="<td class='text-center'>"+data.userType+"</td>";
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
function selectUser(param) {
	document.getElementById("selectUser").value=param;
}

function deleteUser() {
	var select=document.getElementById("selectUser").value
	if (select=="" || select==null){
		alert("삭제할 항목을 선택 해 주세요.");
		return;
	}
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
	var select=document.getElementById("selectUser").value
	if (select=="" || select==null){
		alert("정지할 항목을 선택 해 주세요.");
		return;
	}
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
	var select=document.getElementById("selectUser").value
	if (select=="" || select==null){
		alert("활성화 할 항목을 선택 해 주세요.");
		return;
	}
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
	var select=document.getElementById("selectUser").value
	if (select=="" || select==null){
		alert("수정할 항목을 선택 해 주세요.");
		return;
	}
	window.name = "parentForm";
    window.open("UserUpdate.jsp?id="+document.getElementById("selectUser").value,
                "replyForm", "width=350, height=600, resizable = no, scrollbars = no");
}
</script>
<!-- Sidebar/menu -->
<jsp:include page="../common/commonBar.jsp"></jsp:include>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:340px;margin-right:40px">

  <!-- Header -->
  <div class="w3-container" style="margin-top:80px;" id="uManagement">
    <!-- <h1 class="w3-jumbo"><b>회원 관리</b></h1> -->
    <h1 class="w3-xxxlarge w3-text-red"><b>회원 관리</b></h1>
    <hr style="width:50px;border:5px solid red" class="w3-round">
    <div class="container">
		<div class="row text-center">
			<h2 style="text-align:center;">회원관리(<span style="color:red;">회원 찾기</span>)</h2>
			<form class="text-right">
				<input type="hidden" id="selectUser" />
				<input type="text" id="searchId" placeholder="아이디 입력" onkeyup="user();"/>
				<input type="button" onclick="user();" class="btn btn-info" value="아이디 찾기"/>
			</form>	
		</div>
		<br />
		<div class="row">
			<table class="table table-striped table-bordered table-hover paginated" id="ajaxTable"></table>
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
  </div>
  
  <br /><br /><br /><br /><br /><br /><br /><br />
<!-- End page content -->
</div>

<!-- W3.CSS Container -->
<jsp:include page="../common/commonBottom.jsp"></jsp:include>

<script>
// Script to open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}

// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}
</script>

</body>
</html>














<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>file.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
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
</html> --%>