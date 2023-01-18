<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>상품등록폼</h1>
<hr>
<form action="regProd.do" method="post" encType="multipart/form-data">
	상품코드 : <input type="text" name="pcode"><br>
	상품명 : <input type="text" name="pname"><br>
	가격 : <input type="text" name="price"><br>
	상품설명 : <textarea rows="5" cols="10" name="desc"></textarea><br>
	상품사진 : <input type="file" name="photo">
	<input type="submit" value="등록">
</form>
</body>
</html>