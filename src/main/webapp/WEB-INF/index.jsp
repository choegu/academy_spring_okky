<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Main</title>
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
	$(function() {
		$('#join').click(function() {
			$('#target iframe').attr('src', 'joinForm.do');
		})
		$('#searchId').click(function() {
			$('#target iframe').attr('src', 'searchIdForm.do');
		})
		$('#searchPw').click(function() {
			$('#target iframe').attr('src', 'beforeSearchPw.do');
		})
		$('#newMessage').click(function(){
			$('#target iframe').attr('src', 'receiveMessage.do');
		})
	})
	function resizeFrame(frm) {
		frm.style.height = "auto";
		contentHeight = frm.contentWindow.document.body.scrollHeight;
		frm.style.height = contentHeight + 4 + "px";
	}
</script>

</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav">
		<a class="navbar-brand" href="main.do"><b> Knowledge Sharing!!</b></a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
			<c:if test="${empty sessionScope.loginId}">
				<li class="nav-item" data-toggle="tooltip" data-placement="right" title="로그인">
					<form action="login.do" method="post"> 
						<table>
					 		<tr><input style="margin-top:20px; margin-left: 4px; margin-bottom: 4px;" type="text" class="form-control" name="id" placeholder="UserId" autofocus></tr>
					 		<tr><input style="margin-left: 4px; margin-bottom: 4px;" type="password" class="form-control" name="pw" placeholder="Password"></tr>
					 		<tr><button style="margin-left: 4px; margin-bottom: 4px; cursor: pointer;" type="submit" class="form-control btn btn-primary" >LOGIN</button></tr>
					 	</table>
					</form>		 	
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="회원가입"><a class="nav-link" href="#" id="join">
						<i class="fa fa-fw  fa-user-plus"></i>
						<span class="nav-link-text">회원 가입</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right" title="아이디/비밀번호 찾기">
					<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse"
						href="#collapseComponents" data-parent="#exampleAccordion"> 
					<i class="fa fa-fw fa-key"></i><span class="nav-link-text">아이디/비밀번호 찾기</span>
					</a>
					<ul class="sidenav-second-level collapse" id="collapseComponents">
						<li><a href="#" id="searchId">아이디 찾기</a></li>
						<li><a href="#" id="searchPw">비밀번호 찾기</a></li>
					</ul>
				</li>
			</c:if>
			<c:if test="${not empty sessionScope.loginId}">
				<li class="nav-item" data-toggle="tooltip" data-placement="right" title="로그인 정보">
							 	d
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="새로운 쪽지"><a class="nav-link" href="#" id="newMessage">
						<i class="fa fa-fw fa-envelope-o"></i>
						<span class="nav-link-text">New Message <b style="color: red">${noCheck}</b></span></a>
				</li>
			</c:if>
			</ul>
			<ul class="navbar-nav sidenav-toggler">
				<li class="nav-item"><a class="nav-link text-center"
					id="sidenavToggler"> <i class="fa fa-fw fa-angle-left"></i>
				</a></li>
			</ul>
			<!-- 			메세지 부분 위에 해드  -->
						<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="study_room.jsp"><i
						class="fa fa-fw fa-book"></i><b>STUDY ROOM</b></a></li>
				<li class="nav-item"><a class="nav-link" href="community.jsp"><i
						class="fa fa-fw fa-comments-o"></i><b>COMMUNITY</b></a></li>
				<c:if test="${empty sessionScope.loginId}">
					<li class="nav-item"><a class="nav-link" href="index.jsp">
						<b style="color: #66FF66;"><i class="fa fa-fw fa-lock"></i>LOGIN</b></a></li>
				</c:if>		
				<c:if test="${not empty sessionScope.loginId}">
					<li class="nav-item"><a class="nav-link" href="myPage.jsp">
						<i class="fa fa-fw  fa-user"></i><b>MY PAGE</b></a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="modal" data-target="#exampleModal">
						<b style="color: #FF3300;"><i class="fa fa-fw fa-unlock-alt"></i>LOGOUT</b></a></li>
				</c:if>
			</ul>
		</div>
	</nav>
	<div class="content-wrapper">
		<!-- 	iframe!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!자동 높이 조절 -->
		<div id="target">
			<iframe src="main_page.html" id="the_iframe" width="100%"
				onload=resizeFrame(this) frameborder=0 framespacing=0 marginheight=0
				marginwidth=0 scrolling=no vspace=0></iframe>
		</div>
		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fa fa-angle-up"></i>
		</a>
		<!-- Logout Modal-->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">Ready to
							Leave?</div>
					<div class="modal-footer">
						<a class="btn btn-primary" href="logOut.do">Logout</a>
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">Cancel</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Bootstrap core JavaScript-->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- Core plugin JavaScript-->
		<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
		<!-- Page level plugin JavaScript-->
		<script src="vendor/chart.js/Chart.min.js"></script>
		<script src="vendor/datatables/jquery.dataTables.js"></script>
		<script src="vendor/datatables/dataTables.bootstrap4.js"></script>
		<!-- Custom scripts for all pages-->
		<script src="js/sb-admin.min.js"></script>
		<!-- Custom scripts for this page-->
		<script src="js/sb-admin-datatables.min.js"></script>
		<script src="js/sb-admin-charts.min.js"></script>
	</div>
</body>

</html>
