<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정</title>
<link rel="stylesheet" href="css/updateUserInfo.css?v1.3">
</head>
<body>
	<%@ include file="header.jsp" %>
	<form name="frm" id="updateInfo">
		<fieldset>
			<legend>Update Info</legend>
			<div class="wrap">
				<div class="updateInfo_text">
					<div id="checkIdResult">&nbsp;</div>
					<input type="hidden" id="result" name="result" value="">
					<input type="text" name="id" id="id" maxlength="30" placeholder="ID" value="${sessionScope.user.id }" readonly><br>
					<input type="text" name="pw" id="pw" maxlength="30" placeholder="Password" value="${sessionScope.user.pw }"><br>
					<input type="text" name="name" id="name" maxlength="10" placeholder="Name" value="${sessionScope.user.name }"><br>
					<input type="text" name="tel" id="tel" maxlength="30" placeholder="Tel" value="${sessionScope.user.tel }"><br>
					<input type="text" name="univ" id="univ" placeholder="univ" value="${sessionScope.user.univ }" readonly><br>
					
				</div>
			</div>
			<input type="button" name="return" id="return_btn" value="되돌리기">
			<input type="button" name="update" id="updateUserInfo_btn" value="수정하기">
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
	
	/* 회원정보 수정 */
	$("#updateUserInfo_btn").on("click", function(){
		if($("#pw").val() == ""){
			alert("변경하실 비밀번호를 입력해주세요.");
			$("#pw").focus();
			return;
		}else if($("#name").val() == ""){
			alert("변경하실 이름을 입력해주세요.");
			$("#name").focus();
			return;
		}else if($("#tel").val() == ""){
			alert("변경하실 전화번호를 입력해주세요.");
			$("#name").focus();
			return;
		}else{
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function(){
				let result = this.responseText;
				let result2 = parseInt(result, 10);
				if(result2 == 1){
					alert("회원정보 수정이 완료되었습니다.");
					location.href = "index.jsp";
				}else{
					alert("오류입니다 다시 시도해주세요.");
				}
			}
			let id = $("#id").val();
			let pw = $("#pw").val();
			let name = $("#name").val();
			let tel = $("#tel").val();
			let univ = $("#univ").val();
			
			xhttp.open("POST", "updateUserInfo.do", true);
			xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhttp.send("id=" + id + "&pw=" + pw + "&name=" + name + "&tel=" + tel + "&univ=" + univ);
		}
	});
	
	// 
	$("#return_btn").on("click", function(){
		history.go(0);
	});
</script>
</body>
</html>