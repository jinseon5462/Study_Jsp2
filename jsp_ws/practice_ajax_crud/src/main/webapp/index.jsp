<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<style>
	h1{
		text-align: center;
	}
	table{
		margin: 0 auto;
		border-collapse: collapse;
	}
	.box{
		display: none;
		width: 300px;
		margin: 0 auto;
		text-align: center;
		border-radius: 10px;
		border: solid 1px black;
	}
	.box > input[type="button"]{
		margin: 5px;
		background: none;
		cursor: pointer;
		border: solid 2px gainsboro;
	}
	.box > input{
		text-align: center;
		border-radius: 10px;
		margin-bottom: 5px;
		border: solid 2px orange;
	}
	#pop{
		width: 300px;
		margin: 0 auto;
		text-align: center;
		border: solid 1px gray;
		border-radius: 10px;
		position: fixed;
		top: 200px;
        bottom: 500px;
        left: 0;
        right: 0;
        background-color: gainsboro;
	}
	#close_btn{
		width: 20px;
		height: 20px;
		border: solid 1px black;
		border-radius: 10px;
		cursor: pointer;
		background-color: red;
		display: inline-block;
		position: absolute;
		right: 0;
	}
</style>
<body>
<h1>메인 페이지</h1>
<hr>
<select id="select">
	<option value="id">아이디로 검색</option>
	<option value="name">이름으로 검색</option>
	<option value="tel">전화번호로 검색</option>
</select>
<input type="text" id="keyword">

<table border="1">
	<thead>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>삭제</th>
		</tr>
	</thead>
	<tbody id="tbody">
		<!--  -->
	</tbody>
</table>
<hr>

<div class="box">
	<h1>회원등록</h1>
	<div id="reg_result"></div>
	<hr>
	<input type="text" id="id" name="id"><br>
	<input type="password" id="pw" name="pw"><br>
	<input type="text" id="name" name="name"><br>
	<input type="text" id="tel" name="tel"><br>
	<input type="button" id="reg_btn" value="등록">
</div>

<div class="outer">
	<div id="pop">
		<div id="close_btn" onclick="closePop()">X</div>
		<h1>회원정보 수정</h1>
		<input type="text" id="update_id" name="id"><br>
		<input type="text" id="update_pw" name="pw"><br>
		<input type="text" id="update_name" name="name"><br>
		<input type="text" id="update_tel" name="tel"><br>
		<input type="button" id="update_btn" value="수정">
	</div>
</div>

<script>
	getList();
	
	const tbody = document.querySelector("#tbody");
	
	/* 목록출력 */
	function getList(){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let list = this.responseText;
			let obj = JSON.parse(list);
			tbody.replaceChildren();
			for(let i = 0; i < obj.length; i++){
				tbody.innerHTML += "<tr><td>" + obj[i].id + "</td><td>"
				+ obj[i].name + "</td><td>" + obj[i].tel + "</td><td>"
				+ "<button id='delete_btn'>삭제</button>";
			}
		}
		xhttp.open("GET", "getList.do", true);
		xhttp.send();
	}
	
	/* 회원등록 */
	const reg_btn = document.querySelector("#reg_btn");
	reg_btn.addEventListener("click", regist);
	
	function regist(){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			getList();
			let data = this.responseText();
			document.querySelector("#reg_result").innerText = data;
		}
		let id = document.querySelector("#id").value;
		let pw = document.querySelector("#pw").value;
		let name = document.querySelector("#name").value;
		let tel = document.querySelector("#tel").value;
		
		xhttp.open("POST", "reg.do", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("id=" + id + "&pw=" + pw + "&name=" + name + "&tel=" + tel);
	}
	
	/* 키워드 검색 */
	
	keyword.addEventListener("keyup", function(e){
		if(e.keyCode != null){
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function(){
				let list = this.responseText;
				let obj = JSON.parse(list);
				tbody.replaceChildren();
				for(let i = 0; i < obj.length; i++){
					tbody.innerHTML += "<tr><td>" + obj[i].id + "</td><td>"
					+ obj[i].name + "</td><td>" + obj[i].tel + "</td></tr>";
				}
			}
			let select = document.querySelector("#select").value;
			let keyword = document.querySelector("#keyword").value;
			xhttp.open("GET", "searchKeyword.do?select=" + select + "&keyword=" + keyword);
			xhttp.send();
		}
	});
	/* 삭제 */
	tbody.addEventListener("click", del);

	function del(e){
		if(e.target.tagName != "BUTTON"){
			return;
		}
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			getList();
		}
		let id = e.target.parentElement
		.previousElementSibling
		.previousElementSibling
		.previousElementSibling
		.innerText;
		alert(id);
		
		xhttp.open("POST", "delete.do", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("id=" + id);
	}
	
	/* 수정 */
	tbody.addEventListener("click", updt);
	
	function updt(e){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			
		}
		xhttp.open("GET", "update.do?id=" + id);
		xhttp.send();
	}
	
	/* 수정화면 닫기 */
	function closePop(){
		document.querySelector("#pop").style.display = "none";
	}
</script>
</body>
</html>