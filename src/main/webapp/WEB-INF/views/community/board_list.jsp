<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판 리스트</title>
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
			<td class="center" width="30"">번호</td>
			<td>제목</td>
			<td class="center">글쓴이</td>
			<td>날짜</td>
			<td class="center">조회수</td>
		</tr>
		<c:if test="${empty boardPage.boardList}">
		<tr>
			<td colspan="5">작성된 게시물이 없습니다.</td>
		</tr>
		</c:if>
		<c:if test="${not empty boardPage.boardList}">
			<c:forEach items="${boardPage.boardList}" var="vo">
			<tr>
				<td>${vo.boardNum}</td>
				<td>
					<c:if test="${vo.level != 0}">
					→
					<c:forEach begin="1" end="${vo.level}">
					답변 : 
					</c:forEach>
					</c:if>
					
					<c:if test="${vo.del == 0}">
						<a href="commRead.do?boardNum=${vo.boardNum}">
						${vo.title}
						</a>
					</c:if>
					<c:if test="${vo.del == 1}">
					삭제된 글입니다.
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
	
	<a href="commWriteForm.do">글쓰기</a><br>
	<!-- 하단 페이지 링크 부분 -->
	<div id="page">
		<c:forEach begin="${boardPage.startPage}" end="${boardPage.endPage}" var="p" step="1">
			<a href="commMain.do?page=${p}">${p}</a>
		</c:forEach>
	</div>
	<!-- 검색창 -->
	<form action="commBoardListSearch.do">
	<div id="search">
		<select name="searchSelect">
			<option value="1">제목+내용</option>
			<option value="2">제목</option>
			<option value="3">내용</option>
			<option value="4">글작성자</option>
		</select>		 
		<input type="text" name="searchWord" width="200"/>
		<input type="submit" value="검색"/>
	</div> 
	</form>
</div>
</body>
</html>