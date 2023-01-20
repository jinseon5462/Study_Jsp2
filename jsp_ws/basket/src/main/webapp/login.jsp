<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style>
	table{
		width: 250px;
		margin: 0 auto;
	}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<form action="login.do" method="post">
	<table border="1">
		<tr>
			<th>아이디</th><td><input type="text" name="id"></td>
		</tr>
		<tr>
			<th>비밀번호</th><td><input type="password" name="pw"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="reset" value="초기화">
				<input type="submit" value="로그인">
			</td>
		</tr>
	</table>
</form>
</body>
</html>