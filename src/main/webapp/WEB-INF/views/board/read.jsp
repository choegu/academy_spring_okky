<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>READ</title>
<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- �ΰ����� �׸� -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<style type="text/css">
	.container {
		width: 90%;
	}

	textarea {
	    resize: none;
	}
	
	#bottom {
		text-align: right;
	}
	
	#articleInfo {
		border: 10px solid #A9E2F3;
/* 		background-color: #E0F8F7; */
	}
	
	#articleTitle {
	}
	
	#bodyContent {
		border: 1px solid silver;
		padding-top: 10px;
	}

</style>

<script type="text/javascript">
	function del_func() {
		var result = confirm('���� �����Ͻðڽ��ϱ�?');
		if (result==true) {
			location.href="delete.do?board_num=${board.board_num}";
			return true;
		}
		return false;
	}

	var bno = '${board.board_num}'; //�Խñ� ��ȣ
	 
	$(function(){
		commentList();
		
		$('button[name=commentInsertBtn]').click(function(){ //��� ��� ��ư Ŭ���� 
		    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm�� ������ ������
		    commentInsert(insertData); //Insert �Լ�ȣ��(�Ʒ�)
		});	
		
		

	})
	
	//��� ��� 
	function commentList(){
	    $.ajax({
	        url : 'listComment.do',
	        type : 'get',
	        data : 'board_num=${board.board_num}',
	        dataType : 'json',
	        success : function(data){
	            var a ='';
	            var replyLevel;
	            var replyStart;
	            var replyZero;
	            $.each(data, function(key, value){ 
	            	console.log(key+"success:"+value);
	                console.log(value.comment_num+'test:'+value.content);
	                replyLevel=0;
	                replyStart=0;
	                replyZero=0;
	                for (var i = 0; i < value.level; i++) {
                		replyLevel += 50;
					}	
	                if (value.level==0) {
	                	replyZero=10;
	                }
// 	                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
	                
	                if (value.open==2) {
	                	
	                } else if (value.open==3) {
	                	a += '<div class="commentArea" style="border-bottom:1px dotted darkgray; margin-top: '+replyZero+'px; background-color:#E0F8E0; min-height:50px; margin-left: '+replyLevel+'px">';
	                	if (value.level!=0) {
		                	a += '<img src="img/replyComment.PNG" style="position: relative; left: -38px;">';
	                		replyStart = -38;
	                	}	            
	                	a += '<span style="position: relative; left: '+replyStart+'px;">[������ ����Դϴ�.]</span>';	                	
	                	a += '</div>';
	                } else {
// 	                	for (var i = 0; i < value.level; i++) {
// 	                		if (i!=0) {
// 								a += '&nbsp;&nbsp;&nbsp;';
// 							}
// 							if (i==value.level-1) {
// 								a += '<b>�� </b>';
// 							}
// 						}
	                	                	
	                	a += '<div class="commentArea" style="border-bottom:1px dotted darkgray; margin-top: '+replyZero+'px; background-color:#E0F8E0; margin-left: '+replyLevel+'px">';
	                	
	                	if (value.level!=0) {
		                	a += '<img src="img/replyComment.PNG" style="position: relative; left: -38px;">';
	                		replyStart = -38;
	                	}
		                
	                	a += '<span class="commentInfo'+value.comment_num+'" style="position: relative; left: '+replyStart+'px;"> <b>�� '+value.writer+'</b>';
		                a += ' ('+value.write_date+') </span>';
		                a += '<span style="position: relative; left: '+replyStart+'px;">';
		                if("${sessionScope.loginId}"== value.writer){
		                	a += '<a onclick="commentUpdate('+value.comment_num+');"> <input type="button" value="����"></a>';
		                	a += ' <a href="#" id="btnCmtDel"><input type="button" value="����"></a>';
		                	
		            	}
		                a += ' <a onclick="commentReply('+value.comment_num+')"> <input type="button" value="����"></a>';
		                a += '<input type="hidden" name="cno" value="'+value.comment_num+'"/></span>';
		                
		                var text_content = value.content.replace(/\n/gi,"<br>");
		                a += '<div class="commentContentH'+value.comment_num+'"> <p><br> ';
// 	                	for (var i = 0; i < value.level; i++) {
// 	                		if (i==0) {
// 								a += '&nbsp;&nbsp;';
// 							}
// 							a += '&nbsp;&nbsp;&nbsp;';
// 						}		                
		                a += text_content+'</p></div>';
		        	    a += '<div class="commentContentT'+value.comment_num+'" style="display: none; text-align:right;">';
		        	    a += '<textarea class="form-control" rows="6" name="content_'+value.comment_num+'">'+value.content+'</textarea>';
		        	    a += '<button class="btn btn-default" type="button" onclick="commentUpdateProc('+value.comment_num+');">Ȯ��</button></div> ';
		        	    a += '<div class="commentReply'+value.comment_num+'" style="display: none; text-align:right;">';

		        	    a += '<textarea class="form-control" rows="3" name="reply_'+value.comment_num+'"></textarea>';
		        	    a += '<button class="btn btn-default" type="button" onclick="commentReplyProc('+value.comment_num+');">���</button></div> ';
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
 		
 		var board_height = $(document).height()+100;
 		
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

	 
	//��� ���
	function commentInsert(insertData){
	    $.ajax({
	        url : 'insertComment.do',
	        type : 'post',
	        data : insertData,
	        success : function(data){
	            if(data == 1) {
		        	alert('����� ��ϵǾ����ϴ�.');
	                commentList(); //��� �ۼ� �� ��� ��� reload
	                $('[name=content]').val('');
	            } else {
		        	$('body').append(data);
	            }
	        },
	        error:function(){
	        	alert('��� ��� ����.')
	        }
	    });
	}

	
	//��� ���� - ��� ���� ����� input ������ ���� 
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
	        	alert(bno+'��� ajax ����.');
	        }
	    });
		
		$('.commentContentH'+comment_num).toggle();
	    $('.commentContentT'+comment_num).toggle();
	}
	
	//���� - ���� ���� ����� input ������ ���� 
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
	        	alert(bno+'���� ajax ����.');
	        }
	    });
		
	    $('.commentReply'+comment_num).toggle();
	    
	}
	 
	//��� ����
	function commentUpdateProc(comment_num){
	    var updateContent = $('[name=content_'+comment_num+']').val();
	    
	    $.ajax({
	        url : 'updateComment.do',
	        type : 'post',
	        data : 'content='+updateContent+'&comment_num='+comment_num,
	        dataType : 'text',
	        success : function(data){
	            if(data == 1) {
	            	alert('����� �����Ǿ����ϴ�');
	            	commentList(); //��� ������ ��� ��� 
	            } else {
	            	$('body').append(data);
	            }
	        }
	    });
	}
	
	//���� ���
	function commentReplyProc(comment_num){
	    var replyContent = $('[name=reply_'+comment_num+']').val();
	    
	    $.ajax({
	        url : 'replyComment.do',
	        type : 'post',
	        data : 'content='+replyContent+'&board_num=${board.board_num}&ref_comment_num='+comment_num,
	        dataType : 'text',
	        success : function(data){
	            if(data == 1) {
		        	alert('������ ��ϵǾ����ϴ�.');
	                commentList(); //��� �ۼ� �� ��� ��� reload
	                $('[name=content]').val('');
	            } else {
		        	$('body').append(data);
	            }
	        }
	    });
	}
	 
	//��� ���� 
	function commentDelete(comment_num){
	    $.ajax({
	        url : 'deleteComment.do',
	        type : 'post',
	        data : 'comment_num='+comment_num,
	        dataType : 'json',
	        success : function(d){
	            if(d == 1) {
		        	alert('����� �����Ǿ����ϴ�');
	            	commentList(); //��� ������ ��� ��� 
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
	<div class="container" id="articleInfo">
		<h4 id="articleTitle"><b>${board.title }</b></h4>
		ī�װ� : ${board.category}<br>
		�ۼ��� : ${board.writer }<br>
		��ȸ�� : ${board.read_count }<br>
		�ۼ��Ͻ� : <fmt:formatDate value="${board.write_date }" type="both" dateStyle="short" timeStyle="short"/><br>
		
		�������� : 
		<c:if test="${board.open==0 }">
			�����
		</c:if>
		<c:if test="${board.open==1 }">
			����
		</c:if>
	</div>
	
	<div class="container" id="bodyContent">
		${board.content }
	</div>
	
	<div class="container" id="bottom">
		<a href="board.do"><button>���</button></a>
		<c:if test="${not empty sessionScope.loginId }">
			<a href="updateForm.do?board_num=${board.board_num }"><button>����</button></a>
			<a href="replyForm.do?board_num=${board.board_num }"><button>�亯</button></a>
			<a href="#" onclick="del_func()"><button>����</button></a>
		</c:if>
	</div>
	<p>
	
	<!--  ���  -->
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
                    <button class="btn btn-default" type="button" name="commentInsertBtn">���</button>
               </span>
              </div>
        </form>
    </div>
 
    
</body>
</html>