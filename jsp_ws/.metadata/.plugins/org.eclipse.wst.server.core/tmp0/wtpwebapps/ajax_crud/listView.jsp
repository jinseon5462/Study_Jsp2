<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<button id="btn">실행</button>
<hr>

<table border="1">
	<tr>
		<th>id</th>
		<th>pw</th>
		<th>name</th>
		<th>tel</th>
	</tr>
	<tbody id="tbody">
	</tbody>
</table>
<hr>
<script>
	const btn = document.querySelector("#btn");
	btn.addEventListener('click', loadDoc);
	
	function loadDoc() {
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function() {
			tbody.replaceChildren();
			let jsonStr = this.responseText;
			alert(jsonStr);
			let obj = JSON.parse(jsonStr);
			
			for(let i = 0; obj.length; i++){
				tbody.innerHTML += "<tr><td>" + obj[i].id + "</td><td>" + obj[i].pw + "</td><td>" + obj[i].name + "</td><td>" + obj[i].tel + "</td></tr>";
			}
		}
		xhttp.open("GET", "getlist.do");
		xhttp.send();
	}
</script>
</body>
</html>