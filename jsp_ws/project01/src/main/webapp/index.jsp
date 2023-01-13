<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="css/headerStyle.jsp" %>
<%@ include file="css/mainStyle.jsp" %>
<%@ include file="css/footerStyle.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리데이</title>
</head>
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<body>
    <div class="container">
        <%@ include file="header.jsp" %>
        <%@ include file="main.jsp" %>
        <%@ include file="footer.jsp" %>
    </div> <!-- container -->
    
<script>
function login(){
	let url = "login.jsp";
	window.open(url,"_blank",
		"width=301, height=301"		
	);
}
</script>
</body>
</html>