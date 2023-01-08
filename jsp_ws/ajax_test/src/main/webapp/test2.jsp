<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button id="btn_getList">목록가져오기</button>
<hr>
<table border="1">
	<tr>
		<th>id</th>
		<th>name</th>
		<th>tel</th>
	</tr>
	<tbody id="tbody">
	</tbody>
</table>


<script>
	const btn_getList = document.querySelector("#btn_getList");
	btn_getList.addEventListener('click', loadDoc);

	const tbody = document.querySelector("#tbody");
	
	function loadDoc(){
		tbody.replaceChildren();
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
			let obj = JSON.parse(data);
			alert(data);
			for(let i = 0; i < obj.length; i++){
				tbody.innerHTML += "<tr><td>" + obj[i].id + "</td><td>" + obj[i].name + "</td><td>" + obj[i].tel + "</td></tr>";
			}
		}
		xhttp.open("GET", "getList.do", true);
		xhttp.send();
	}
	
</script>
</body>
</html>