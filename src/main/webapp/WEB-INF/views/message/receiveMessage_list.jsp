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


</head>
<body>
	<div class="container-fluid">
		<div class="card mb-3">
			<div class="card-header">
				<i class="fa fa-envelope"></i> 받은 쪽지함
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<td width="5%"><i class="fa fa-fw fa-trash-o"></i></td>
								<td width="15%">작성자</td>
								<td width="50%">제목</td>
								<td width="30%">작성일</td>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty messagePage.messageList}">
								<tr>
									<td colspan="4"><span style="color: blue;">받은 쪽지가 없습니다.</span></td>
								</tr>
							</c:if>
							<c:if test="${not empty messagePage.messageList}">
								<c:forEach items="${messagePage.messageList}" var="messageVO">
									<tr>
										<td style="text-align: center; padding-top: 16px;"><input type="checkbox" name="checkDelete" value="${messageVO.message_num}"/></td>
										<td>${messageVO.send_id}</td>
										<c:if test="${messageVO.receive_open == 1 }">
										<td><a href="receiveMessageRead.do?message_num=${messageVO.message_num}">${messageVO.title}</a></td>
										</c:if>
										<c:if test="${messageVO.receive_open == 2 }">
										<td><a href="receiveMessageRead.do?message_num=${messageVO.message_num}"><span style="color: #333333">${messageVO.title}</span></a></td>
										</c:if>
										<td><fmt:formatDate type="both"
												value="${messageVO.write_date}" dateStyle="short"
												timeStyle="short" /></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					<div style="text-align: center;">
						<c:forEach begin="${messagePage.startPage}"
							end="${messagePage.endPage}" var="p" step="1">
							<a href="receiveMessage.do?page=${p}"><b>${p}</b></a>
						</c:forEach>
						<br>
					</div> 
					<div style="text-align: right;">	
						<a href="messageWriteForm.do" title="글쓰기"><button style="background:#dcdcdc; border-radius:5px; cursor: pointer;" ><i class="fa fa-fw fa-pencil"></i></button></a>
						<a href="deleteReceiveAll.do" title="전체 삭제"><button style="background:#dcdcdc; border-radius:5px; cursor: pointer;" ><i class="fa fa-fw fa-trash"></i></button></a>
					</div>
				</div>
			</div>
			<div class="card-footer small text-muted">Recieve Message List</div>
		</div>
	</div>
</body>
</html>