<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="jquery/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="css/signUp.css">
</head>
<body>
	<%@ include file="header.jsp" %>
		<form name="frm" id="signUp">
			<fieldset>
				<legend>Sign Up</legend>
				<div class="wrap">
					<div class="signUp_text">
						<div id="checkIdResult">&nbsp;</div>
						<input type="hidden" id="result" name="result" value="">
						<input type="text" name="id" id="id" placeholder="ID"><br>
						<input type="password" name="pw" id="pw" placeholder="Password"><br>
						<input type="text" name="name" id="name" placeholder="Name"><br>
						<input type="text" name="tel" id="tel" placeholder="Tel"><br>
						<!-- <input type="text" name="tel" placeholder="univ" readonly><br> -->
						<select name="sel" id="sel">
							<option value="">학교를 선택해주세요</option>
							<option value="부산대">부산대</option>
							<option value="부경대">부경대</option>
							<option value="동아대">동아대</option>
							<option value="동의대">동의대</option>
							<option value="경성대">경성대</option>
						</select>
					</div>
					<input type="button" id="idCheck_btn" value="중복확인">
				</div>
				<input type="reset" name="reset" id="reset_btn" value="초기화">
				<input type="button" name="reg" id="signUp_btn" value="회원가입">
			</fieldset>
		</form>
	<%@ include file="footer.jsp" %>
<script>
	/* 아이디 중복확인 */
	$("#idCheck_btn").on("click", function(){
		if($("#id").val() == ""){
			alert("아이디를 입력해주세요.");
			return;
		}
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let result = this.responseText;
			let result2 = parseInt(result, 10);
			if(result2 == 1){
				$("#checkIdResult").text("사용할수없는 아이디입니다");
				$("#checkIdResult").css("color", "red");
			}else{
				$("#checkIdResult").text("사용가능한 아이디입니다");
				$("#checkIdResult").css("color", "green");
				$("#result").val(1);
			}
		}
		let id = document.querySelector("#id").value;
		xhttp.open("GET", "checkId.do?id=" + id, true);
		xhttp.send();
	});
	
	/* 회원가입 */
	$("#signUp_btn").on("click", function(){
		if($("#id").val() == ""){
			alert("사용하실 아이디를 입력해주세요.");
			$("#id").focus();
			return;
		}else if($("#pw").val() == ""){
			alert("사용하실 비밀번호를 입력해주세요.");
			$("#pw").focus();
			return;
		}else if($("#name").val() == ""){
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return;
		}else if($("#tel").val() == ""){
			alert("전화번호를 입력해주세요.");
			$("#name").focus();
			return;
		}else if($("#sel").val() == ""){
			alert("학교를 선택해주세요.");
			$("#sel").focus();
			return;
		}else if($("#result").val() == ""){
			alert("아이디 중복체크를 진행후 등록가능합니다.");
			return;
		}else{
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function(){
				let result = this.responseText;
				let result2 = parseInt(result, 10);
				if(result2 == 1){
					alert("회원가입이 완료되었습니다.");
					location.href = "index.jsp";
				}else{
					alert("회원가입 오류입니다 다시 진행해주세요.");
				}
			}
			let id = $("#id").val();
			let pw = $("#pw").val();
			let name = $("#name").val();
			let tel = $("#tel").val();
			let univ = $("#sel").val();
			
			xhttp.open("POST", "signUp.do", true);
			xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhttp.send("id=" + id + "&pw=" + pw + "&name=" + name + "&tel=" + tel + "&univ=" + univ);
		}
	});
</script>
</body>
</html>