<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="jquery/jquery-3.3.1.min.js"></script>
<!-- <script src="js/header.js"></script> -->
<link rel="stylesheet" href="css/header.css?v1.0">
</head>
<body>
	<div class="header">
		<img src="images/project_logo02.png" id="main_logo" onclick="location.href='index.jsp'">
		<!-- 로그인이 되어있는 경우 -->
		<c:if test="${sessionScope.user != null }">
			<nav id="navbar">
				<ul>
				    <li><a href="index.jsp">홈으로</a></li>
				    <li><a href="free.jsp">자유게시판</a></li>
				    <li><a href="notice.jsp">공지게시판</a></li>
				    <li><a href="timetable.jsp">시간표</a></li>
				    <li><a href="#">인기게시판</a></li>
				</ul>
			</nav>
			<div class="buttons">
			    <button type="button" id="top_logout_btn" onclick="location.href='logout.jsp'">로그아웃</button>
			    <button type="button" id="top_updateInfo_btn" onclick="location.href='updateUserInfo.jsp'">정보수정</button>
			</div>
		</c:if>
		<!-- 로그인이 되어있지 않을경우 -->
		<c:if test="${sessionScope.user == null }">
			<nav id="navbar">
				<ul>
				    <li><a href="index.jsp">홈으로</a></li>
				    <li><a href="#" onclick="goLogin()">자유게시판</a></li>
				    <li><a href="#" onclick="goLogin()">공지게시판</a></li>
				    <li><a href="#" onclick="goLogin()">시간표</a></li>
				    <li><a href="#" onclick="goLogin()">인기게시판</a></li>
				</ul>
			</nav>
			<div class="buttons">
			    <button type="button" id="top_login_btn" onclick="location.href='login.jsp'">로그인</button>
			    <button type="button" id="top_signUp_btn" onclick="location.href='signUp.jsp'">회원가입</button>
			</div>
		</c:if>
	</div>
	<input type="hidden" id="user_id" value="${sessionScope.user.id }"><!-- 세션 아이디 -->
	<input type="hidden" id="user_univ" value="${sessionScope.user.univ }"><!-- 세션 대학 -->
	<input type="hidden" id="user_grade" value="${sessionScope.user.grade }"><!-- 세션 등급 -->
<script>
	function goLogin(){
		if(confirm("로그인 후 이용가능합니다.\n로그인 하시겠습니까?\n[만약 아이디가 없으시다면 회원가입 부탁드립니다.]") == true){
			location.href = "login.jsp";
		}
	}
	
	$(function(){
		if(document.querySelector("body").id == "main"){
			$("#navbar > ul > li:nth-child(1)").css("border-bottom", "3px solid #ff4000");
			$("#navbar > ul > li:nth-child(1) > a").css("color", "black");
		}else if(document.querySelector("body").id == "free"){
			$("#navbar > ul > li:nth-child(2)").css("border-bottom", "3px solid #ff4000");
			$("#navbar > ul > li:nth-child(2) > a").css("color", "black");
		}else if(document.querySelector("body").id == "notice"){
			$("#navbar > ul > li:nth-child(3)").css("border-bottom", "3px solid #ff4000");
			$("#navbar > ul > li:nth-child(3) > a").css("color", "black");
		}else if(document.querySelector("body").id == "timetable"){
			$("#navbar > ul > li:nth-child(4)").css("border-bottom", "3px solid #ff4000");
			$("#navbar > ul > li:nth-child(4) > a").css("color", "black");
		}
	});
	/* info();
	function info(){
		let id = $("#user_id").val();
		let pw = $("#user_pw").val();
		let name = $("#user_name").val();
		let tel = $("#user_tel").val();
		let univ = $("#user_univ").val();
		let grade = $("#user_grade").val();
		alert("아이디 : " + id + "\n비밀번호 : " + pw + "\n이름 : " + name + "\n전화번호 : " + tel + "\n학교 : " + univ + "\n등급 : " + grade);
	} */
</script>
</body>
</html>