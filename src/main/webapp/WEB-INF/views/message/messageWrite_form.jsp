<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- Bootstrap core CSS-->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link href="vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>쪽지함</title>
<script
  src="https://code.jquery.com/jquery-3.2.1.js"
  integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
  crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#sendForm').on('click', function() {
			var params = $('#formData').serialize();
			$.ajax({
				type : 'POST',
				url : './writeMessage.do',
				data : params,
				success : function(data) {
					if ($.trim(data) == 0) {
						alert("성공적으로 보내졌습니다.");
						location.href="sendMessage.do";
					} else if($.trim(data) == 1){
						alert("전송 실패했습니다.");
					} else{
						alert("받는 사람의 정보가 없습니다.")
					}
				}
			}); //end ajax    
			return false;
		}); //end on    
	});
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="card mb-3">
			<div class="card-header">
				<i class="fa fa-envelope"></i> 쪽지 쓰기
			</div>
			<div class="card-body">
				<div class="table-responsive">
				<form name="formData" id="formData">
					<div style="text-align: left;">
					<button type="submit" id="sendForm" style="background: #f5f5f5; border-color: gray; border-radius: 5px; cursor: pointer;">
							<i class="fa fa-fw  fa-paper-plane"></i>보내기
					</button>
					</div>
							<table>
								<tr>
									<td>받는 사람 :</td>
									<td><input type="text" name="receive_id" size="20"></td>
								</tr>
								<tr>
									<td>제목 :</td>
									<td><input type="text" name="title" size="20"></td>
								</tr>
								<tr>
									<td>내용 :</td>
									<td><textarea name="content" rows="20" cols="30"></textarea></td>
								</tr>
							</table>
				</form>
				</div>
			</div>
			<div class="card-footer small text-muted">Write Message</div>
		</div>
	</div>
</body>
</html>