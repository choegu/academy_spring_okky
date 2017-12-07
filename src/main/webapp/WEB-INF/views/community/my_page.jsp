<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ����</title>
<style type="text/css">
#loginInfo{
	display: none;
}
table{
	width: 60%;
	margin: auto;	
}

.marginTop{
	height : 100px;
	text-align: center;
}

.subject{
	height: 50px;
	size: 30px;	 
}
.title{
	width: 180px;
}
</style>
<script type="text/javascript">
window.onload=function(){
	document.getElementById("pre").onclick=function(){
		window.history.back();
	}
}

</script>
</head>
<body>
	
	<form action="memberUpdate.do" method="post">
		<table>
			<tr><td class="subject"><b>ȸ������</b></td></tr>
			<tr>
				<td class="title">���̵�</td>
				<td>${member.id}</td>
			</tr>
			<tr>
				<td class="title">�г���</td>
				<td>${member.nickname}</td>
			</tr>
			<tr>
				<td height="30px"></td>
			</tr>
			<tr>
				<td class="title">�̸�</td>
				<td>${member.name}</td>
			</tr>
			<tr>
				<td class="title">�̸���</td>
				<td>${member.email}</td>
			</tr>
			<tr>
				<td class="title">����</td>
				<td>${member.birthday}</td>
			</tr>
			<tr>
				<td class="title">����</td>
				<c:if test="${member.gender == 0}">
				<td>��</td>
				</c:if>
				<c:if test="${member.gender == 1}">
				<td>��</td>
				</c:if>
			</tr>
			<tr>
				<td class="title">��ȭ��ȣ</td>
				<td>${member.phone}</td>
			</tr>
			<tr>
				<td class="title">�����ȣ</td>
				<td>${member.zipcode1} - ${member.zipcode2}</td>
			</tr>
			<tr>
				<td rowspan="2" class="title">�ּ�</td>
				<td>${member.address1}</td>
			</tr>
			<tr>
				<td>${member.address2}</td>
			</tr>
			<tr>
				<td class="title">���� ���� ����</td>
				<c:if test="${member.receiver_email == 0}">
					<td>��</td>
				</c:if>
				<c:if test="${member.receiver_email == 1}">
					<td>�ƴϿ�</td>
				</c:if>
			</tr>
			<tr class="marginTop">
				<td  colspan="2">
					<input type="submit" value="����">&nbsp;
					<input type="button" id="pre" value="����">&nbsp;
					<a href="main.do"><input type="button" value="����"></a>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>