<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판 수정</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->

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
window.onload = function(){
	document.getElementById("submitBtn").onclick = function(){
		var str = document.getElementById("area").value;
		str = str.replace(/(?:\r\n|\r|\n)/g, '<br />');
		document.getElementById("content").value = str;		
		document.getElementById("frm").submit();
		return false; 
	}
	
	//높이 설정
	var parentDoc= window.parent.document;
	var ifrm = $(parentDoc).find('#the_iframe');
	
	var board_height = $(document).height();
	
	ifrm.attr('onload', "resizeFrame(this,'"+board_height+"px')");
	parent.resizeFrame(ifrm, board_height);
}
</script>
</head>
<body>
<form action="commUpdate.do" method="post" id="frm">
	<input type="hidden" name="boardNum" value="${original.boardNum}">
	<table class="table">
		<tr>
			<td colspan="2"><input type="button" value="수정" id="submitBtn"/></td>
		</tr>
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
			<td><textarea id="area" rows="30">${original.content}</textarea></td>
		</tr>
		
	</table>
	<input type="hidden" id="content" name="content"/>
</form>
</body>
</html>