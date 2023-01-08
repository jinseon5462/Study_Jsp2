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
	<thead>
		<tr>
			<th>id</th>
			<th>pw</th>
			<th>name</th>
			<th>tel</th>
			<th>삭제</th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<script>
	getList();
	
	function getList(){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
		}
	}
</script>
</body>
</html>