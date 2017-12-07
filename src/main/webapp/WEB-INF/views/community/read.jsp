<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글 내용 확인</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">
#content {
	width: 750px;
	background-position: center;
	margin: auto;
}
table {
	width: 100%;
}

.title {
	width: 100px;
}

.showDate {
	width: 20%;
}

textarea {
	width: 100%;
}

.cmt-span-cancle {
	display: none;
}
</style>

<script type="text/javascript">
	//수정
	function updateRegComment(commentNum) {
		var content = $('#cmt-' + commentNum).text();
		$('#cmt-' + commentNum).empty();

		$('.cmt-data-td').find('input').each(function() {
			var cmtData = $(this).val();
			$(this).after(cmtData);
			$(this).remove();
		})

		$('.cmt-data-td').find('.btn-cmt-update').each(function() {
			$(this).remove();
		})
		$('.cmt-td').find('.cmt-update-span').each(function() {
			$(this).show();
		})
		$('.cmt-td').find('.cmt-span-cancle').each(function() {
			$(this).hide();
		})

		//////////////////////////
		$('#cmt-update-span-' + commentNum).hide();
		$('#cmt-span-cancle-' + commentNum).show();

		var inputUpdate = "<input type='text' id='input-cmt-"+commentNum+"' value='"+content+"'/>"
				/* +"<a onclick='updateComment("+commentNum+")' class='btn-cmt-update'>등록</a>"; */
				+ "<a href='#' class='btn-cmt-update'><input type='hidden' value='"+commentNum+"'/>등록</a>";

		$('#cmt-' + commentNum).append(inputUpdate);
		$('#input-cmt-' + commentNum).focus();
	}

	//수정 취소
	function updateCancleCommnet(commentNum) {

		var content = $('#input-cmt-' + commentNum).val();
		$('#input-cmt-' + commentNum).remove();
		$('#cmt-' + commentNum).append(content);
		$('.cmt-data-td').find('.btn-cmt-update').each(function() {
			$(this).remove();
		})
		$('.cmt-td').find('.cmt-update-span').each(function() {
			$(this).show();
		})
		$('.cmt-td').find('.cmt-span-cancle').each(function() {
			$(this).hide();
		})
	}

	$(function() {
		function cmtList(page) {
			$.ajax({
						type : 'post',
						url : 'commCommentList.do',
						data : 'boardNum=${board.boardNum}&page=' + page,
						dataType : 'json',
						success : function(data) {
							var dataList = data['commentList'];
							$('#commentCount').html(data['totalCount']);
							$('#commentTable').empty();
							$
									.each(
											dataList,
											function(index, item) {
												var commentData = "<tr class='comment-"+item['commentNum']+"'>";
												commentData += "<td class='cmt-td'>"
														+ item['commentNum']
														+ "."
														+ item['name']
														+ "("
														+ item['regDate']
														+ ")";

												if (item['name'] == '${sessionScope.loginId}') {
													commentData += "<span class='cmt-update-span' id='cmt-update-span-"+item['commentNum']+"'>"
															+ "<a onclick='updateRegComment("
															+ item['commentNum']
															+ ")'>수정</a>&nbsp"
															+ "<a href='#' id='cmtDel'>"
															+ "<input type='hidden' value='"+item['commentNum']+"' id='cmtValDel'/>삭제</a></span>"
															+ "<span class ='cmt-span-cancle' id='cmt-span-cancle-"+item['commentNum']+"'>"
															+ "<a onclick='updateCancleCommnet("
															+ item['commentNum']
															+ ")'>수정취소</a></span>";

												}
												commentData += "</td></tr>";
												commentData += "<tr class='comment-"+item['commentNum']+"'>";
												commentData += "<td id='cmt-"+item['commentNum']+"' class='cmt-data-td'>"
														+ item['content'];

												commentData += "</td></tr>";
												$('#commentTable').append(
														commentData);
											})

							//코멘트 페이지
							var commentPage = "";

							for (var i = data['startPage']; i <= data['endPage']; i++) {
								commentPage += "<a href='#' class='cmtPage'>"
										+ i + "</a>&nbsp;";
							}

							$('#commentPage').html(commentPage);
						},
						error : function(request, response, error) {
							alert("code:  " + request.status + "\n"
									+ "error:  " + error + "\n" + "message:  "
									+ request.responseText);
						},
						complate : function(data) {
							alert('통신완료 data : ' + data.status);
						}
					})
		}

		$('#delBtn').click(function() {
			if (confirm('정말 삭제하시겠습니까?') == true) {
				location.href = "commDelete.do?boardNum="+'${board.boardNum}';
				return true
			}
		})

		$('#commentBtn').click(
				function() {
					var content = $('#replyContent').val();
					$.ajax({
						type : 'post',
						url : 'commComment.do',
						data : 'boardNum=${board.boardNum}&content=' + content
								+ '&writer=${board.writer}',
						dataType : 'json',
						success : function(data) {
							alert("답글 등록 완료하였습니다.");
							$('#replyContent').val("");
							cmtList(1);
						},
						error : function(request, response, error) {
							alert("code:  " + request.status + "\n"
									+ "message:  " + request.responseText
									+ "\n" + "error:  " + error);
						},
						complate : function(data) {
							alert('통신완료 data : ' + data.status);
						}
					})
				})

		//코멘트 수정 등록
		function updateComment(commentNum, content) {
			$.ajax({
				type : 'post',
				url : 'commUpdateComment.do',
				data : 'commentNum=' + commentNum + "&content=" + content,
				dataType : 'json',
				success : function(resultData) {
					cmtList(1);
				},
				error : function(request, response, error) {
					alert("코멘트 수정 err:" + error);
				}
			})
		}

		function deleteComment(commentNum) {
			if (confirm('정말 삭제하시겠습니까?') == true) {
				$.ajax({
					type : 'post',
					url : 'commDeleteComment.do',
					data : 'commentNum=' + commentNum,
					dataType : 'text',
					success : function(resultData) {
						/* if(resultData) $('.comment-'+commentNum).remove(); */
						cmtList(1);
					},
					error : function(request, response, error) {
						alert("deleteComment code:  " + request.status + "\n"
								+ "error:  " + error + "\n" + "message:  "
								+ request.responseText);
					}
				})
			} else {
				return;
			}
		}

		//코멘트 삭제
		$(document).on('click', '#cmtDel', function() {
			var delCmtNum = $(this).find('input').val();
			deleteComment(delCmtNum);
		})

		//코멘트 리스트 가져오기
		$(document).on('click', '.cmtPage', function() {
			var page = $(this).text();
			cmtList(page);
		});

		//코멘트 수정 등록
		$(document).on('click', '.btn-cmt-update', function() {
			var updateCmtNum = $(this).find('input').val();
			var updateContent = $('#input-cmt-' + updateCmtNum).val();
			updateComment(updateCmtNum, updateContent);
		});
		cmtList(1);
	})
	
	//높이 설정
	window.onload=function(){
	
	var parentDoc= window.parent.document;
	var ifrm = $(parentDoc).find('#the_iframe');
	
	var board_height = $(document).height();
	
	ifrm.attr('onload', "resizeFrame(this,'"+board_height+"px')");
	parent.resizeFrame(ifrm, board_height);
	};
</script>
</head>
<body>
	<div id="content">
		<table border="1">
			<tr>
				<td class="title">제목</td>
				<td colspan="3"><c:if test="${board.list != 0}">
						<c:forEach var="num" begin="1" end="${board.level}">
			답변 : 
			</c:forEach>
					</c:if> ${board.title}</td>
			</tr>
			<tr>
				<td class="title">작성자</td>
				<td class="">${board.writer}</td>

				<td class="title">작성일시</td>
				<td class="showDate">${board.writeDate}</td>

			</tr>
			<tr>
				<td class="title">내용</td>
				<td colspan="3" class="content">${board.content}</td>
			</tr>
		</table>
		답글 <span id="commentCount"></span>

		<div id="commentList">
			<table border="1" id="commentTable">
			</table>
		</div>

		
		
		<div id="commentPage"></div>
		<div id="inputComment">
			<c:if test="${not empty sessionScope.loginId}">
				<textarea rows="3" id="replyContent" placeholder="답글을 입력해주세요."></textarea>
				<input type="button" value="답글등록" id="commentBtn" />
			</c:if>
			
		</div>
		<div>
			<a href="commMain.do">[목록]</a> 
			<a href="commWriteForm.do?list=${board.list}&level=${board.level}&ridx=${board.ridx}">[댓글쓰기]</a>
			<c:if test="${sessionScope.loginId == board.writer}">
				<a href="commUpdateForm.do?boardNum=${board.boardNum}">[수정]</a>
				<a href="#" id="delBtn">[삭제]</a>
			</c:if>
		</div>
	</div>
</body>
</html>