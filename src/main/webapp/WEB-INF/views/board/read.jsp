<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>READ</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<style type="text/css">
	textarea {
	    resize: none;
	}
</style>

<script type="text/javascript">
	function del_func() {
		var result = confirm('정말 삭제하시겠습니까?');
		if (result==true) {
			location.href="delete.do?board_num=${board.board_num}";
			return true;
		}
		return false;
	}

	var bno = '${board.board_num}'; //게시글 번호
	 
	$(function(){
		commentList();
		
		$('button[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
		    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
		    commentInsert(insertData); //Insert 함수호출(아래)
		});	
		
		

	})
	
	//댓글 목록 
	function commentList(){
	    $.ajax({
	        url : 'listComment.do',
	        type : 'get',
	        data : 'board_num=${board.board_num}',
	        dataType : 'json',
	        success : function(data){
	            var a =''; 
	            $.each(data, function(key, value){ 
	            	console.log(key+"success:"+value);
	                
	                console.log(value.comment_num+'test:'+value.content);
// 	                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
	                
	                if (value.open==2) {
	                	
	                } else if (value.open==3) {
	                	a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
	                	a += '삭제된 댓글입니다.';
	                	a += '</div>';
	                } else {
	                	a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
	                	for (var i = 0; i < value.level; i++) {
							a += 'Re: ';
						}
		                a += '<span class="commentInfo'+value.comment_num+'">'+'댓글번호 : '+value.comment_num+' / 작성자 : '+value.writer;
		                a += ' / 작성일 : '+value.write_date+' </span>';
		                a += '<span>';
		                if("${sessionScope.loginId}"== value.writer){
		                	a += '<a onclick="commentUpdate('+value.comment_num+');"> <input type="button" value="수정"></a>';
		                	a += ' <a href="#" id="btnCmtDel"><input type="button" value="삭제"></a>';
		                	
		            	}
		                a += ' <a onclick="commentReply('+value.comment_num+')"> <input type="button" value="대댓글"></a>';
		                a += '<input type="hidden" name="cno" value="'+value.comment_num+'"/></span>';
		                
		                var text_content = value.content.replace(/\n/gi,"<br>");
		                a += '<div class="commentContentH'+value.comment_num+'"> <p> 내용 :<br> '+text_content+'</p></div>';
		        	    a += '<div class="commentContentT'+value.comment_num+'" style="display: none">';
		        	    a += '<textarea class="form-control" rows="3" name="content_'+value.comment_num+'">'+value.content+'</textarea>';
		        	    a += '<button class="btn btn-default" type="button" onclick="commentUpdateProc('+value.comment_num+');">확인</button></div> ';
		        	    a += '<div class="commentReply'+value.comment_num+'" style="display: none">';

		        	    a += '<textarea class="form-control" rows="3" name="reply_'+value.comment_num+'"></textarea>';
		        	    a += '<button class="btn btn-default" type="button" onclick="commentReplyProc('+value.comment_num+');">등록</button></div> ';
		        	    a += '</div>';
	                } 
					
// 	                a += '</div>';
	            });
	            
	            $(".commentList").html(a);
	            
	            $(document).on("click","#btnCmtDel",function(){
	            	var cmtNum = $(this).siblings('input[name=cno]').val();
	            	commentDelete(cmtNum);
	            })
//      	        $(document).on("click","#btnCmtRep",function(){
// 	            	var cmtNum = $(this).siblings('input[name=cno]').val();
// 	            	commentReply(cmtNum);
// 	            })
				
	        },
	        error:function(e){
	        	$.each(e,function(key,value){
	        		console.log("error/"+value);
	        	})
	        	alert('error:'+e)
	        }
	    });
	}
//  		var target_div = $(parentDoc).find('#target');
//  		var content_div = $(parentDoc).find('.content-wrapper');
	
	$(document).ajaxStop(function(){
		var parentDoc= window.parent.document;
 		var ifrm = $(parentDoc).find('#the_iframe');
 		
 		var board_height = $(document).height();
 		
 		ifrm.attr('onload', "resizeFrame(this,'"+board_height+"px')");
 		parent.resizeFrame(ifrm, board_height);
	})
	
	$( document ).ajaxComplete(function( event, request, settings ) {
// 	    var modal = $('#YOUR_ID'),
// 	    contents = modal.find(".modal-contents").first();
// 	    alert(contents.height());
	    
	    var parent= window.parent.document;
// 		var ifrm = $(parent).find('#the_iframe');

// 		var ifrm = $(parent).find('body');
// 		var target_div = $(parent).find('#target');
// 		var content_div = $(parent).find('.content-wrapper');
// 		var board_height = $(document).height();
// 		ifrm.attr('onload', "resizeFrame(this,'"+board_height+"px')");
		
// 		alert(board_height+"/"+(board_height+100));
// 		target_div.css('height', board_height+100);
// 		content_div.css('height', board_height+200);
	});

	 
	//댓글 등록
	function commentInsert(insertData){
	    $.ajax({
	        url : 'insertComment.do',
	        type : 'post',
	        data : insertData,
	        success : function(data){
	            if(data == 1) {
		        	alert('댓글이 등록되었습니다.');
	                commentList(); //댓글 작성 후 댓글 목록 reload
	                $('[name=content]').val('');
	            } else {
		        	$('body').append(data);
	            }
	        },
	        error:function(){
	        	alert('댓글 등록 실패.')
	        }
	    });
	}

	
	//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
	function commentUpdate(comment_num){
		$.ajax({
	    	
	        url : 'listCommentCno.do',
	        type : 'get',
	        data : 'board_num=${board.board_num}',
	        dataType : 'json',
	        success : function(data){
	        	$.each(data, function(key, value){ 
	        		if (comment_num!=value) {
	        			$('.commentContentH'+value).show();
	        		    $('.commentContentT'+value).hide();
	        		    $('.commentReply'+value).hide();
	        		} else {
	        			$('.commentReply'+value).hide();
	        		}
	        		
	        	});
	        },
	        error:function(){
	        	alert(bno+'댓글 ajax 실패.');
	        }
	    });
		
		$('.commentContentH'+comment_num).toggle();
	    $('.commentContentT'+comment_num).toggle();
	}
	
	//대댓글 - 대댓글 내용 출력을 input 폼으로 변경 
	function commentReply(comment_num){
	    $.ajax({
	    	
	        url : 'listCommentCno.do',
	        type : 'get',
	        data : 'board_num=${board.board_num}',
	        dataType : 'json',
	        success : function(data){
	        	$.each(data, function(key, value){ 
	        		if (comment_num!=value) {
	        			$('.commentContentH'+value).show();
	        		    $('.commentContentT'+value).hide();
	        			$('.commentReply'+value).hide();
	        		} else {
	        			$('.commentContentH'+value).show();
	        		    $('.commentContentT'+value).hide();
	        		}
	        		
	        	});
	        },
	        error:function(){
	        	alert(bno+'대댓글 ajax 실패.');
	        }
	    });
		
	    $('.commentReply'+comment_num).toggle();
	    
	}
	 
	//댓글 수정
	function commentUpdateProc(comment_num){
	    var updateContent = $('[name=content_'+comment_num+']').val();
	    
	    $.ajax({
	        url : 'updateComment.do',
	        type : 'post',
	        data : 'content='+updateContent+'&comment_num='+comment_num,
	        dataType : 'text',
	        success : function(data){
	            if(data == 1) {
	            	alert('댓글이 수정되었습니다');
	            	commentList(); //댓글 수정후 목록 출력 
	            } else {
	            	$('body').append(data);
	            }
	        }
	    });
	}
	
	//대댓글 등록
	function commentReplyProc(comment_num){
	    var replyContent = $('[name=reply_'+comment_num+']').val();
	    
	    $.ajax({
	        url : 'replyComment.do',
	        type : 'post',
	        data : 'content='+replyContent+'&board_num=${board.board_num}&ref_comment_num='+comment_num,
	        dataType : 'text',
	        success : function(data){
	            if(data == 1) {
		        	alert('대댓글이 등록되었습니다.');
	                commentList(); //댓글 작성 후 댓글 목록 reload
	                $('[name=content]').val('');
	            } else {
		        	$('body').append(data);
	            }
	        }
	    });
	}
	 
	//댓글 삭제 
	function commentDelete(comment_num){
	    $.ajax({
	        url : 'deleteComment.do',
	        type : 'post',
	        data : 'comment_num='+comment_num,
	        dataType : 'json',
	        success : function(d){
	        	alert('댓글이 삭제되었습니다');
	            if(d == 1) {
	            	commentList(); //댓글 삭제후 목록 출력 
	            } else {
	            	$('body').append(data);
	            }
	        },
	        error:function(){
	        	alert('error');
	        }
	    });
	}
	
	$(function(){
		$(document).on('click',"")
	})
</script>
</head>
<body>
	<table class="table">
		<tr>
			<td>제목 : </td>
			<td>${board.title }</td>
		</tr>
		<tr>
			<td>작성자 : </td>
			<td>${board.writer }</td>
		</tr>
		<tr>
			<td>조회수 : </td>
			<td>${board.read_count }</td>
		</tr>
		<tr>
			<td>작성일시 : </td>
			<td><fmt:formatDate value="${board.write_date }" type="both" dateStyle="short" timeStyle="short"/></td>
		</tr>
		<tr>
			<td colspan="2">${board.content }</td>
		</tr>
	
	</table>

	<a href="board.do">[목록]</a>
	<c:if test="${not empty sessionScope.loginId }">
		<a href="updateForm.do?board_num=${board.board_num }">[수정]</a>
		<a href="replyForm.do?board_num=${board.board_num }">[답변]</a>
		<a href="#" onclick="del_func()">[삭제]</a>
	</c:if>
	
	<!--  댓글  -->
	<div class="container">
        <div class="commentList"></div>
    </div>
    
    <div class="container">
        <label for="content">comment</label>
        <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="board_num" value="${board.board_num}"/>
               <textarea class="form-control" id="content" name="content" rows="4"></textarea>
               <span class="input-group-btn">
                    <button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
               </span>
              </div>
        </form>
    </div>
 
    
</body>
</html>