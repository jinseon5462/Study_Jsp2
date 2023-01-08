<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	*{
		text-align: center;
	}
	table{
		margin: 0 auto;
		width: 400px;
	}
	#box{
		margin: 0 auto;
		width: 300px;
		border: solid 1px gainsboro;
		border-radius: 10px;
		padding-top: 10px;
	}
	input{
		border-radius: 10px;
		border: solid 2px #4dd8eb;
		margin: 5px;
	}
	#btn{
		cursor: pointer;
		margin: 10px;
	}
</style>
<body>
<h1>회원목록</h1>
<hr>
<table border="1">
	<tr>
		<th>id</th>
		<th>pw</th>
		<th>name</th>
		<th>tel</th>
		<th>삭제</th>
	</tr>
	<tbody id="tbody">
	
	</tbody>
</table>
<hr>

<h1>회원등록</h1>
<div id="box">
	<span>등록 결과 : </span><span id="text"></span><br>
	<input type="text" id="id" name="id"><br>
	<input type="password" id="pw" name="pw"><br>
	<input type="text" id="name" name="name"><br>
	<input type="text" id="tel" name="tel"><br>
	<button id="btn">등록</button>
</div>
<hr>


<script>
	getList();
	
	const btn = document.querySelector("#btn");
	btn.addEventListener('click', reg);
	
	
	function reg(){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			getList();
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
	
	
	function getList(){
		const tbody = document.querySelector("#tbody");
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
			let obj = JSON.parse(data);
			tbody.replaceChildren();
			for(let i = 0; i < obj.length; i++){
				tbody.innerHTML += "<tr><td>" + obj[i].id + "</td><td>" + obj[i].pw
				+ "</td><td>" + obj[i].name + "</td><td>" + obj[i].tel + "</td><td><button id='btn_del'>삭제</button></td></tr>";
			}
		}
		xhttp.open("GET", "getList.do", true);
		xhttp.send();
	}
	
	/* const btn_del = document.querySelector("#btn_del");
	
	btn_del.addEventListener('click', delete(e){
		
		const tbody = document.querySelector("#tbody");
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			getList();
			let data = this.responseText;
			document.querySelector("#deleteResult").innerText = data;
		}
		tbody.children[0].children[0]
		xhttp.open("POST", "delete.do", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("id=" + id);
	}); */
</script>
</body>
</html>