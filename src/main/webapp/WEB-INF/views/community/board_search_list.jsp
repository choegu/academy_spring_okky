<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ��� ����Ʈ</title>
<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- �ΰ����� �׸� -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
window.onload = function(){
	 $("#searchSelect > option[value="+'<c:out value="${boardPage.searchSelect}"/>'+"]").attr("selected","selected");
}
</script>
</head>
<body>
<div id="content">
	<table class="table">
		<tr>
			<td class="center" width="30"">��ȣ</td>
			<td>����</td>
			<td class="center">�۾���</td>
			<td>��¥</td>
			<td class="center">��ȸ��</td>
		</tr>
		<c:if test="${empty boardPage.boardList}">
		<tr>
			<td colspan="5">�ۼ��� �Խù��� �����ϴ�.</td>
		</tr>
		</c:if>
		<c:if test="${not empty boardPage.boardList}">
			<c:forEach items="${boardPage.boardList}" var="vo">
			<tr>
				<td>${vo.boardNum}</td>
				<td>
					<a href="commRead.do?boardNum=${vo.boardNum}">
					<c:if test="${vo.level != 0}">
					->
					<c:forEach begin="1" end="${vo.level}">
					�亯 : 
					</c:forEach>
					</c:if>
					${vo.title}</a>
				</td>
				<td>${vo.writer}</td>
				<td>${vo.writeDate}</td>
				<td>${vo.readCount}</td>
			</tr>
			</c:forEach>
		</c:if>
	</table>
	
	<a href="commWriteForm.do">�۾���</a><br>
	<!-- �ϴ� ������ ��ũ �κ� -->
	<div id="page">
		<c:forEach begin="${boardPage.startPage}" end="${boardPage.endPage}" var="p" step="1">
			<a href="commBoardListSearch.do?page=${p}&searchSelect=${boardPage.searchSelect}&searchWord=${boardPage.searchWord}">${p}</a>
		</c:forEach>
	</div>
	<!-- �˻�â -->
	<form action="commBoardListSearch.do">
		<div id="search">
			<select id="searchSelect" name="searchSelect">
				<option  value="1">����+����</option>
				<option value="2">����</option>
				<option value="3">����</option>
				<option value="4">���ۼ���</option>
			</select>
			<input type="text" name="searchWord" width="200" value="${boardPage.searchWord}"/>
			<input type="submit" value="�˻�"/>
		</div> 
	</form>
</div>
</body>
</html>