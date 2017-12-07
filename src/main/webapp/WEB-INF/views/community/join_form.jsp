<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
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
			<tr><td colspan="2" id="subject"><b>회원가입</b></td></tr>
			<tr>
				<td class="title">아이디</td>
				<td><input type="text" name="id" />
				<button>중복체크</button></td>
			</tr>
			<tr>
				<td class="title">닉네임</td>
				<td><input type="text" name="nickname"></td>
			</tr>
			<tr>
				<td class="title">비밀번호</td>
				<td><input type="password"/></td>
			</tr>
			<tr>
				<td class="title">비밀번호 확인</td>
				<td><input type="password" name="password" /></td>
			</tr>
			<tr>
				<td height="30px"></td>
			</tr>
			
			<tr>
				<td class="title">이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td class="title">이메일</td>
				<td><input type="email" name="email"></td>
			</tr>
			<tr>
				<td class="title">생일</td>
				<td><input type="date" name="birthday"></td>
			</tr>
			<tr>
				<td class="title">성별</td>
				<td><input type="radio" name="gender" value="man">남 
					<input type="radio" name="gender" value="woman">여</td>
			</tr>
			<tr>
				<td class="title">전화번호</td>
				<td><input type="tel" name="phone"></td>
			</tr>
			<tr>
				<td class="title">우편번호</td>
				<td><input type="text" name="zipcode1" size="5"> - 
					<input type="text" name="zipcode2" size="5"> 
					<input type="button" value="검색"></td>
			</tr>
			<tr>
				<td rowspan="2" class="title">주소</td>
				<td><input type="text" name="address1"></td>
			</tr>
			<tr>
				<td><input type="text" name="address2"></td>
			</tr>
			<tr>
				<td class="title">메일 수신 여부</td>
				<td>
					<input type="radio" name="receiver_email" value="yes">예
					<input type="radio" name="receiver_email" value="no"/>아니오
				</td>
			</tr>
			<tr class="marginTop">
				<td  colspan="2">
					<input type="submit" value="가입">&nbsp;
					<input type="reset" value="다시작성">&nbsp;
					<a href="main.do"><input type="button" value="home"></a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>

