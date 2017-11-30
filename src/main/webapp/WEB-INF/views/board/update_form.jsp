<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>UPDATE FORM</title>
</head>
<body>
	<form action="update.do" method="post">
		<table border="1">
			<tr>
				<td>제목 : </td>
				<td>
					<input type="text" name="title" value="${original.title }">
				</td>
			</tr>
			<tr>
				<td>내용 : </td>
				<td>
					<textarea rows="20" cols="30" name="content">${original.content }</textarea>
				</td>
			</tr>			
			<tr>
				<td colspan="2">
					<input type="hidden" name="board_num" value="${original.board_num }">
					<input type="submit" value="SUBMIT">
				</td>
			</tr>
		</table>
	
	</form>

</body>
</html>