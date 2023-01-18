<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	UserVO user = (UserVO)request.getAttribute("user");
	if(user != null){
		session.setAttribute("user", user);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="jquery/jquery-3.3.1.min.js"></script>
</head>
<body>
<h1>로그인</h1>
<hr>
<form action="login.do" method="post">
	<table border="1">
		<tr>
			<th>아이디</th>
			<td><input type="text" id="id" name="id"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" id="pw" name="pw"></td>
		</tr>
	</table>
	<input type="reset" id="reset" value="초기화">
	<input type="submit" value="로그인">
</form>
<c:if test="${sessionScope.user != null }">
<script>
	location.href = "index.jsp";
</script>
</c:if>
</body>
</html>