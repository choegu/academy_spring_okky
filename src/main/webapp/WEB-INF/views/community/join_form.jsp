<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>
<style type="text/css">
table{
	width: 60%;
	margin: auto;	
}

.marginTop{
	height : 100px;
	text-align: center;
}


.title{
	width: 180px;
}
#loginInfo{
	display: none;
}
#subject{
	height: 50px;
	size: 30px;	 
}
</style>
</head>
<body>
	
	<form action="join.do" method="post">
		<table>
			<tr><td colspan="2" id="subject"><b>ȸ������</b></td></tr>
			<tr>
				<td class="title">���̵�</td>
				<td><input type="text" name="id" />
				<button>�ߺ�üũ</button></td>
			</tr>
			<tr>
				<td class="title">�г���</td>
				<td><input type="text" name="nickname"></td>
			</tr>
			<tr>
				<td class="title">��й�ȣ</td>
				<td><input type="password"/></td>
			</tr>
			<tr>
				<td class="title">��й�ȣ Ȯ��</td>
				<td><input type="password" name="password" /></td>
			</tr>
			<tr>
				<td height="30px"></td>
			</tr>
			
			<tr>
				<td class="title">�̸�</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td class="title">�̸���</td>
				<td><input type="email" name="email"></td>
			</tr>
			<tr>
				<td class="title">����</td>
				<td><input type="date" name="birthday"></td>
			</tr>
			<tr>
				<td class="title">����</td>
				<td><input type="radio" name="gender" value="man">�� 
					<input type="radio" name="gender" value="woman">��</td>
			</tr>
			<tr>
				<td class="title">��ȭ��ȣ</td>
				<td><input type="tel" name="phone"></td>
			</tr>
			<tr>
				<td class="title">�����ȣ</td>
				<td><input type="text" name="zipcode1" size="5"> - 
					<input type="text" name="zipcode2" size="5"> 
					<input type="button" value="�˻�"></td>
			</tr>
			<tr>
				<td rowspan="2" class="title">�ּ�</td>
				<td><input type="text" name="address1"></td>
			</tr>
			<tr>
				<td><input type="text" name="address2"></td>
			</tr>
			<tr>
				<td class="title">���� ���� ����</td>
				<td>
					<input type="radio" name="receiver_email" value="yes">��
					<input type="radio" name="receiver_email" value="no"/>�ƴϿ�
				</td>
			</tr>
			<tr class="marginTop">
				<td  colspan="2">
					<input type="submit" value="����">&nbsp;
					<input type="reset" value="�ٽ��ۼ�">&nbsp;
					<a href="main.do"><input type="button" value="home"></a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>

