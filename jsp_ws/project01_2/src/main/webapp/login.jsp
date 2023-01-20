<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
</style>
<script src="jquery/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="login_box">
		<form name="frm" id="login">
			<fieldset>
				<legend>Login</legend>
				<div class="login_text">
					<input type="text" name="id" id="id" placeholder="ID"><br>
					<input type="password" name="pw" id="pw" placeholder="Password"><br>
				</div>
				<input type="reset" name="reset" id="reset_btn" value="초기화">
				<input type="button" name="reg" id="login_btn" value="로그인">
			</fieldset>
		</form>
	</div>
	<%@ include file="footer.jsp" %>
<script>
	$("#login_btn").on("click", function(){
		if($("#id").val() == ""){
			alert("아이디를 입력하세요.");
			$("#id").focus();
			return;
		}else if($("#pw").val() == ""){
			alert("비밀번호를 입력하세요.");
			$("#pw").focus();
			return;
		}else{
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function(){
				let data = this.responseText;
				if(data == "0"){
					alert("아이디 또는 비밀번호를 확인해주세요.");
				}else{
					alert("로그인 성공");
					location.href = "index.jsp";
				}
			}
			let id = $("#id").val();
			let pw = $("#pw").val();
			xhttp.open("POST", "login.do", true);
			xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhttp.send("id=" + id + "&pw=" + pw);
		}
	});
</script>
</body>
</html>