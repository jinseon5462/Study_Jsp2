<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리데이</title>
</head>
<style>
	.section{
		margin: 0 auto;
		width: 1300px;
	}
</style>
<body id="main">
	<%@ include file="header.jsp" %>
	<div class="section">
		<%@ include file="sidebar.jsp" %>
		
		<%@ include file="main.jsp" %>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>