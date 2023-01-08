<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
<h1>회원목록</h1>
<hr>
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
<hr>
<h1>회원등록</h1>
<hr>
<div id="reg_txt"></div>
<div id="box">
	<input type="text" id="id" name="id"><br>
	<input type="password" id="pw" name="pw"><br>
	<input type="text" id="name" name="name"><br>
	<input type="text" id="tel" name="tel"><br>
	<button id="btn_reg">등록</button>
</div>
<script>

	getList();
	/* 목록출력 */
	const tbody = document.querySelector("#tbody");
	function getList(){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let list = this.responseText;
			let obj = JSON.parse(list);
			tbody.replaceChildren();
			for(let i = 0; i < obj.length; i++){
				tbody.innerHTML += "<tr><td>" + obj[i].id 
				+ "</td><td>" + obj[i].pw + "</td><td>" 
				+ obj[i].name + "</td><td>" + obj[i].tel + "</td></tr>";
			}
		}
		xhttp.open("GET", "getList.do", true);
		xhttp.send();
	}
	
	const btn_reg = document.querySelector("#btn_reg");
	btn_reg.addEventListener("click", reg);
	
	/* 회원등록 */
	function reg(){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
			document.querySelector("#reg_txt").innerText = data;
			getList();
		}
		let id = document.querySelector("#id").value;
		let pw = document.querySelector("#pw").value;
		let name = document.querySelector("#name").value;
		let tel = document.querySelector("#tel").value;
		alert(id + pw + name + tel);
		
		xhttp.open("POST", "reg.do", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("id=" + id + "&pw=" + pw + "&name=" + name + "&tel=" + tel);
	}
	
	/* 키워드 검색 */
	
</script>
</body>
</html>