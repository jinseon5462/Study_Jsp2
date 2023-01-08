<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원목록</h1>
<hr>
<button id="btn">목록보기</button>
<table border="1">
	<thead>
		<tr>
			<th>id</th>
			<th>pw</th>
			<th>name</th>
			<th>tel</th>
		</tr>
	</thead>
	<tbody id="tbody">
	
	</tbody>
	
</table>
<script>
	const btn = document.querySelector("#btn");
	btn.addEventListener('click', loadDoc);
	
	function loadDoc(){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			tbody.replaceChildren();
			let jsonStr = this.responseText;
			let obj = JSON.parse(jsonStr);
			
			for(let i = 0; i < obj.length; i++){
				tbody.innerHTML += "<tr><td>" + obj[i].id + "</td><td>" + obj[i].pw + "</td><td>" + obj[i].name + "</td><td>" + obj[i].tel + "</td></tr>"; 
			}
		}
		xhttp.open("GET", "getlist.do");
		xhttp.send();
	}
	
</script>
</body>
</html>