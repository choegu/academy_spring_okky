<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JOIN FORM</title>
</head>
<body>
<h2>JOIN FORM</h2>
<form action="join.do" method="post">
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
				<input type="submit" value="JOIN">
			</td>
		</tr>
	</table>
</form>

</body>
</html>