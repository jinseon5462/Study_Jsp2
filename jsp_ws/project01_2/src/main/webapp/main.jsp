<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="css/main.css?v1">
<script src="jquery/jquery-3.3.1.min.js"></script>
</head>
<body>
<c:if test="${sessionScope.user != null }">
	<div class="main">
		<div id="notice_board">
		    <h3 class="title1"><a href="notice.jsp">홍보게시판</a></h3>
		    <ul class="notice_list">
		    </ul>
		</div>
		<div id="free_board">
		    <h3 class="freeBoard_title"><a href="free.jsp">자유게시판</a></h3>
		    <ul class="free_list">
		    </ul>
		</div>
		<div id="timeTable">
		    <h3 class="timeTable_title"><a href="#">시간표</a></h3>
		    <ul class="timeTable_list">
		    </ul>
		</div>
		<div id="hot_board">
		    <h3 class="hotBoard_title"><a href="#">🔥HOT 게시글🔥(추가예정)</a></h3>
		    <ul class="hot_list">
		    </ul>
		</div>
	</div>
</c:if>
<c:if test="${sessionScope.user == null }">
	<div class="main">
		<div id="notice_board">
		    <h3 class="title1"><a href="#" onclick="goLogin()">홍보게시판</a></h3>
		    <ul class="notice_list">
		    </ul>
		</div>
		<div id="free_board">
		    <h3 class="freeBoard_title"><a href="#" onclick="goLogin()">자유게시판</a></h3>
		    <ul class="free_list">
		    </ul>
		</div>
		<div id="timeTable">
		    <h3 class="timeTable_title"><a href="#" onclick="goLogin()">시간표</a></h3>
		    <ul class="timeTable_list">
		    </ul>
		</div>
		<div id="hot_board">
		    <h3 class="hotBoard_title"><a href="#" onclick="goLogin()">🔥HOT 게시글🔥(추가예정)</a></h3>
		    <ul class="hot_list">
		    </ul>
		</div>
	</div>
</c:if>
<!-- 로그인하였을때 자유게시판 목록 -->
<c:if test="${sessionScope.user != null }">
	<script>
		loginGetFreeList();
		function loginGetFreeList(){
			const freeList = document.querySelector(".free_list");
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function(){
				let data = this.responseText;
				let obj = JSON.parse(data);
				for(let i = 0; i < obj.length; i++){
					if(obj[i].title.length < 30){
						freeList.innerHTML += 
							"<li class='items'>" + obj[i].title + "<span>"
							+ obj[i].regdate + "</span></li>";
					}else{
						let title = obj[i].title.substring(0, 30);
						freeList.innerHTML += 
							"<li class='items'>" + title + "..." + "<span>"
							+ obj[i].regdate + "</span></li>";
					}
				}
			}
			let univ = $("#user_univ").val();
			xhttp.open("GET", "getMainFreeList.do?univ=" + univ, true);
			xhttp.send();
		}
	</script>
</c:if>
<!-- 비로그인일때 메인 자유게시판 목록 -->
<c:if test="${sessionScope.user == null }">
	<script>
		notLoginGetFreeList();
		function notLoginGetFreeList(){
			const freeList = document.querySelector(".free_list");
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function(){
				let data = this.responseText;
				let obj = JSON.parse(data);
				for(let i = 0; i < obj.length; i++){
					if(obj[i].title.length < 30){
						freeList.innerHTML += 
							"<li class='items'>" + obj[i].title + "<span>"
							+ obj[i].regdate + "</span></li>";
					}else{
						let title = obj[i].title.substring(0, 30);
						freeList.innerHTML += 
							"<li class='items'>" + title + "..." + "<span>"
							+ obj[i].regdate + "</span></li>";
					}
				}
			}
			xhttp.open("GET", "getNotLoginMainFreeList.do", true);
			xhttp.send();
		}
	</script>
</c:if>
<script>
	getNoticeList();
	/* 공지섹션 */
	function getNoticeList(){
		const notice_list = document.querySelector(".notice_list");
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
			let obj = JSON.parse(data);
			for(let i = 0; i < obj.length; i++){
				console.log(obj[i].title.length);
				if(obj[i].title.length < 20){
					notice_list.innerHTML += 
						"<li class='items'>" + obj[i].title + "<span>"
						+ obj[i].regdate + "</span></li>";
				}else{
					let content = obj[i].title.substring(0, 20);
					notice_list.innerHTML += 
						"<li class='items'>" + content + "..." + "<span>"
						+ obj[i].regdate + "</span></li>";
				}
			}
		}
		xhttp.open("GET", "getMainNoticeList.do", true);
		xhttp.send();
	}
	
	/* 로그인 후 자유게시글 섹션 */
	/* function Login_GetFreeList(){
		const freeList = document.querySelector(".free_list");
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
			let obj = JSON.parse(data);
			for(let i = 0; i < obj.length; i++){
				if(obj[i].title.length < 30){
					freeList.innerHTML += 
						"<li class='items'>" + obj[i].title + "<span>"
						+ obj[i].regdate + "</span></li>";
				}else{
					let title = obj[i].title.substring(0, 30);
					freeList.innerHTML += 
						"<li class='items'>" + title + "..." + "<span>"
						+ obj[i].regdate + "</span></li>";
				}
			}
		}
		let univ = $("#user_univ").val();
		xhttp.open("GET", "getMainFreeList.do?univ=" + univ, true);
		xhttp.send();
	} */
</script>
</body>
</html>