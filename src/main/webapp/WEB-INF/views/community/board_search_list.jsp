<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판 리스트</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
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
					<a href="commRead.do?boardNum=${vo.boardNum}">
					<c:if test="${vo.level != 0}">
					->
					<c:forEach begin="1" end="${vo.level}">
					답변 : 
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
	
	<a href="commWriteForm.do">글쓰기</a><br>
	<!-- 하단 페이지 링크 부분 -->
	<div id="page">
		<c:forEach begin="${boardPage.startPage}" end="${boardPage.endPage}" var="p" step="1">
			<a href="commBoardListSearch.do?page=${p}&searchSelect=${boardPage.searchSelect}&searchWord=${boardPage.searchWord}">${p}</a>
		</c:forEach>
	</div>
	<!-- 검색창 -->
	<form action="commBoardListSearch.do">
		<div id="search">
			<select id="searchSelect" name="searchSelect">
				<option  value="1">제목+내용</option>
				<option value="2">제목</option>
				<option value="3">내용</option>
				<option value="4">글작성자</option>
			</select>
			<input type="text" name="searchWord" width="200" value="${boardPage.searchWord}"/>
			<input type="submit" value="검색"/>
		</div> 
	</form>
</div>
</body>
</html>