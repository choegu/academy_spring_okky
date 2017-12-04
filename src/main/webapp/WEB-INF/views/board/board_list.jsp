<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SIMPLE BOARD</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
//JAVASCRIPT (jQuery)

//Trigger action when the contextmenu is about to be shown
// $(document).bind("contextmenu click", function (event) {
// 	alert('test1')
//  if(event.target == $('.context-menu-one')) {
// 	 alert('test2')
// 	//Show context menu
// 	 // Avoid the real one
// 	 event.preventDefault();
	 
// 	 // Show contextmenu
// 	 $(".custom-menu").finish().toggle(100).
	 
// 	 // In the right position (the mouse)
// 	 css({
// 	     top: event.pageY + "px",
// 	     left: event.pageX + "px"
// 	 });
//  }

// });
$(function(){
	var clickedId = "test";
	
	$('.user-writer').click(function(){
		clickedId = $(this).text();
		
		//	Show contextmenu
	 	 $(".custom-menu").finish().toggle(100).
		 
	 	 // In the right position (the mouse)
	 	 css({
	 	     top: event.pageY + "px",
	 	     left: event.pageX + "px"
	 	 });
	})
	
	//If the menu element is clicked
	$(document).on('click',".custom-menu li",function(){
	 
	 // This is the triggered action name
	 switch($(this).attr("data-action")) {
	     
	     // A case for each action. Your actions here
	     case "first": 
	    	 alert('쪽지보낼대상:'+clickedId); 
	    	 location.href='messageWriteForm.do?receiveId='+clickedId;
	    	 break;
	     case "second": 
	    	 alert('회원정보대상:'+clickedId);
	    	 break;
	     case "third": 
	    	 alert("third"); 
	    	 break;
	 }

	 // Hide it AFTER the action was triggered
	 $(".custom-menu").hide(100);
	});
})


//If the document is clicked somewhere
$(document).bind("mousedown", function (e) {
 
 // If the clicked element is not the menu
 if (!$(e.target).parents(".custom-menu").length > 0) {
     
     // Hide it
     $(".custom-menu").hide(100);
 }
});




</script>

<style type="text/css">
/* CSS3 */

/* The whole thing */
.custom-menu {
    display: none;
    z-index: 1000;
    position: absolute;
    overflow: hidden;
    border: 1px solid #CCC;
    white-space: nowrap;
    font-family: sans-serif;
    background: #FFF;
    color: #333;
    border-radius: 5px;
    padding: 0;
}

/* Each of the items in the list */
.custom-menu li {
    padding: 8px 12px;
    cursor: pointer;
    list-style-type: none;
    transition: all .3s ease;
    user-select: none;
}

.custom-menu li:hover {
    background-color: #DEF;
}

</style>
</head>
<body>
<ul class='custom-menu'>
  <li data-action="first">쪽지 보내기</li>
  <li data-action="second">회원정보 보기</li>
<!--   <li data-action="third">Third thing</li> -->
</ul>
	<table class="table">
		<tr>
			<th>글번호</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:if test="${empty boardPage.boardList }">
			<tr>
				<td colspan="6">
					작성된 게시글이 존재하지 않습니다
				</td>
			</tr>
		</c:if>
		<c:if test="${not empty boardPage.boardList}">
			<c:forEach items="${boardPage.boardList}" var="boardVO">
				<c:if test="${boardVO.open!=3 }">
					<tr>
						<td>${boardVO.board_num }</td>
						<td>${boardVO.category }</td>
						<td>
							<a href="read.do?board_num=${boardVO.board_num }">
								${boardVO.title }
							</a>
						</td>
						<td>
							<span class="context-menu-one btn btn-neutral user-writer">${boardVO.writer }</span>
						</td>
						<td>
							<fmt:formatDate value="${boardVO.write_date }" type="date" dateStyle="short" timeStyle="short"/>
						</td>
						<td>${boardVO.read_count }</td>
					</tr>
				</c:if>
				<c:if test="${boardVO.open==3 }">
					<tr>
						<td></td>
						<td></td>
						<td>[삭제된 글입니다.]</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</c:if>
			</c:forEach>
		</c:if>
	</table>
	<div id="bottom">
		<c:if test="${boardPage.startPage!=1 }">
			<a href="boardSearch.do?page=${boardPage.startPage-1 }&searchOption=${searchOption}&searchText=${searchText}&category=${category}">[이전]</a>
		</c:if>
		<c:forEach begin="${boardPage.startPage }" end="${boardPage.endPage }" var="p" step="1">
			<c:choose>
				<c:when test="${page==p }">
					[${p }]
				</c:when>
				<c:otherwise>
					<a href="boardSearch.do?page=${p }&searchOption=${searchOption}&searchText=${searchText}&category=${category}">[${p }]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${boardPage.endPage!=boardPage.totalPage }">
			<a href="boardSearch.do?page=${boardPage.endPage+1 }&searchOption=${searchOption}&searchText=${searchText}&category=${category}">[다음]</a>
		</c:if>
	</div>
	<table>
		<tr>
			<td>
				<form action="boardSearch.do">
					<select name="searchOption" required="required">
						<option value="">검색옵션</option>
					    <option value="title">제목</option>
					    <option value="content">내용</option>
					    <option value="titleContent">제목+내용</option>
					    <option value="writer ">작성자</option>
					</select>
					<input type="hidden" name="category" value="${category}">
					<input type="text" name="searchText" size="30" value="${searchText }">
					<input type="submit" name="searchSubmit" value="검색">
				</form>
			</td>
			<td>
				<a href="writeForm.do"><button>글쓰기</button></a>
			</td>
		</tr>
	</table>
	
</body>
</html>