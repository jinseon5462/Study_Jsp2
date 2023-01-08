<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Member List</h1>
<hr>
<table border="1" width="400px">
	<thead>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>전화번호</th>
		</tr>
	</thead>
	<tbody>
	<!-- 여기에 데이터베이스에서 불러온 데이터들이 동적으로 생성된다. -->
	
	</tbody>
</table>

<h1>Member Regist Form</h1>
<hr>
<form name="frm">
	<input type="text" name="id" placeholder="아이디를 입력하세요" required><br>
	<input type="password" name="pw" placeholder="비밀번호를 입력하세요" required><br>
	<input type="text" name="name" placeholder="이름을 입력하세요" required><br>
	<input type="text" name="tel" placeholder="전화번호를 입력하세요" required><br>
	<input type="button" id="btn_reg" value="등록">
</form>
<script>
	const btn = document.querySelector("#btn_reg");
	btn.addEventListener('click', loadDoc);
	
	function loadDoc(){
		const xhttp
	}
	
</script>

</body>
</html>