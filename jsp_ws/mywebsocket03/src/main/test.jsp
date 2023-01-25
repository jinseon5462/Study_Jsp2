<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#demo{
		width: 200px;
		height: 200px;
		background-color: yellow;
	}
	.mytxt{
		text-align: right;
	}
</style>
</head>
<body>
<input type="button" value="추가" onclick="addDiv()">
<hr>
<div id="demo"></div>
<script>
	function addDiv(){
		let txt = "test";
		const demo = document.querySelector("#demo");
		demo.innerHTML += "<p class='mytxt'>" + txt + "</p>";
	}
</script>
</body>
</html>