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
		width: 500px;
	}
	table > thead{
		background-color: black;
		color: white;
	}
	tbody > tr:nth-child(2n){
		background-color: gainsboro;
	}
	#box{
		margin: 0 auto;
		width: 300px;
		border: solid 1px gainsboro;
		border-radius: 10px;
		padding-top: 10px;
	}
	#box > input{
		border-radius: 10px;
		border: solid 2px #4dd8eb;
		margin: 5px;
	}
	#btn{
		cursor: pointer;
		margin: 10px;
	}
	#searchBox{
		text-align: left;
	}
	body{
	}
	#pop{
		margin: 0 auto;
		width: 300px;
		border-radius: 10px;
		border: solid 1px black;
		display: none;
		position: relative;
		bottom: 300px;
		z-index: 1;
		backdrop-filter: blur(10px);
	}
	#pop > input{
		margin: 5px;
		border-radius: 10px;
	}
	.close_btn{
		width: 30px;
		background-color: #f27d5a;
		border-radius: 10px;
		border: solid 1px black;
		cursor: pointer;
		display: inline-block;
		position: absolute;
		right: 0;
	}
	#updt_btn{
		cursor: pointer;
	}
	.outer {
	  	position: absolute;
	  	top: 0;
	  	left: 0;
	  	height: 1000px; /*100%*/
	  	width: 1000px; /*100%*/
	  	background-color: gray;
	}

	.inner {
		position: fixed;
		top: 0;
		bottom: 0;
		left: 0;
		right: 0;
		margin: auto;
		width: 500px;  
		height: 300px;
	}
</style>
<body>
<div class="background">
	<h1>회원목록</h1>
	<hr>
	<div id="searchBox">
		<select id="sel">
			<option value="id">아이디로 검색</option>
			<option value="name">이름으로 검색</option>
			<option value="tel">전화번호로 검색</option>
		</select>
		<input type="text" id="content" value="">
	</div>
	<span>삭제 결과 : </span><span id="text_del"></span><br>
	<table border="1">
		<thead>
			<tr>
				<th>id</th>
				<th>name</th>
				<th>tel</th>
				<th>삭제</th>
			</tr>
		</thead>
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
</div>

<hr>

	<div id="pop">
		<div class="close_btn" onclick="goaway()">X</div>
		<h2>회원정보 수정</h2>
		<input type="text" id="update_id" name="id" readonly><br>
		<input type="text" id="update_pw" name="pw"><br>
		<input type="text" id="update_name" name="name"><br>
		<input type="text" id="update_tel" name="tel"><br>
		<input type="button" id="updt_btn" value="수정">
	</div>

<script>
	getList();
	const tbody = document.querySelector("#tbody");
	const btn = document.querySelector("#btn");
	btn.addEventListener('click', reg);
	
	/* 회원등록 */
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
	
	/* 키워드 검색 */
	
	content.addEventListener("keyup", function(e){
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
			
			xhttp.open("GET", "searchList.do?sel=" + sel + "&content=" + content, true);
			xhttp.send();
		}
	});
	
	/* 목록출력 */
	function getList(){
		const tbody = document.querySelector("#tbody");
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
			let obj = JSON.parse(data);
			tbody.replaceChildren();
			for(let i = 0; i < obj.length; i++){
				tbody.innerHTML += "<tr><td>" + obj[i].id + "</td><td>" 
				+ obj[i].name + "</td><td>" + obj[i].tel 
				+ "</td><td><button id='btn_del'>삭제</button></td></tr>";
			}
		}
		xhttp.open("GET", "getList.do", true);
		xhttp.send();
	}
	
	tbody.addEventListener("click", del);
	
	/* 삭제 */
	function del(e){
		if(e.target.tagName != "BUTTON"){
			return;
		}
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			getList();
			document.querySelector("#text_del").innerText = this.responseText;
		}
		
		let id = e.target.parentElement
		.previousElementSibling
		.previousElementSibling
		.previousElementSibling
		.innerText;
		
		xhttp.open("POST", "delete.do", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("id=" + id);
	}
	
	/* 수정 */
	tbody.addEventListener("click", function(e){
		const id = e.target.parentElement.children[0].innerText;
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let member = this.responseText;
			let obj = JSON.parse(member);
			document.querySelector("#update_id").value = obj[0].id;
			document.querySelector("#update_pw").value = obj[0].pw;
			document.querySelector("#update_name").value = obj[0].name;
			document.querySelector("#update_tel").value = obj[0].tel;
			document.querySelector("#pop").style.display = "block";
			document.querySelector(".background").style.backgroundColor = "blur";
		}
		xhttp.open("GET", "update.do?id=" + id, true);
		xhttp.send();
	});
	/* X 버튼 */
	function goaway(){
		document.querySelector("#pop").style.display = "none";
	}
	
	/* 수정실행 */
	const updt_btn = document.querySelector("#updt_btn");
	updt_btn.addEventListener("click", updt);
	function updt(e){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let result = this.responseText;
			if(result == 1){
				alert("수정성공!");
				getList();
			}else{
				alert("수정실패...");
			}
		}
		const id = document.querySelector("#update_id").value;
		const pw = document.querySelector("#update_pw").value;
		const name = document.querySelector("#update_name").value;
		const tel = document.querySelector("#update_tel").value;
		
		xhttp.open("POST", "update.do", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("id=" + id + "&pw=" + pw + "&name=" + name + "&tel=" + tel);
		document.querySelector("#pop").style.display = "none";
	};
	
</script>
</body>
</html>