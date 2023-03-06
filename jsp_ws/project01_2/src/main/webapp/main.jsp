<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="css/main.css?v1.0.9">
<script src="jquery/jquery-3.3.1.min.js"></script>

</head>
<body>
<c:if test="${sessionScope.user != null }">
	<div class="main">
		<div id="notice_board">
		    <h3 class="title1"><a href="notice.jsp">공지 게시판</a></h3>
		    <ul class="notice_list">
		    </ul>
		</div>
		<div id="free_board">
		    <h3 class="freeBoard_title"><a href="free.jsp">자유 게시판</a></h3>
		    <ul class="free_list">
		    </ul>
		</div>
		<div id="timeTable">
		    <h3 class="timeTable_title"><a href="#">나의 시간표</a></h3>
			<table border="1">
				<thead>
					<tr>
						<th></th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th></th>
					</tr>
				<thead>
				<tbody id="tbody">
					<c:forEach var="i" begin="1" end="12" step="1">
						<tr class="row${i }">
							<td class="period">${i}교시</td>
						<c:forEach var="j" begin="1" end="5" step="1">
							<td class="day${j}_startTime${i}_endTime${i + 1}"></td>
						</c:forEach>
						<c:if test="${i <= 5}">
							<td class="timeth">오전 ${i+7}시</td>
						</c:if>
						<c:if test="${i > 5 }">
							<td class="timeth">오후 ${i-5}시</td>
						</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div id="hot_board">
		    <h3 class="hotBoard_title"><a href="hot.jsp">🔥HOT 게시글🔥</a></h3>
		    <ul class="hot_list">
		    </ul>
		</div>
	</div>
</c:if>
<c:if test="${sessionScope.user == null }">
	<div class="main">
		<div id="notice_board">
		    <h3 class="title1"><a href="#" onclick="goLogin()">공지 게시판</a></h3>
		    <ul class="notice_list">
		    </ul>
		</div>
		<div id="free_board">
		    <h3 class="freeBoard_title"><a href="#" onclick="goLogin()">자유 게시판</a></h3>
		    <ul class="free_list">
		    </ul>
		</div>
		<div id="timeTable">
		    <h3 class="timeTable_title"><a href="#" onclick="goLogin()">나의 시간표</a></h3>
			<table border="1">
				<thead>
					<tr>
						<th></th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th></th>
					</tr>
				<thead>
				<tbody id="tbody">
					<c:forEach var="i" begin="1" end="12" step="1">
						<tr>
							<td class="period">${i}교시</td>
						<c:forEach var="j" begin="1" end="5" step="1">
							<td class="day${j}_startTime${i}_endTime${i + 1}"></td>
						</c:forEach>
						<c:if test="${i <= 5}">
							<td class="timeth">오전 ${i+7}시</td>
						</c:if>
						<c:if test="${i > 5 }">
							<td class="timeth">오후 ${i-5}시</td>
						</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="outer">
				<div class="main_timetable_box">
					<h3>로그인 후 이용가능합니다!</h3>
				</div>
			</div>
		</div>
		<div id="hot_board">
		    <h3 class="hotBoard_title"><a href="#" onclick="goLogin()">🔥HOT 게시글🔥</a></h3>
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
		
		$(".hot_list").append(
			"<li class='noLoginText'>로그인 후 이용가능합니다!</li>"
		);
	</script>
</c:if>
<script>
	$(document).ready(function(){
		getNoticeList();
		getTimetable();
		getHotList();
	});
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
	
	// HOT 게시글
	function getHotList(){
		const hot_list = document.querySelector(".hot_list");
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
			let obj = JSON.parse(data);
			for(let i = 0; i < obj.length; i++){
				console.log(obj[i].title.length);
				if(obj[i].title.length < 20){
					hot_list.innerHTML += 
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
		let univ = $("#user_univ").val();
		xhttp.open("GET", "getHotList.do?univ=" + univ, true);
		xhttp.send();
	}
	
	// 자유게시판 영역 클릭시 로그인페이지 이동 or 페이지 전환
	$("#notice_board").on("click", function(){
		if($("#user_id").val() == ""){
			if(confirm("로그인 후 이용가능합니다.\n로그인 하시겠습니까?\n[만약 아이디가 없으시다면 회원가입 부탁드립니다.]") == true){
				location.href = "login.jsp";
			}else{
				return;
			}
		}else{
			location.href = "notice.jsp";
		}
	});
	$("#free_board").on("click", function(){
		if($("#user_id").val() == ""){
			if(confirm("로그인 후 이용가능합니다.\n로그인 하시겠습니까?\n[만약 아이디가 없으시다면 회원가입 부탁드립니다.]") == true){
				location.href = "login.jsp";
			}else{
				return;
			}
		}else{
			location.href = "free.jsp";
		}
	});
	$("#timeTable").on("click", function(){
		if($("#user_id").val() == ""){
			if(confirm("로그인 후 이용가능합니다.\n로그인 하시겠습니까?\n[만약 아이디가 없으시다면 회원가입 부탁드립니다.]") == true){
				location.href = "login.jsp";
			}else{
				return;
			}
		}else{
			location.href = "timetable.jsp";
		}
	});
	
	$("#hot_board").on("click", function(){
		if($("#user_id").val() == ""){
			if(confirm("로그인 후 이용가능합니다.\n로그인 하시겠습니까?\n[만약 아이디가 없으시다면 회원가입 부탁드립니다.]") == true){
				location.href = "login.jsp";
			}else{
				return;
			}
		}else{
			location.href = "#";
		}
	});
	
	// 시간표 불러오기
	function getTimetable(){
		//alert("실행");
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
			let obj = JSON.parse(data);
			//$("#tbody").empty();
			for(let i = 0; i < obj.length; i++){
				$(".row" + obj[i].startTime).children().eq(obj[i].day).html(
					"<div class='subInfo'>" 
						+ "<div id='subName'>" + obj[i].subName + "</div>" 
						+ "<div id='profName'>" + obj[i].profName + "</div>" 
						+ "<div id='info_place'>" + obj[i].place + "</div>" 
					+ "</div>"
				);
				
				$(".row" + obj[i].startTime).children().eq(obj[i].day).css("backgroundColor", obj[i].color);
			}
		}
		let id = $("#user_id").val();
		xhttp.open("GET", "getTimetable.do?id=" + id, true);
		xhttp.send();
	}
</script>
</body>
</html>