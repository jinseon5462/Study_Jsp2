<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ include file="css/headerStyle.jsp" %> --%>
<script src="jquery/jquery-3.3.1.min.js"></script>
<link rel="favicon" href="images/favicon.ico">
<div class="box">
	<header>
		<c:if test="${sessionScope.user != null }">
			<div id="login_status">
				<div id="user">${sessionScope.user.id }</div>님&nbsp;|&nbsp;
				<div id="logout"><a href="logout.jsp">로그아웃</a></div>
			</div>
		</c:if>
		<c:if test="${sessionScope.user == null }">
			<div id="login_status">
				<div id="a_login"><a onclick="login()">로그인</a></div>
				<div id="a_login"><a onclick="location.href='regist.jsp'">회원가입</a></div>
			</div>
		</c:if>
		<div id="logo">
			<img src="images/project_logo02.png" onclick="location.href='index.jsp'">
		</div>
		<nav id="gnb">
			<ul id="main_menu">
				<li><a href="index.jsp">홈으로</a></li>
				<li><a href="noticeboard.jsp">공지사항</a></li>
				<li><a href="freeboard.jsp">자유 게시판</a></li>
				<li><a href="#">강의평 게시판(오픈예정)</a></li>
				<!-- <li><a href="#">장터 게시판</a></li> -->
			</ul>
		</nav>
	</header>
</div>
<input type="hidden" id="user_id" value="${sessionScope.user.id }"><!-- 세션 아이디 -->
<input type="hidden" id="user_univ" value="${sessionScope.user.univ }"><!-- 세션 대학 -->
<input type="hidden" id="user_grade" value="${sessionScope.user.grade }"><!-- 세션 등급 -->
<script>
function login(){
	let url = "login.jsp";
	window.open(url,"_blank",
		"width=301, height=301"		
	);
}

$(document).ready(function() {
    var w = $("#gnb ul li").width();            
    $("#gnb").append("<span></span>");
    $("#gnb ul li").on("mouseenter focusin", function() {
        var index = $(this).index();
        $(this).find("a").addClass("on");
        $(this).siblings().find("a").removeClass("on");
        $("#gnb span").stop().animate({
            left: index * w
        }, "fast", "swing");
    });
    $("#gnb ul li:eq(0)").trigger("mouseenter");           
});
</script>