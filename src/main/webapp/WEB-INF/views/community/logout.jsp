<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그아웃</title>
<style type="text/css">
#header{
	display: none;
}
</style>
<script type="text/javascript">
window.onload=function(){
	alert('로그아웃 되었습니다.');
	location.href="${pageContext.request.contextPath}/"
}
</script>
</head>
<body>

</body>
</html>