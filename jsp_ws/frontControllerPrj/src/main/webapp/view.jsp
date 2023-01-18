<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Detail Page</h1>
<hr>
num : ${requestScope.msg.num }<br>
title : ${requestScope.msg.title }<br>
writer : ${requestScope.msg.writer }<br>
content : ${requestScope.msg.content }<br>
</body>
</html>