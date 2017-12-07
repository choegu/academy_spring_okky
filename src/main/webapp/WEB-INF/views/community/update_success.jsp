<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>수정하기 성공</title>
<style type="text/css">
#header{
	display: none;
}
</style>
<script type="text/javascript">
	window.onload=function(){
		alert('수정하기 작업 완료!');
		location.href="commRead.do?boardNum="+'${boardNum}';
	}
</script>
</head>
<body>

</body>
</html>