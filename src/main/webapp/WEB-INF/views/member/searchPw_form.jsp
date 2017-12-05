<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<script src="https://code.jquery.com/jquery-3.2.1.js"
	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#formData').on('submit', function() {
			var params = $('#formData').serialize();
			$.ajax({
				type : 'POST',
				url : './searchPw.do',
				data : params,
				success : function(data) {
					if ($.trim(data) == '0'){
						alert("답을 다시 입력해주세요.");
					}else{
						var targetData = data;
						$('input[name=target]').attr('value',targetData);
					}
				}
			}); //end ajax    
			return false;
		}); //end on    
	});
	</script>

<style type="text/css">
.form-control1 {
	display: inline;
	float: left;
	width: 120%;
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-image: none;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	margin-bottom: 7px;
}

.form-control1::-ms-expand {
	background-color: transparent;
	border: 0
}

.form-control1:focus {
	color: #495057;
	background-color: #fff;
	border-color: #80bdff;
	outline: 0;
	box-shadow: 0 0 0 .2rem rgba(0, 123, 255, .25)
}

.form-control1::-webkit-input-placeholder {
	color: #868e96;
	opacity: 1
}

.form-control1:-ms-input-placeholder {
	color: #868e96;
	opacity: 1
}

.form-control1::-ms-input-placeholder {
	color: #868e96;
	opacity: 1
}

.form-control1::placeholder {
	color: #868e96;
	opacity: 1
}

.form-control1:disabled, .form-control[readonly] {
	background-color: #e9ecef;
	opacity: 1
}

.btn-info1 {
	color: #fff;
	background-color: #17a2b8;
	border-color: #17a2b8
}

.btn1 {
	display: inline-block;
	font-weight: 400;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	border: 1px solid transparent;
	padding: .300rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: .25rem;
	transition: background-color .15s ease-in-out, border-color .15s
		ease-in-out, box-shadow .15s ease-in-out
}
</style>

</head>
<body>
	<div class="container-fluid">
		<div class="card mb-3">
			<div class="card-header">
				<i class="fa fa-user"></i> 비밀번호 찾기
			</div>
			<div class="card-body">
				<div align="center">
				<form id="formData" name="fromData">
					<table>
						<tr>
							<td>
								<input type="text" class="form-control1" value="${question}" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" class="form-control1" id="questionAnswer" name="questionAnswer" 
										placeholder="답을 입력해주세요.">
							</td>
						</tr>
						<tr>
						<td>
							<input type="text" class="form-control1" name="target" placeholder="비밀번호 확인란" readonly="readonly">
						</td>
						</tr>
						<tr>
							<td>
								<div style="margin-left: 45px;">
									<button type="submit" class="btn btn-info">
										확인 <i class="fa fa-check spaceLeft"></i>
									</button>
									<button type="button" class="btn btn-warning"
										onclick="location.href='beforeSearchPw.do'">
										취소 <i class="fa fa-times spaceLeft"></i>
									</button>
									<input type="hidden" name="id" value="${id}">
								</div>
							</td>
						</tr>
					</table>
				</form>
				</div>
			</div>
			<div class="card-footer small text-muted">Search Pw</div>
		</div>
	</div>
</body>
</html>