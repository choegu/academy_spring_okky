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
<script src="https://code.jquery.com/jquery-3.2.1.js"
	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#formData').on('submit', function() {
			var params = $('#formData').serialize();
			$.ajax({
				type : 'POST',
				url : './deleteSendCheck.do',
				data : params,
				success : function(data) {
					if($.trim(data) == 0){
						alert("삭제에 실패했습니다.");
					}else{
						alert("삭제되었습니다.")
						location.href="sendMessage.do?page=${messagePage.currentPage}";
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
				<i class="fa fa-envelope"></i> 보낸 쪽지함
			</div>
			<div class="card-body">
				<div class="table-responsive">
				<form name="formData" id="formData">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<td width="5%"><button title="선택 삭제" type="submit" style="background:#dcdcdc; border-radius:5px; cursor: pointer;"><i class="fa fa-fw fa-trash-o"></i></button></td>
								<td width="15%">받는 사람</td>
								<td width="50%">제목</td>
								<td width="30%">작성일</td>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty messagePage.messageList}">
								<tr>
									<td colspan="4"><span style="color: blue;">보낸 쪽지가 없습니다.</span></td>
								</tr>
							</c:if>
							<c:if test="${not empty messagePage.messageList}">
								<c:forEach items="${messagePage.messageList}" var="messageVO">
									<tr>
										<td style="text-align: center; padding-top: 16px;"><input type="checkbox" name="checkDelete" value="${messageVO.message_num}"/></td>
										<td>${messageVO.receive_id}</td>
										<c:if test="${messageVO.send_open == 1 }">
										<td><a href="sendMessageRead.do?message_num=${messageVO.message_num}">${messageVO.title}</a></td>
										</c:if>
										<c:if test="${messageVO.send_open == 2 }">
										<td><a href="sendMessageRead.do?message_num=${messageVO.message_num}"><span style="color: #333333">${messageVO.title}</span></a></td>
										</c:if>
										<td><fmt:formatDate type="both"
												value="${messageVO.write_date}" dateStyle="short"
												timeStyle="short" /></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					</form>
					<div style="text-align: center;">
						<c:if test="${messagePage.startPage!=1 }">
							<a href="sendMessage.do?page=${messagePage.startPage-1 }"><b><i class="fa fa-fw fa-angle-double-left"></i></b></a>
						</c:if>
							<c:forEach begin="${messagePage.startPage}"
								end="${messagePage.endPage}" var="p" step="1">
								<c:if test="${messagePage.currentPage == p}">
									&nbsp;<a href="sendMessage.do?page=${p}"><b style="color: red;">${p}</b></a>
								</c:if>
								<c:if test="${messagePage.currentPage != p}">
									&nbsp;<a href="sendMessage.do?page=${p}"><b>${p}</b></a>
								</c:if>
							</c:forEach>
						<c:if test="${messagePage.endPage!=messagePage.totalPage }">
							<a href="sendMessage.do?page=${messagePage.endPage+1 }"><b><i class="fa fa-fw fa-angle-double-right"></i></b></a>
						</c:if>
					</div> 
					<div style="text-align: right;">
						<a href="messageWriteForm.do" title="글쓰기"><button style="background:#dcdcdc; border-radius:5px; cursor: pointer;" ><i class="fa fa-fw fa-pencil"></i></button></a>	
						<a href="deleteSendAll.do" title="전체 삭제"><button style="background:#dcdcdc; border-radius:5px; cursor: pointer;" ><i class="fa fa-fw fa-trash"></i></button></a>
					</div>
				</div>
			</div>
			<div class="card-footer small text-muted">Send Message List</div>
		</div>
	</div>
</body>
</html>