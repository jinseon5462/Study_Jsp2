<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>이진선</h1>
<hr>
<input type="hidden" id="user_id" value="${sessionScope.user.id }">
<input type="hidden" id="user_pw" value="${sessionScope.user.pw }">
<c:if test="${sessionScope.user == null }">
	<a href="login.jsp">로그인하기</a><br>
</c:if>
<c:if test="${sessionScope.user.grade eq 'manager' }">
	<a href="regProduct.jsp">제품등록하기</a><br>
</c:if>
<c:if test="${sessionScope.user != null }">
	<a href="getList.do">제품목록 조회하기</a><br>
	<a href="logout.jsp">로그아웃하기</a><br>
</c:if>
</body>
</html>