<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page session="true" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" /> -->
<title>�α��� ������</title>
<style type="text/css">
	table{
		margin: auto;
	}
	#loginInfo{
		display: none;
	} 
	.subject{
		text-align: center;
	}
</style>
<script type="text/javascript">
// window.onload�ȿ� �־ ���� ��Ű�� body�� ��� ��µ� �� ��ũ��Ʈ�� ����ȴ�.

var sessionLogin = '${empty sessionScope.loginId}';
	//�α��� ����
if(sessionLogin == false || sessionLogin == 'false'){
	window.history.back(-1);
}else{
	//�α׾ƿ� ����
	window.history.forward();
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
</script>
</head>
<body>
	
	<form action="login.do" method="post">
		<table>
			<tr><td colspan="5" class="subject">�α���</td></tr>
			<tr>
				<td>���̵�<td>
				<td><input type="text" name="id"><td>
				<td rowspan="2">
					<input type="submit" value="LOGIN"/>
				</td>
			</tr>
			<tr>
				<td>�н�����<td>
				<td>
					<input type="password" name="password">
				<td>
			</tr>
			<tr>
				<td></td>
				<td colspan="4">
					<a href="joinForm.do">ȸ������</a>
					<a href="myPage.do">���̵�/�н�����ã��</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>