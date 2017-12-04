<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>SB Admin - Start Bootstrap Template</title>
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
// 	do 요청 보내는곳
	$(function() {
		var categoryName;
		
		$('#all').click(function() {
			$('#target iframe').attr('src', 'board.do');
		})
		$('#java').click(function() {
			categoryName = $(this).text();
			$('#target iframe').attr('src', 'boardSearch.do?searchOption=category&category='+categoryName);
		})
		$('#javascript').click(function() {
			categoryName = $(this).text();
			$('#target iframe').attr('src', 'boardSearch.do?searchOption=category&category='+categoryName);
		})
		$('#css').click(function() {
			categoryName = $(this).text();
			$('#target iframe').attr('src', 'boardSearch.do?searchOption=category&category='+categoryName);
		})
		$('#jsp').click(function() {
			categoryName = $(this).text();
			$('#target iframe').attr('src', 'boardSearch.do?searchOption=category&category='+categoryName);
		})
		$('#spring').click(function() {
			categoryName = $(this).text();
			$('#target iframe').attr('src', 'boardSearch.do?searchOption=category&category='+categoryName);
		})
		$('#database').click(function() {
			categoryName = $(this).text();
			$('#target iframe').attr('src', 'boardSearch.do?searchOption=category&category='+categoryName);
		})
		$('#android').click(function() {
			categoryName = $(this).text();
			$('#target iframe').attr('src', 'boardSearch.do?searchOption=category&category='+categoryName);
		})
		$('#song').click(function() {
			categoryName = $(this).text();
			$('#target iframe').attr('src', 'boardSearch.do?searchOption=category&category='+categoryName);
		})
		$('#colloquialism').click(function() {
			categoryName = $(this).text();
			$('#target iframe').attr('src', 'boardSearch.do?searchOption=category&category='+categoryName);
		})
		$('#memo').click(function() {
			categoryName = $(this).text();
			$('#target iframe').attr('src', 'boardSearch.do?searchOption=category&category='+categoryName);
		})
		$('#etc').click(function() {
			categoryName = $(this).text();
			$('#target iframe').attr('src', 'boardSearch.do?searchOption=category&category='+categoryName);
		})		
	})
	function resizeFrame(frm) {
		frm.style.height = "auto";
// 		contentHeight = frm.contentWindow.document.body.scrollHeight;
// 		frm.style.height = contentHeight + 4 + "px";
		
		frm.style.height = 100 + "vh";
		
	}
</script>

</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav">
		<a class="navbar-brand" href="main.do">Knowledge Sharing!!</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
<!-- 			카테고리 부분 -->
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="전체보기"><a class="nav-link" href="#" id="all">
						<i class="fa fa-fw fa-inbox"></i><span class="nav-link-text">전체보기</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="IT"><a
					class="nav-link nav-link-collapse collapsed" data-toggle="collapse"
					href="#collapseComponents" data-parent="#exampleAccordion"> <i
						class="fa fa-fw  fa-list-alt"></i> <span class="nav-link-text">IT</span>
				</a>
					<ul class="sidenav-second-level collapse" id="collapseComponents">
						<li><a href="#" id="java">JAVA</a></li>
						<li><a href="#" id="javascript">JavaScript</a></li>
						<li><a href="#" id="css">CSS</a></li>
						<li><a href="#" id="jsp">JSP</a></li>
						<li><a href="#" id="spring">Spring</a></li>
						<li><a href="#" id="database">Database</a></li>
						<li><a href="#" id="android">Android</a></li>
					</ul></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="English"><a
					class="nav-link nav-link-collapse collapsed" data-toggle="collapse"
					href="#englishParents" data-parent="#exampleAccordion"> <i
						class="fa fa-fw  fa-list-alt"></i> <span class="nav-link-text">English</span>
				</a>
					<ul class="sidenav-second-level collapse" id="englishParents">
						<li><a href="#" id="song">SONG</a></li>
						<li><a href="#" id="colloquialism">구어체</a></li>
						<li><a href="#" id="memo">MEMO</a></li>
					</ul></li>		
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="ETC"><a class="nav-link" href="#" id="etc">
						<i class="fa fa-fw fa-list-alt"></i><span class="nav-link-text">ETC</span>
				</a></li>								
<!-- 			카테고리 끝 -->
			</ul>
			<ul class="navbar-nav sidenav-toggler">
				<li class="nav-item"><a class="nav-link text-center"
					id="sidenavToggler"> <i class="fa fa-fw fa-angle-left"></i>
				</a></li>
			</ul>
			<!-- 			메세지 부분 위에 해드  -->
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="study_room.jsp"><i
						class="fa fa-fw fa-book"></i>STUDY ROOM</a></li>
				<li class="nav-item"><a class="nav-link" href="community.jsp"><i
						class="fa fa-fw fa-comments-o"></i>COMMUNITY</a></li>
				<c:if test="${not empty sessionScope.loginId}">
					<li class="nav-item"><a class="nav-link" href="myPage.jsp">
						<i class="fa fa-fw  fa-user"></i>MY PAGE</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="modal" data-target="#exampleModal">
						<i class="fa fa-fw fa-unlock-alt"></i>LOGOUT</a></li>
				</c:if>
			</ul>
		</div>
	</nav>
	<div class="content-wrapper">
		<!-- 	iframe!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!자동 높이 조절 -->
		<div id="target">
<!-- 			첫화면 -->
			<iframe src="board.do" id="the_iframe" width="100%" 
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
						<h5 class="modal-title" id="exampleModalLabel">Ready to
							Leave?</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">Select "Logout" below if you are
						ready to end your current session.</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">Cancel</button>
						<a class="btn btn-primary" href="logOut.do">Logout</a>
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
