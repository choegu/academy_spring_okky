<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판 수정</title>
<style type="text/css">
table{
	width: 60%;
	margin: auto;
}
input, textarea{
	width: 100%;
}
.title{
	text-align: center
}
</style>
<script type="text/javascript">
// window.onload = function(){
// 	document.getElementById("submitBtn").onclick = function(){
// 		var str = document.getElementById("area").value;
// 		str = str.replace(/(?:\r\n|\r|\n)/g, '<br />');
// 		document.getElementById("content").value = str;
		
// 		document.getElementById("frm").submit();
// 		return false; 
// 	}
// }
</script>
</head>
<body>
<form action="commUpdate.do" method="post" id="frm">
	<input type="hidden" name="boardNum" value="${original.boardNum}">
	<table border="1">
		<tr>
			<td class="title">제목</td>
			<td>
			<c:if test="${original.list != 0}">
			<c:forEach var="num" begin="1" end="${original.level}">
			답변 : 
			</c:forEach>
			</c:if>
			<input type="text" name="title" value="${original.title}"></td>
		</tr>
		<tr>
			<td class="title">내용</td>
			<td><textarea id="area" name="content" rows="30">${original.content}</textarea></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="수정" id="submitBtn"/></td>
		</tr>
	</table>
	<input type="hidden" id="content" name="content"/>
</form>
</body>
</html>