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

<style type="text/css">
.form-control1 {
	display: inline;
	float: left;
	width: 350%;
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
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="card mb-3">
			<div class="card-header">
				<b style="color: #66FF66;"><i class="fa fa-check"></i></b> 쪽지확인 
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<div style="text-align: left;">
					<form action="messageWriteForm.do">
						<input type="hidden" name="receiveId" value="${message.receive_id}">
						<button type="submit" style="background: #f5f5f5; border-color: gray; border-radius: 5px; cursor: pointer;">
							<i class="fa fa-fw fa-plane"></i>재전송
						</button>
					</form>
					</div>
					<br>
					<b>받는사람 </b>${message.receive_id}
					<hr>
							<table>
								<tr>
									<td class="form-control1"><fmt:formatDate type="both" 
										value="${message.write_date}" dateStyle="short"
										timeStyle="short" /></td>
								</tr>
								<tr>
									<td><input type="text" class="form-control1" name="title"
											value="${message.title}" readonly="readonly"></td>
								</tr>
						
								<tr>
									<td>
										<textarea name="content" rows="20" cols="30" class="form-control1" readonly="readonly">${message.content}</textarea>
									</td>
								</tr>
							</table>
				</div>
			</div>
			<div class="card-footer small text-muted">Message Check</div>
		</div>
	</div>
</body>
</html>