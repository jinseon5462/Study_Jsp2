<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Cookie cookie = new Cookie("cookie1", "cookie1Value");
	cookie.setMaxAge(60 * 2);
	response.addCookie(cookie);
%>
<input type="button" value="쿠키Get" onclick="location.href='cookieGet.jsp'">
</body>
</html>