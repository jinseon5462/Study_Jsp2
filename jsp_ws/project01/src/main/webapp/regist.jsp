<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="css/headerStyle.jsp" %>
<%@ include file="css/registStyle.jsp" %>
<%@ include file="css/footerStyle.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<%@ include file="header.jsp"%>
<div class="box">
        <form name="frm" id="signup">
            <fieldset>
                <legend>회원가입</legend>
                <ul id="reg_ul">
                    <li>
                        <label for="id">아이디</label>
                        <input type="text" id="id" name="id" required>
                        <input type="button" id="idCheck_btn" value="중복확인">
                        <input type="hidden" id="result" name="result" value="">
                        <div id="checkIdResult"></div>
                    </li>
                    <li>
                        <label for="pw">비밀번호</label>
                        <input type="password" id="pw" name="pw">
                    </li>
                    <!-- <li>
                        <label for="nickname">닉네임</label>
                        <input type="text" id="nickname" name="nickname">
                    </li> -->
                    <li>
                        <label for="name">이름</label>
                        <input type="text" id="name" name="name">
                    </li>
                    <li>
                        <label for="tel">전화번호</label>
                        <input type="text" id="tel" name="tel">
                    </li>
                    <li><label for="sel">학교</label>
                        <select name="sel" id="sel">
                            <option value="">학교를 선택해주세요</option>
                            <option value="부산대">부산대</option>
                            <option value="부경대">부경대</option>
                            <option value="동아대">동아대</option>
                            <option value="동의대">동의대</option>
                            <option value="경성대">경성대</option>
                        </select>
                    </li>
                </ul>
                <input type="button" name="reg" id="reg_btn" value="등록">
                <input type="reset" name="reset" value="초기화">
            </fieldset>
        </form>
    </div>
<%@ include file="footer.jsp"%>
<script>
	/* 아이디 중복확인 */
	let idCheck_btn = document.querySelector("#idCheck_btn");
	idCheck_btn.addEventListener("click", idcheck);
	function idcheck(){
		if(document.frm.id.value == ""){
			alert("아이디를 입력해주세요.");
			return;
		}
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let result = this.responseText;
			let result2 = parseInt(result, 10);
			if(result2 == 1){
				document.querySelector("#checkIdResult").innerText = "사용할수없는 아이디입니다.";
				document.querySelector("#checkIdResult").style.color = "red";
			}else{
				document.querySelector("#checkIdResult").innerText = "사용가능한 아이디입니다.";
				document.querySelector("#checkIdResult").style.color = "green";
				document.querySelector("#result").value = 1;
			}
		}
		let id = document.querySelector("#id").value;
		xhttp.open("GET", "checkid.do?id=" + id, true);
		xhttp.send();
	}
	
	/* 회원가입 */
	
	let reg_btn = document.querySelector("#reg_btn");
	reg_btn.addEventListener("click", reg);
	function reg(){
		if(document.frm.id.value == ""){
			alert("사용하실 아이디를 입력해주세요.");
			document.frm.id.focus();
			return;
		}else if(document.frm.pw.value == ""){
			alert("사용하실 비밀번호를 입력해주세요.");
			document.frm.pw.focus();
			return;
		}else if(document.frm.name.value == ""){
			alert("이름을 입력해주세요.");
			document.frm.name.focus();
			return;
		}else if(document.frm.tel.value == ""){
			alert("전화번호를 입력해주세요.");
			document.frm.tel.focus();
			return;
		}else if(document.frm.sel.value == ""){
			alert("학교를 선택해주세요.");
			document.frm.sel.focus();
			return;
		}else if(document.frm.result.value == ""){
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
			let id = document.querySelector("#id").value;
			let pw = document.querySelector("#pw").value;
			let name = document.querySelector("#name").value;
			let tel = document.querySelector("#tel").value;
			let univ = document.querySelector("#sel").value;
			
			xhttp.open("POST", "reg.do", true);
			xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhttp.send("id=" + id + "&pw=" + pw + "&name=" + name + "&tel=" + tel + "&univ=" + univ);
		}
	}
</script>
</body>
</html>