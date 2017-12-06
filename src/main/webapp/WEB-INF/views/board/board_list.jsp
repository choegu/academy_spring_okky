<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SIMPLE BOARD</title>
<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- �ΰ����� �׸� -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
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
	    	 location.href='messageWriteForm.do?receiveId='+clickedId;
	    	 break;
	     case "second": 
	    	 alert('ȸ���������:'+clickedId);
	    	 break;
	     case "third": 
	    	 $('#searchForWriterName').val(clickedId);
	    	 $('#searchForWriter').submit();
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

window.onload=function(){
	var searchOption = $('#originSearchOption').val();
	if (searchOption!='category' || searchOption=='') {
		$('#searchOption').val(searchOption);
	}
	
	var parentDoc= window.parent.document;
	var ifrm = $(parentDoc).find('#the_iframe');
	
	var board_height = $(document).height();
	
	ifrm.attr('onload', "resizeFrame(this,'"+board_height+"px')");
	parent.resizeFrame(ifrm, board_height);
};



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

#container {
	width: 90%;
	margin: 0 auto;     /* ���η� �߾ӿ� ��ġ */
	padding-top: 10%;   /* �׵θ��� ���� ������ �е� ���� */
}
   
#write {
	text-align: right;
}
     
    #bottom {
      text-align: center;
    }

    #search {
      text-align: center;
    }    
     
    /* Bootstrap ���� */
    .table > thead {
      background-color: #b3c6ff;
    }
    .table > thead > tr > th {
      text-align: center;
    }
    .table-hover > tbody > tr:hover {
      background-color: #e6ecff;
    }
    .table > tbody > tr > td {
      text-align: center;
    }
    .table > tbody > tr > #title {
      text-align: left;
    }
     
    div > #paging {
      text-align: center;
    }
     
    .hit {
      animation-name: blink;
      animation-duration: 1.5s;
      animation-timing-function: ease;
      animation-iteration-count: infinite;
      /* �� �Ӽ����� �� �ٷ� ǥ���ϱ� */
      /* -webkit-animation: blink 1.5s ease infinite; */
    }
     
    /* �ִϸ��̼� ���� �����ϱ� */
    /* �ͽ��÷η� 10 �̻�, �ֽ� ��� ���������� ���� */
    @keyframes blink {
      from {color: white;}
      30% {color: yellow;}
      to {color: red; font-weight: bold;}
      /* 0% {color:white;}
      30% {color: yellow;}
      100% {color:red; font-weight: bold;} */
    }

 	body { 
 		padding-left: 10px; 
 		padding-right: 10px; 
 	} 

</style>
</head>
<body>
<ul class='custom-menu'>
  <li data-action="first">���� ������</li>
<!--   <li data-action="second">ȸ������ ����</li> -->
  <li data-action="third">�ۼ��ڷ� �˻�</li>
</ul>
	<table class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th>NO</th>
				<th>�з�</th>
				<th>����</th>
				<th>�̸�</th>
				<th>��¥</th>
				<th>R</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty boardPage.boardList }">
				<tr>
					<td colspan="6">
						�ۼ��� �Խñ��� �������� �ʽ��ϴ�
					</td>
				</tr>
			</c:if>
			
			<jsp:useBean id="now" class="java.util.Date" />
			<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate" />
			
			<c:if test="${not empty boardPage.boardList}">
				<c:forEach items="${boardPage.boardList}" var="boardVO">
					<c:if test="${(boardVO.open==1) || ((boardVO.open==0) && (boardVO.writer==sessionScope.loginId))}">
						<tr>
							<td>${boardVO.board_num }</td>
							<td>${boardVO.category }</td>
							<td id="title">
								<span id="replySignTitle">
									<c:forEach begin="1" end="${boardVO.level}" var="l" step="1">
										<c:if test="${l>1}">
											&nbsp;&nbsp;&nbsp;
										</c:if>
										<c:if test="${l==boardVO.level}">
											<b>�� </b>
										</c:if>
									</c:forEach>
								</span>
								<a href="read.do?board_num=${boardVO.board_num }">
									${boardVO.title}
								</a> 
								<c:if test="${boardVO.comment_count!=0 }">
									[${boardVO.comment_count }]
								</c:if>
							</td>
							<td>
								<span class="context-menu-one btn btn-neutral user-writer">${boardVO.writer }</span>
							</td>
							<td>
								<fmt:formatDate value="${boardVO.write_date }" pattern="yyyyMMdd" var="writeDate"/>
								<c:if test="${nowDate==writeDate }">
									<fmt:formatDate value="${boardVO.write_date }" type="time" dateStyle="short" timeStyle="short"/>
								</c:if>
								<c:if test="${nowDate!=writeDate }">
									<fmt:formatDate value="${boardVO.write_date }" type="date" dateStyle="short" timeStyle="short"/>
								</c:if>
							</td>
							<td>${boardVO.read_count }</td>
						</tr>
					</c:if>
					<c:if test="${(boardVO.open==0) && (boardVO.writer!=sessionScope.loginId) }">
						<tr>
						<tr>
							<td>${boardVO.board_num }</td>
							<td>${boardVO.category }</td>
							<td id="title">[����� ���Դϴ�.]</td>
							<td>
								<span class="context-menu-one btn btn-neutral user-writer">${boardVO.writer }</span>
							</td>
							<td>
								<fmt:formatDate value="${boardVO.write_date }" pattern="yyyyMMdd" var="writeDate"/>
								<c:if test="${nowDate==writeDate }">
									<fmt:formatDate value="${boardVO.write_date }" type="time" dateStyle="short" timeStyle="short"/>
								</c:if>
								<c:if test="${nowDate!=writeDate }">
									<fmt:formatDate value="${boardVO.write_date }" type="date" dateStyle="short" timeStyle="short"/>
								</c:if>
							</td>
							<td>${boardVO.read_count }</td>
						</tr>
						</tr>
					</c:if>
					<c:if test="${boardVO.open==3 }">
						<tr>
							<td></td>
							<td></td>
							<td id="title">[������ ���Դϴ�.]</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</c:if>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	
	<div id="write">
		<a href="writeForm.do"><button>�۾���</button></a>
	</div>
	
	<div id="bottom">
		<c:if test="${boardPage.startPage!=1 }">
			<a href="boardSearch.do?page=${boardPage.startPage-1 }&searchOption=${searchOption}&searchText=${searchText}&category=${category}">[����]</a>
		</c:if>
		<c:forEach begin="${boardPage.startPage }" end="${boardPage.endPage }" var="p" step="1">
			<c:choose>
				<c:when test="${page==p }">
					<b>[${p }]</b>
				</c:when>
				<c:otherwise>
					<a href="boardSearch.do?page=${p }&searchOption=${searchOption}&searchText=${searchText}&category=${category}">[${p }]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${boardPage.endPage!=boardPage.totalPage }">
			<a href="boardSearch.do?page=${boardPage.endPage+1 }&searchOption=${searchOption}&searchText=${searchText}&category=${category}">[����]</a>
		</c:if>
	</div>

	<div id="search">
		<form action="boardSearch.do">
			<select id="searchOption" name="searchOption" required="required">
				<option value="">�˻��ɼ�</option>
			    <option value="title">����</option>
			    <option value="content">����</option>
			    <option value="titleContent">����+����</option>
			    <option value="writer">�ۼ���</option>
			</select>
			<input type="hidden" name="category" value="${category}">
			<input type="hidden" id="originSearchOption" value="${searchOption }">
			<input type="text" name="searchText" size="30" value="${searchText }">
			<input type="submit" name="searchSubmit" value="�˻�">
		</form>
		<!--�ۼ��ڷ� �˻� -->
		<form action="boardSearch.do" id="searchForWriter">
			<input type="hidden" name="category" value="${category}">
			<input type="hidden" name="searchOption" value="writer">
			<input type="hidden" id="searchForWriterName" name="searchText" value="">
		</form>
	</div>
</body>
</html>