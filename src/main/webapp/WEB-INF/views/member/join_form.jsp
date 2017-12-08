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
		$('#checkBtn').on('click', function() {
			$.ajax({
				type : 'POST',
				url : './checkId.do',
				data : {
					"id" : $('#id').val()
				},
				success : function(data) {
					if ($.trim(data) == 0) {
						alert("��� ����");
					} else if($.trim(data) == 1) {
						alert("��� �Ұ���");
					} else{
						alert("���̵� �Է����ּ���.");
					}
				}
			}); //end ajax    
			return false;
		}); //end on    
		$('#formData').on('submit', function() {
			var params = $('#formData').serialize();
			$.ajax({
				type : 'POST',
				url : './join.do',
				data : params,
				success : function(data) {
					if ($.trim(data) == 0) {
						alert("ȸ������ �Ǿ����ϴ�.");
						parent.location.href="main.do";
					} else if($.trim(data) == 1){
						alert("���̵� �ߺ� üũ�� ���ּ���.");
					} else if($.trim(data) == 2){
						alert("��й�ȣ�� Ȯ�����ּ���.");
					} else if($.trim(data) == 3){
						alert("ȸ�����Կ� �����߽��ϴ�.");
					} else{
						alert("��� �׸��� �Է��Ͽ��ּ���.");
					}
				}
			}); //end ajax    
			return false;
		}); //end on    
	});
	
	function checkValue() {
		if(formData.pw.value && formData.pwCheck.value) {
		  if(formData.pw.value!=formData.pwCheck.value){
		   formData.status.value = " ( ��ġ���� �ʽ��ϴ�. )";
	   	   formData.status.style.color="red";
		  } else {
		   formData.status.value = " ( ��ġ�մϴ�. )";
		   formData.status.style.color="blue";
		  }
		} else {
		  formData.status.value = " ( ��й�ȣ�� �Է��� �ּ���. ) ";
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
				<i class="fa fa-user"></i> ȸ�� ����
			</div>
			<div class="card-body">
				<div align="center">
					<form name="formData" id="formData">
						<table>
							<tr>
								<td><input type="text" name="id" id="id" class="form-control1"
									placeholder="���̵�" style='text-transform: lowercase;'>
									<button class="btn1 btn-info1" id="checkBtn">�ߺ� Ȯ��</button></td>
							</tr>
							<tr>
								<td><input type="password" class="form-control1" name="pw"
									placeholder="��й�ȣ" onblur=checkValue();></td>
							</tr>
							<tr>
								<td>
									<input type="password" class="form-control1"
										name="pwCheck" placeholder="��й�ȣ Ȯ��" onblur=checkValue();>
									<input type="text" name="status" style="border:0; color:blue; width: 240"
										 readonly onfocus="this.blur();" value=" ( ��й�ȣ�� �Է��� �ּ���. )">
								</td>
							</tr>
							<tr>
								<td><input type="text" class="form-control1" name="name"
									placeholder="�̸��� �Է��� �ּ���"></td>
							</tr>
							<tr>
								<td><input type="email" class="form-control1" name="eMail"	
									placeholder="�̸����� �Է��� �ּ���"></td>
							</tr>
							<tr>
								<td><input type="text" class="form-control1" name="question"
									placeholder="���̵�/�н����� ������ �Է��� �ּ���"></td>
							</tr>
							<tr>
								<td><input type="text" class="form-control1" name="questionAnswer"
									placeholder="������ ���� �Է����ּ���"></td>
							</tr>
							<tr>
								<td>
									<button type="submit" class="btn btn-info">
										ȸ������ <i class="fa fa-check spaceLeft"></i>
									</button>
									<button type="button" class="btn btn-warning" onclick="location.href='main_page.html'">
										������� <i class="fa fa-times spaceLeft"></i>
									</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div class="card-footer small text-muted">Join Member</div>
		</div>
	</div>
</body>
</html>