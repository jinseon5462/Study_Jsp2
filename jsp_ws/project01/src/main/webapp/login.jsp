<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="css/loginStyle.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<div class="login_box">
	<h1>로그인</h1>
	<form class="form" name="frm" method="post">
		<input type="text" name="id" placeholder="UserID"><br>
		<input type="password" name="pw" placeholder="UserPW"><br>
		<input type="reset" value="초기화">
		<input id="login_btn" type="button" value="로그인">
	</form>
</div>
<script>
	const login_btn = document.querySelector("#login_btn");
	login_btn.addEventListener("click", loginCheck);
	
	function loginCheck(){
		if(document.frm.id.value == ""){
			alert("아이디를 입력하세요.");
			document.frm.id.focus();
			return;
		}else if(document.frm.pw.value == ""){
			alert("비밀번호를 입력하세요.");
			document.frm.pw.focus();
			return;
		}else{
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function(){
				let data = this.responseText;
				if(data == "0"){
					alert("아이디 또는 비밀번호를 확인해주세요.");
				}else{
					let obj = JSON.parse(data);
					alert("로그인 성공");
					opener.parent.location.reload();
					window.close();
				}
			}
			let id = document.querySelector("input[name='id']").value;
			let pw = document.querySelector("input[name='pw']").value;
			xhttp.open("POST", "login.do", true);
			xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhttp.send("id=" + id + "&pw=" + pw);
		}
	}
</script>
</body>
</html>