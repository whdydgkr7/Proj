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
<title> 관리자 추가 </title>

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
function checkValue(){
   	$.ajax({
   		url: "../admin/AdminCtrl.do",
   		type: "get",
   		data: {
   			id: $("#id").val(),
   			pass: $("#pass").val(),
   			name: $("#name").val(),
   			email: $("#email").val(),
   			point: $("#point").val(),
   			enabled: "1",
   			authority: "ADMIN",
   			menu: "add"
   		},
   		contentType: "text/html;charset:UTF-8",
   		success: function(responseData) {
   			alert(responseData);
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
</script>
</head>
<body>
<div id="wrap">
    <br>
    <b><font size="5" color="gray">괸리자 추가하기</font></b>
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
					<tr>
						<td class='text-center'>아이디&nbsp;&nbsp;</td><td><input type='text' id='id'/></td></tr><tr>
						<td class='text-center'>비밀번호&nbsp;&nbsp;</td><td><input type='text' id='pass'/></td></tr><tr>
						<td class='text-center'>이름&nbsp;&nbsp;</td><td><input type='text' id='name'/></td></tr><tr>
						<td class='text-center'>이메일&nbsp;&nbsp;</td><td><input type='text' id='email'/></td></tr><tr>
						<td class='text-center'>포인트&nbsp;&nbsp;</td><td><input type='text' id='point'/></td></tr><tr>
					</tr>
				</table>
			</div>
            <br><br>
            <button type="button" class="btn btn-success" onclick="checkValue();">관리자 추가하기</button>
            <button type="button" class="btn btn-danger" onclick="window.close();">창닫기</button>
        </form>
    </div>
</div>    
</body>
</html>