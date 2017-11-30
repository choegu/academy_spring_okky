<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="cache-control" content="max-age=0" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
<meta http-equiv="pragma" content="no-cache" />
<title>WRITE FORM</title>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css" rel="stylesheet">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.js"></script> 

<!-- Bootstrap core CSS-->
<!-- <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- Custom fonts for this template-->
<!-- <link href="vendor/font-awesome/css/font-awesome.min.css" -->
<!-- 	rel="stylesheet" type="text/css"> -->
<!-- Page level plugin CSS-->
<!-- <link href="vendor/datatables/dataTables.bootstrap4.css" -->
<!-- 	rel="stylesheet"> -->

<!-- <script src="https://code.jquery.com/jquery-3.2.1.js" -->
<!-- 	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" -->
<!-- 	crossorigin="anonymous"></script> -->


<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!-- <script src="./ckeditor.js"></script> -->
<!-- <script src="./js/sample.js"></script> -->
<!-- 	<link rel="stylesheet" href="css/samples.css"> -->
<!-- <link rel="stylesheet" href="toolbarconfigurator/lib/codemirror/neo.css"> -->

<script>
// function readURL(input) {

// 	  if (input.files && input.files[0]) {
// 	    var reader = new FileReader();

// 	    reader.onload = function(e) {
// 	    	var addImg = '<div style="position: relative; z-index: 100;width: 100%;height: 100%;text-align: center;background: white;opacity: 0.75;pointer-events:none"><img src="'+e.target.result+'" style="width: 130px;height: 130px;margin-top: 100px;"></div>'
// // 	      $('#target').attr('src', e.target.result);
// 	    	$('iframe').contents().find('body').find('p').append(addImg);
// 	    }

// 	    reader.readAsDataURL(input.files[0]);
// 	  }
// 	}
// 	$(function(){
// // 		$('#submit').click(function(){
// 		$('form').submit(function(){
// // 			var content = $('iframe').contents().find('body').html();
// 			var content = $('.note-editable').html();
			
// 			console.log('con:'+content);
// 			$('#content').val(content);
// 			return false;
// 		})
		
// 		$('#btnFile').change(function (){
// 		      readURL(this);
// 		});
// 	})

	

</script>

<!-- <script src="../../../ckeditor.js"></script> -->
<!-- 	<script src="js/sample.js"></script> -->
<!-- 	<link rel="stylesheet" href="css/samples.css"> -->
<!-- 	<link rel="stylesheet" href="toolbarconfigurator/lib/codemirror/neo.css"> -->

<!-- include summernote css/js-->


</head>
<body id="main">
	<form action="write.do" method="post">
		力格 :
		<c:choose>
			<c:when test="${task=='write' }">
				<input type="text" name="title" size="20">
			</c:when>
			<c:when test="${task=='update' }">
				<input type="text" name="title" size="20" value="${original.title }">
			</c:when>
			<c:otherwise>
				<input type="text" name="title" size="20" value="Re:${reply.title }">
			</c:otherwise>
		</c:choose>
		<br>
		<!--				
				<c:choose>
					<c:when test="${task=='write' }">
						<td><textarea name="content" rows="20" cols="40"></textarea></td>
					</c:when>
					<c:when test="${task=='update' }">
						<td><textarea rows="20" cols="30" name="content">${original.content }</textarea></td>
					</c:when>
					<c:otherwise>
						<td><textarea rows="20" cols="30" name="content">${reply.content }</textarea></td>
					</c:otherwise>
				</c:choose>
				-->


<!-- 		<div class="adjoined-bottom"> -->
<!-- 			<div class="grid-container"> -->
<!-- 				<div class="grid-width-100"> -->
<!-- 					<div id="editor"> -->
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${task=='write' }"> --%>
<%-- 							</c:when> --%>
<%-- 							<c:when test="${task=='update' }"> --%>
<%-- 								<p>${original.content }</p> --%>
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<%-- 								<p>${reply.content }</p> --%>
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
		
<!-- 	<script> 
 		initSample();
		</script> -->

		

		<input type="hidden" id="content" name="content" value="">
		<div id="summernote">
			<p>
				<c:choose>
					<c:when test="${task=='write' }">
					</c:when>
					<c:when test="${task=='update' }">
						<p>${original.content }</p>
					</c:when>
					<c:otherwise>
						<p>${reply.content }</p>
					</c:otherwise>
				</c:choose>

			</p>
		</div>
		<c:choose>
			<c:when test="${task=='write' }">
				<input type="hidden" name="ref_num" value="0">
				<input type="hidden" name="task" value="write">
			</c:when>
			<c:when test="${task=='update' }">
				<input type="hidden" name="ref_num" value="${original.board_num }">
				<input type="hidden" name="task" value="update">
			</c:when>
			<c:otherwise>
				<input type="hidden" name="ref_num" value="${reply.board_num }">
				<input type="hidden" name="task" value="reply">
			</c:otherwise>
		</c:choose>
		<br> <input type="submit" id="submit" value="累己肯丰">

	</form>
<!-- <input type="file" id="btnFile" value="颇老梅何"> -->
<!-- <img src="" id="target"> -->

		<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
		<script type="text/javascript">
		$(document).ready(function() {
	        $('#summernote').summernote({
	        	height:300
	        });
	        
			$('form').submit(function(){
//	 			var content = $('iframe').contents().find('body').html();
				var content = $('.note-editable').html();
				
// 				console.log('con:'+content);
				$('#content').val(content);
// 				return false;
			})
			
			$('#btnFile').change(function (){
			      readURL(this);
			});
	        
	    });
		</script>
</body>
</html>