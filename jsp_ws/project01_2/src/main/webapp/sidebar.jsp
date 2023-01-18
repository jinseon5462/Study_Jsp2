<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/sidebar.css">
</head>
<body>
	<div class="sidebar">
		<div class="profile_box">
			<c:if test="${sessionScope.user.univ == null }">
				<img id="profile_img" src="images/profile_img.png">
			</c:if>
			<c:if test="${sessionScope.user.univ eq '부산대' }">
				<img id="profile_img" src="images/busan.png">
			</c:if>
			<c:if test="${sessionScope.user.univ eq '부경대' }">
				<img id="profile_img" src="images/pukyeon.png">
			</c:if>
			<c:if test="${sessionScope.user.univ eq '동아대' }">
				<img id="profile_img" src="images/donga.png">
			</c:if>
			<c:if test="${sessionScope.user.univ eq '동의대' }">
				<img id="profile_img" src="images/donge.png">
			</c:if>
			<c:if test="${sessionScope.user.univ eq '경성대' }">
				<img id="profile_img" src="images/kyungsung.png">
			</c:if>
			<c:if test="${sessionScope.user == null }">
				<div id="profile_nickname">커뮤니티 이용을 위해<br><span style="color:red;">로그인</span>이 필요합니다!</div>
				<button type="button" id="profile_login" onclick="login()">로그인</button><br>
				<button type="button" id="profile_regist" onclick="location.href='regist.jsp'">회원가입</button>
			</c:if>
			<c:if test="${sessionScope.user != null  }">
				<div id="profile_nickname">김명팔</div>
				<div id="profile_name">이진선</div>
				<div id="profile_id">lee1594</div>
				<button id="profile_logout" onclick="location.href='logout.jsp'">로그아웃</button>
			</c:if>
		</div>
		<!-- 광고구역 -->
		<div class="ad_box">
			<img src="images/ad1.png">
			<img src="images/ad2.png">
			<img src="images/ad3.png">
			<img src="images/ad4.png">
		</div>
	</div>
</body>
</html>