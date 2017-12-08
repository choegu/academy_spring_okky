<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
	<div class="container-fluid">
		<div class="card mb-3">
			<div class="card-header">
				<i class="fa fa-user"></i> 내 정보
			</div>
			<div class="card-body">
				<div align="center">
					<div class="container-fluid well span6">
						<div class="row-fluid">
							<div class="span2">
								<c:if test="${writingCount <10}">
									<img src="img/start.JPG" class="img-circle">
								</c:if>
							</div>
							<div class="span8">
								<h5><b>작성한 글:</b> ${writingCount}</h5>
								<br>
								<h5><b>ID:</b> ${member.id}</h5>
								<h5><b>Name:</b> ${member.name}</h5>
								<h5><b>Email:</b> ${member.eMail}</h5>
								<h5><b>Join-Date:</b> <fmt:formatDate type="both"
										value="${member.join_date}" dateStyle="short"
										timeStyle="short" /></h5>
							</div>
							<div class="span2">
								<div class="btn-group">
									<button type="Button" class="btn btn-warning" onclick="location.href='beforeMemberLeave.do'">
										회원탈퇴 <i class="fa fa-check spaceLeft"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card-footer small text-muted">My Info</div>
		</div>
	</div>
</body>
</html>