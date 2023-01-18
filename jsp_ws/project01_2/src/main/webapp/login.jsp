<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	.box{
		width: 1300px;
		height: 600px;
		border: solid 1px red;
		margin: 0 auto;
	}
	.login_box{
		margin: 0 auto;
		margin-top: 40px;
		width: 500px;
		height: 500px;
		border-radius: 20px;
		box-shadow: 20px 20px 20px gray;
		border: solid 3px #ff4000;
	}
	form{
		margin-top: 50px;
	}
	fieldset{
		text-align: center;
		margin: 0 auto;
		width: 300px;
		height: 300px;
		border-radius: 10px;
		border: solid 3px gainsboro;
	}
	input[type="text"],
	input[type="password"]
	{
		text-align: center;
		height: 30px;
		outline: none;
		border: solid 2px gainsboro;
		border-radius: 10px;
	}
	
	input[type="text"]:hover,
	input[type="password"]:hover
	{	
		border: solid 2px orange; 
	}
	
	
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="box">
		<div class="login_box">
			<form name="frm" id="signup">
			<fieldset>
				<legend>회원가입</legend>
				<input type="text" name="id">
				<input type="password" name="pw">
			</fieldset>
			</form>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>