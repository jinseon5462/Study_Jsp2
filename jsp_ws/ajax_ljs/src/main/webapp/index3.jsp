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
<table border="1">
	<tr>
		<th>id</th>
		<th>pw</th>
		<th>name</th>
		<th>tel</th>
		<th>삭제</th>
	</tr>
	<tbody id="tbody">
		<tr>
			<td>1</td>
			<td>1</td>
			<td>1</td>
			<td>1</td>
			<td><input type="button" value="삭제"></td>
		</tr>
		<tr>
			<td>2</td>
			<td>2</td>
			<td>2</td>
			<td>2</td>
			<td><input type="button" value="삭제"></td>
		</tr>
		<tr>
			<td>3</td>
			<td>3</td>
			<td>3</td>
			<td>3</td>
			<td><input type="button" value="삭제"></td>
		</tr>
		<tr>
			<td>4</td>
			<td>4</td>
			<td>4</td>
			<td>4</td>
			<td><input type="button" value="삭제"></td>
		</tr>
		<tr>
			<td>5</td>
			<td>5</td>
			<td>5</td>
			<td>5</td>
			<td><input type="button" value="삭제"></td>
		</tr>
	</tbody>
</table>
<script>
	const tbody = document.querySelector("#tbody");
	tbody.addEventListener("click", del);
	
	function del(e){
		alert(e.target.tagName);
		/* if(e.target.tagName != "INPUT"){
			return;
		}
		loadDoc(); */
	}
	/* 
	document.querySelector('input')
	.parentElement
	.previousElementSibling
	.previousElementSibling
	.previousElementSibling
	.previousElementSibling
	.innerText; 
	*/
	
	/* function loadDoc(){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			
		}
		xhttp.open();
		xhttp.send();
	} */
</script>
</body>
</html>