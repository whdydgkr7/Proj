<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>

<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title> 관리자 정보 수정 </title>

<style type="text/css">
    #wrap {
        width: 300px;
        margin: 0 auto 0 auto;
        text-align :center;
    }

    #commentUpdateForm{
        text-align :center;
    }
</style>
<script type="text/javascript">

window.onload=function() {
	$.ajax({
		url: "../admin/AdminCtrl.do",
		type: "get",
		data: {
			id: "<%=request.getParameter("id")%>",
			menu: "modView"
		},
		dataType: "json",
		contentType: "text/html;charset:utf-8;",
		success: function(data) {
			var str="";
				str+="<tr>";
				str+="<td class='text-center'>아이디&nbsp;&nbsp;</td><td><input type='text' value='"+data.id+"' id='id' readonly='readonly'/></td></tr><tr>";
				str+="<td class='text-center'>비밀번호&nbsp;&nbsp;</td><td><input type='text' value='"+data.pass+"' id='pass'/></td></tr><tr>";
				str+="<td class='text-center'>이름&nbsp;&nbsp</td><td><input type='text' value='"+data.name+"' id='name'/></td></tr><tr>";
				str+="<td class='text-center'>등록일&nbsp;&nbsp</td><td><input type='text' value='"+data.regidate+"' readonly='readonly' id='regidate'/></td></tr><tr>";
				str+="<td class='text-center'>이메일&nbsp;&nbsp</td><td><input type='text' value='"+data.email+"' id='email'/></td></tr><tr>";
				str+="<td class='text-center'>포인트&nbsp;&nbsp</td><td><input type='text' value='"+data.point+"' id='point'/></td></tr><tr>";
				str+="<td class='text-center'>상태&nbsp;&nbsp</td><td><input type='text' value='"+data.enabled+"' id='enabled'/></td></tr><tr>";
				str+="<td class='text-center'>권한&nbsp;&nbsp</td><td><input type='text' value='"+data.authority+"' id='authority'/></td></tr><tr>";
				str+="</tr>";
			$("#ajaxTable").html(str)
		},
		error: function(e) {
			alert("오류발생:"+e.status+":"+e.statusText);
		}
	});
}

function checkValue(){
    if($("#id").val()==""){
        alert("내용을 입력하세요");
        return false;
    }
    else{
    	$.ajax({
    		url: "../admin/AdminCtrl.do",
    		type: "get",
    		data: {
    			id: $("#id").val(),
    			pass: $("#pass").val(),
    			name: $("#name").val(),
    			//regidate: $("#regidate").val(),
    			email: $("#email").val(),
    			point: $("#point").val(),
    			enabled: $("#enabled").val(),
    			authority: $("#authority").val(),
    			menu: "modify",
    		},
    		contentType: "text/html;charset:UTF-8",
    		success: function() {
    			alert("관리자 정보 수정에 성공했습니다.");
    			//location.href="../admin/adminMain.jsp";
    			window.opener.document.location.reload(); 
                opener.updateForm = null;
                self.close();
    		},	
    		error: function(errorData) {
    			alert("오류발생:"+errorData.status+": "+errorData.statusText);
    		}
    	});
    }
}
    
</script>
</head>
<body>
<div id="wrap">
    <br>
    <b><font size="5" color="gray">관리자 정보 변경하기</font></b>
    <hr size="1" width="550">
    <br>
    <div id="commentUpdateForm">
        <form name="updateInfo" target="parentForm">        
        	<div class="row">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr class="info">
						</tr>
					</thead>
					<tbody id="ajaxTable"></tbody>
				</table>
			</div>
            <br><br>
            <button type="button" class="btn btn-success" onclick="checkValue();">관리자 정보 수정하기</button>
            <button type="button" class="btn btn-danger" onclick="window.close();">창닫기</button>
        </form>
    </div>
</div>    
</body>
</html>