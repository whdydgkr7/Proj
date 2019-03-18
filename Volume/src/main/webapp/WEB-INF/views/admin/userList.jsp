<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>file.jsp</title>
</head>
<body>
<script type="text/javascript">
    $(document).ready(function() {
    	$("#sido").change(function() {
    		$.ajax({
    			url: "/ViewUserList",
    			type: "get",
    			/* data: {
    				sido:$("#sido option:selected").val()
    			}, */
    			contentType: "text/html;charset:utf-8;",
    			dataType: "json",
    			success: function(d) {
    				//alert(d);
    				alert(d);
    				var optionStr="";
    				optionStr+="<option value=''>";
    				optionStr+="-구/군을 선택하세요-";
    				optionStr+="</option>";
    				$.each(d, function(index, data) {
    					optionStr+="<option value='"+data+"'>";
    					optionStr+=data;
    					optionStr+="</option>";
    				});
    				$("#gugun").html(optionStr);
    			},
    			error: function(e) {
    				alert("오류발생:"+e.status+":"+e.statusText);
    			}
    		});
    	});
    </script>
</body>
</html>