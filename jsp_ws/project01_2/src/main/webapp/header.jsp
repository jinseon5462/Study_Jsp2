<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="jquery/jquery-3.3.1.min.js"></script>
<script src="js/header.js"></script>
<link rel="stylesheet" href="css/header.css">
</head>
<body>
	<div class="header">
		<img src="images/project_logo02.png" id="main_logo" onclick="location.href='index.jsp'">
		<nav id="navbar">
			<ul>
			    <li><a href="index.jsp">홈으로</a></li>
			    <li><a href="timetable.jsp">시간표</a></li>
			    <li><a href="free.jsp">자유게시판</a></li>
			    <li><a href="notice.jsp">인기게시판</a></li>
			</ul>
		</nav>
		<c:if test="${sessionScope.user == null }">
			<div class="buttons">
			    <button type="button" id="top_login_btn" onclick="location.href='login.jsp'">로그인</button>
			    <button type="button" id="top_signUp_btn" onclick="location.href='signUp.jsp'">회원가입</button>
			</div>
		</c:if>
		<c:if test="${sessionScope.user != null }">
			<div class="buttons">
			    <button type="button" id="top_logout_btn" onclick="location.href='logout.jsp'">로그아웃</button>
			    <button type="button" id="top_updateInfo_btn" onclick="#">정보수정</button>
			</div>
		</c:if>
	</div>
	<input type="hidden" id="user_id" value="${sessionScope.user.id }"><!-- 세션 아이디 -->
	<input type="hidden" id="user_univ" value="${sessionScope.user.univ }"><!-- 세션 대학 -->
	<input type="hidden" id="user_grade" value="${sessionScope.user.grade }"><!-- 세션 등급 -->
</body>
</html>