<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
id : <input type="text" name="id" value="kkk"><br>
name : <input type="text" name="name" value="hhh">

<button id="btn" onclick="loadDoc()">등록</button>
<hr>
등록 결과 : <span id="demo"></span>
<script>
	function loadDoc(){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
			document.querySelector("#demo").innerText = data;
		}
		xhttp.open("POST", "regMember.do");
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		
		let pid = document.querySelector("input[name='id']").value;
		let pname = document.querySelector("input[name='name']").value;
		
		let data = "id=" + pid + "&name=" + pname;
		xhttp.send(data);
	}
</script>
</body>
</html>