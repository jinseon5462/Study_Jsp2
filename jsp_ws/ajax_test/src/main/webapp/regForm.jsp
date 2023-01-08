<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원등록</h1>
<input type="text" id="id" name="id"><br>
<input type="password" id="pw" name="pw"><br>
<input type="text" id="name" name="name"><br>
<input type="text" id="tel" name="tel"><br>
<button id="btn">등록</button>

<div id="text">여기에 결과가 나온다.</div>

<script>
	const btn = document.querySelector("#btn");
	btn.addEventListener('click', loadDoc);
	
	
	function loadDoc(){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
			document.querySelector("#text").innerText = data;
		}
		let id = document.querySelector("input[name='id']").value;
		let pw = document.querySelector("input[name='pw']").value;
		let name = document.querySelector("input[name='name']").value;
		let tel = document.querySelector("input[name='tel']").value;
		
		xhttp.open("POST", "reg.do", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("id=" + id + "&pw=" + pw + "&name=" + name + "&tel=" + tel);
	}
</script>
</body>
</html>