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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://code.jquery.com/jquery-3.2.1.js"
	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#formData').on('submit', function() {
			var params = $('#formData').serialize();
			$.ajax({
				type : 'POST',
				url : './changeInfo.do',
				data : params,
				success : function(data) {
					if ($.trim(data) == 0) {
						alert("수정 되었습니다.");
						location.href="myPageMain.do";
					} else if($.trim(data) == 1){
						alert("비밀번호를 확인해주세요.");
					} else if($.trim(data) == 2){
						alert("회원정보 수정에 실패했습니다.");
					} else{
						alert("모든 항목을 입력하여주세요.");
					}
				}
			}); //end ajax    
			return false;
		}); //end on    
	});
	
	function checkValue() {
		if(formData.pw.value && formData.pwCheck.value) {
		  if(formData.pw.value!=formData.pwCheck.value){
		   formData.status.value = " ( 일치하지 않습니다. )";
	   	   formData.status.style.color="red";
		  } else {
		   formData.status.value = " ( 일치합니다. )";
		   formData.status.style.color="blue";
		  }
		} else {
		  formData.status.value = " ( 비밀번호를 입력해 주세요. ) ";
		  formData.status.style.color="blue";
		}
	}
</script>

<style type="text/css">
.form-control1 {
	display: inline;
	float: left;
	width: 70%;
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
				<i class="fa fa-user"></i> 회원정보 수정
			</div>
			<div class="card-body">
				<div align="center">
					<form name="formData" id="formData">
						<table>
							<tr>
								<td><input type="password" class="form-control1" name="pw"
									placeholder="비밀번호" value="${member.pw}" onblur=checkValue();></td>
							</tr>
							<tr>
								<td>
									<input type="password" class="form-control1"
										name="pwCheck" placeholder="비밀번호 확인" onblur=checkValue(); value="${member.pw}">
									<input type="text" name="status" style="border:0; color:blue; width: 240"
										 readonly onfocus="this.blur();" value=" ( 비밀번호를 입력해 주세요. )">
								</td>
							</tr>
							<tr>
								<td><input type="text" class="form-control1" name="name" value="${member.name}"
									placeholder="이름을 입력해 주세요"></td>
							</tr>
							<tr>
								<td><input type="email" class="form-control1" name="eMail" value="${member.eMail}"
									placeholder="이메일을 입력해 주세요"></td>
							</tr>
							<tr>
								<td><input type="text" class="form-control1" name="question" value="${member.question}"
									placeholder="아이디/패스워드 질문을 입력해 주세요"></td>
							</tr>
							<tr>
								<td><input type="text" class="form-control1" name="questionAnswer" value="${member.questionAnswer}"
									placeholder="질문의 답을 입력해주세요"></td>
							</tr>
							<tr>
								<td>
									<button type="submit" class="btn btn-info">
										수정 <i class="fa fa-check spaceLeft"></i>
									</button>
									<button type="button" class="btn btn-warning" onclick="location.href='myPageMain.do'">
										취소 <i class="fa fa-times spaceLeft"></i>
									</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div class="card-footer small text-muted"> Change memberInfo</div>
		</div>
	</div>
</body>
</html>