<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인화면</title>
</head>
<body>
<h2>LOGIN</h2>
<form action="login.do" method="post">
<table>
	<tr>
		<td>ID : </td>
		<td>
			<input type="text" name="id" size="20">
		</td>
	</tr>
	<tr>
		<td>PASSWORD : </td>
		<td>
			<input type="password" name="password" size="20">
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="LOGIN">
		</td>
	</tr>
</table>
</form>
</body>
</html>