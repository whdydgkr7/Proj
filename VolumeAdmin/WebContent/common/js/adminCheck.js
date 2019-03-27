function adminCheck() {
	if('${sessionScope.authority}'!='ADMIN'){
		alert("관리자 페이지입니다.\n관리자라면 로그인 후 이용 해 주세요.");
		location.href='../index.jsp';
	}
}