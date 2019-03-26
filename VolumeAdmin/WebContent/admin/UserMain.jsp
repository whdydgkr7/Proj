<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en">
<title>관리자 페이지</title>
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
<script type="text/javascript">
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
						+"<th class='text-center'>상태(1:정상/ 0:정지)</th>"
						+"<th class='text-center'>권한</th>"
						+"<th class='text-center'>가입경로</th>"
					+"</tr>"
				+"</thead>"
				+"<tbody>";
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
			str+="</tbody>";
			$("#ajaxTable").html(str);
			page();
		},
		error: function(e) {
			alert("오류발생:"+e.status+":"+e.statusText);
		}
	});
}
//만들어진 테이블에 페이지 처리
function page(){ 
var reSortColors = function($table) {
  $('tbody tr:odd td', $table).removeClass('even').removeClass('listtd').addClass('odd');
  $('tbody tr:even td', $table).removeClass('odd').removeClass('listtd').addClass('even');
 };
 $('table.paginated').each(function() {
  var pagesu = 10;  //페이지 번호 갯수
  var currentPage = 0;
  var numPerPage = 10;  //목록의 수
  var $table = $(this);    
  
  //length로 원래 리스트의 전체길이구함
  var numRows = $table.find('tbody tr').length;
  //Math.ceil를 이용하여 반올림
  var numPages = Math.ceil(numRows / numPerPage);
  //리스트가 없으면 종료
  if (numPages==0) return;
  //pager라는 클래스의 div엘리먼트 작성
  var $pager = $('<td align="center" id="remo" colspan="10"><div class="pager"></div></td>');
  
  var nowp = currentPage;
  var endp = nowp+10;
  
  //페이지를 클릭하면 다시 셋팅
  $table.bind('repaginate', function() {
  //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
  
   $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
   $("#remo").html("");
   
   if (numPages > 1) {     // 한페이지 이상이면
    if (currentPage < 5 && numPages-currentPage >= 5) {   // 현재 5p 이하이면
     nowp = 0;     // 1부터 
     endp = pagesu;    // 10까지
    }else{
     nowp = currentPage -5;  // 6넘어가면 2부터 찍고
     endp = nowp+pagesu;   // 10까지
     pi = 1;
    }
    
    if (numPages < endp) {   // 10페이지가 안되면
     endp = numPages;   // 마지막페이지를 갯수 만큼
     nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
    }
    if (nowp < 1) {     // 시작이 음수 or 0 이면
     nowp = 0;     // 1페이지부터 시작
    }
   }else{       // 한페이지 이하이면
    nowp = 0;      // 한번만 페이징 생성
    endp = numPages;
   }
   // [처음]
   $('<br /><span class="page-number" cursor: "pointer">[처음]</span>').bind('click', {newPage: page},function(event) {
          currentPage = 0;   
          $table.trigger('repaginate');  
          $($(".page-number")[2]).addClass('active').siblings().removeClass('active');
      }).appendTo($pager).addClass('clickable');
    // [이전]
      $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[이전]&nbsp;</span>').bind('click', {newPage: page},function(event) {
          if(currentPage == 0) return; 
          currentPage = currentPage-1;
    $table.trigger('repaginate'); 
    $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
   }).appendTo($pager).addClass('clickable');
    // [1,2,3,4,5,6,7,8]
   for (var page = nowp ; page < endp; page++) {
    $('<span class="page-number" cursor: "pointer" style="margin-left: 8px;"></span>').text(page + 1).bind('click', {newPage: page}, function(event) {
     currentPage = event.data['newPage'];
     $table.trigger('repaginate');
     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
     }).appendTo($pager).addClass('clickable');
   } 
    // [다음]
      $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[다음]&nbsp;</span>').bind('click', {newPage: page},function(event) {
    if(currentPage == numPages-1) return;
        currentPage = currentPage+1;
    $table.trigger('repaginate'); 
     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
   }).appendTo($pager).addClass('clickable');
    // [끝]
   $('<span class="page-number" cursor: "pointer">&nbsp;[끝]</span>').bind('click', {newPage: page},function(event) {
           currentPage = numPages-1;
           $table.trigger('repaginate');
           $($(".page-number")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
   }).appendTo($pager).addClass('clickable');
     
     $($(".page-number")[2]).addClass('active');
reSortColors($table);
  });
   $pager.insertAfter($table).find('span.page-number:first').next().next().addClass('active');   
   $pager.appendTo($table);
   $table.trigger('repaginate');
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
			<form>
				<input type="hidden" id="selectUser" />
				<input type="text" id="searchId" placeholder="아이디 입력" onkeyup="user();"/>
				<input type="button" onclick="user();" class="btn btn-info" value="실시간검색"/>
			</form>	
		</div>
		<div class="row">
			<table class="table table-striped table-bordered table-hover paginated" id="ajaxTable">
			<!-- <thead>
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
			<tbody id="ajaxTable"></tbody> -->
			</table>
			<%-- <div class="row text-center">
				<!-- 페이지번호 부분 -->
				<ul class="pagination">	
					${pagingImg }
				</ul>	
			</div> --%>	
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
<div class="w3-light-grey w3-container w3-padding-32" style="margin-top:75px;padding-right:58px"><p class="w3-right">관리자 페이지 <a href="home" title="W3.CSS" target="_blank" class="w3-hover-opacity">Volume</a></p></div>

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