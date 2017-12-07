<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ��� ����Ʈ</title>
<style type="text/css">
	#content{
		width: 750px;
		margin: auto;
	}
	table{
		width: 100%;
		margin: auto;
	}
	.class{
		text-align: center;
		background-color: gray;
	}
	.page{
		text-align: center;
		margin: auto;
	}
</style>
<script type="text/javascript">
window.onload=function(){
	/* alert("session Login : "+'${sessionScope.loginId}'); */
}
</script>
</head>
<body>

<div id="content">
	<table border="1">
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
					<c:if test="${vo.level != 0}">
					��
					<c:forEach begin="1" end="${vo.level}">
					�亯 : 
					</c:forEach>
					</c:if>
					
					<c:if test="${vo.del == 0}">
						<a href="commRead.do?boardNum=${vo.boardNum}">
						${vo.title}
						</a>
					</c:if>
					<c:if test="${vo.del == 1}">
					������ ���Դϴ�.
					</c:if>
				</td>
				<td>${vo.writer}</td>
				<td>${vo.writeDate}</td>
				<td><fmt:formatDate value="${vo.writeDate}" pattern="yyyyMMdd" var="writeDate"/></td>
				<td>${vo.readCount}</td>
			</tr>
			</c:forEach>
		</c:if>
	</table>
	
	<a href="commWriteForm.do">�۾���</a><br>
	<!-- �ϴ� ������ ��ũ �κ� -->
	<div id="page">
		<c:forEach begin="${boardPage.startPage}" end="${boardPage.endPage}" var="p" step="1">
			<a href="commMain.do?page=${p}">${p}</a>
		</c:forEach>
	</div>
	<!-- �˻�â -->
	<form action="commBoardListSearch.do">
	<div id="search">
		<select name="searchSelect">
			<option value="1">����+����</option>
			<option value="2">����</option>
			<option value="3">����</option>
			<option value="4">���ۼ���</option>
		</select>		 
		<input type="text" name="searchWord" width="200"/>
		<input type="submit" value="�˻�"/>
	</div> 
	</form>
</div>
</body>
</html>