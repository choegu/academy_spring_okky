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
<title>로그인 페이지</title>
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
// window.onload안에 넣어서 실행 시키면 body가 모두 출력된 후 스크립트가 실행된다.

var sessionLogin = '${empty sessionScope.loginId}';
	//로그인 상태
if(sessionLogin == false || sessionLogin == 'false'){
	window.history.back(-1);
}else{
	//로그아웃 상태
	window.history.forward();
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
</script>
</head>
<body>
	
	<form action="login.do" method="post">
		<table>
			<tr><td colspan="5" class="subject">로그인</td></tr>
			<tr>
				<td>아이디<td>
				<td><input type="text" name="id"><td>
				<td rowspan="2">
					<input type="submit" value="LOGIN"/>
				</td>
			</tr>
			<tr>
				<td>패스워드<td>
				<td>
					<input type="password" name="password">
				<td>
			</tr>
			<tr>
				<td></td>
				<td colspan="4">
					<a href="joinForm.do">회원가입</a>
					<a href="myPage.do">아이디/패스워드찾기</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>