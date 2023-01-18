<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="upload2.do" method="post" enctype="multipart/form-data">
	이름 : <input type="text" name="name"><br>
	파일1 : <input type="file" name="uploadFile1"><br>
	파일2 : <input type="file" name="uploadFile2"><br>
	파일3 : <input type="file" name="uploadFile3"><br>
	<input type="submit" value="전송">
</form>
</body>
</html>