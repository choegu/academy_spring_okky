<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>UPDATE SUCCESS</title>
<script type="text/javascript">
	window.onload = function() {
		alert('수정 작업 완료');
		location.href="read.do?board_num=${board_num}";
	}
</script>
</head>
<body>

</body>
</html>