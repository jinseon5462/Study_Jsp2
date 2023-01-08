<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="searchBox">
	<select id="sel">
		<option value="id">아이디로 검색</option>
		<option value="name">이름으로 검색</option>
		<option value="tel">전화번호로 검색</option>
	</select>
	<input type="text" id="content" value="">
</div>
<hr>

<table border="1">
	<tr>
		<th>id</th>
		<th>name</th>
		<th>tel</th>
		<th>삭제</th>
	</tr>
	<tbody id="tbody">
	
	</tbody>
</table>

<script>
	const tbody = document.querySelector("#tbody");
	content.addEventListener("keyup", getSearchList);
	
	function getSearchList(e){
		if(e.keyCode != null){
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function(){
				let data = this.responseText;
				let obj = JSON.parse(data);
				tbody.replaceChildren();
				for(let i = 0; i < obj.length; i++){
					tbody.innerHTML += "<tr><td>" + obj[i].id + "</td><td>"
					+ obj[i].name + "</td><td>" + obj[i].tel + "</td><td>"
					+ "<button id='btn_del'>삭제</button></td></tr>";
				}
			}
			const content = document.querySelector("#content").value;
			const sel = document.querySelector("#sel").value;
			
			xhttp.open("GET", "searchList.do?sel="+ sel + "&content=" + content, true);
			xhttp.send();
		}
	}
/* let opt1 = document.querySelector("opt1") */
/* console.log(e.target.value); */
</script>
</body>
</html>