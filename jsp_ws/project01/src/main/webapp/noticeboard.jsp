<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="css/headerStyle.jsp" %>
<%@ include file="css/noticeBoardStyle.jsp" %>
<%@ include file="css/footerStyle.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지게시판</title>
</head>
<body>
	 <div class="container">
        <%@ include file="header.jsp" %>
        <div class="box noticeBoard_box">
        	<div id="title_noticeBoard"><h2>공지 게시판</h2></div>
        	<c:if test="${sessionScope.user.grade eq 'manager' }">
        		<input type="button" id="reg_do_btn"value="공지 등록하기">
        	</c:if>
        	<div id="noticeList_box">
        		<!--  -->
        	</div>
        </div>
        <div class="outer">
        	<div class="inner">
        		<div id="close_btn">X</div>
        		<h2>공지등록</h2>
        		<input type="text" id="notice_title" placeholder="제목을 입력해주세요."><br>
        		<textarea id="notice_content" placeholder="내용을 입력해주세요.(200자 이하)"></textarea><br>
        		<button id="write_notice_btn">등록</button>
        	</div>
        </div>
        <%@ include file="footer.jsp" %>
    </div> <!-- container -->
<script>
	
	getNoticeList();
	/* 공지 목록출력 */
	function getNoticeList(){
		const listBox = document.querySelector("#noticeList_box");
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
			let obj = JSON.parse(data);
			listBox.replaceChildren();
			for(let i = 0; i < 10; i++){
				listBox.innerHTML += 
				"<div id='notice_info_box'><div id='noticeTitle'><h4>"
				+ obj[i].title + "</h4></div>" + "<div id='noticeContent'>" + obj[i].content + "</div>"
				+ "<div id='writer'>" + obj[i].writer + "</div>" + "<div id='regdate'>" + obj[i].regdate + "</div></div>"; 
			}
		}
		xhttp.open("GET", "getNoticeList.do", true);
		xhttp.send();
	}
	
	/* 공지작성 */
	let write_notice_btn = document.querySelector("#write_notice_btn");
	write_notice_btn.addEventListener("click", writeNotice);
	
	function writeNotice(){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
			let result = parseInt(data, 10);
			if(result == 1){
				alert("공지등록 성공");
				document.querySelector(".inner").style.display = "none";
				document.querySelector("#notice_title").value = "";
				document.querySelector("#notice_content").value = "";
				getNoticeList();
			}else{
				alert("공지등록 실패");
			}
		}
		xhttp.open("POST", "regNotice.do", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		let title = document.querySelector("#notice_title").value;
		let content = document.querySelector("#notice_content").value;
		let writer = "manager";
		xhttp.send("title=" + title + "&content=" + content + "&writer=" + writer);
	}
	
	/* 공지등록 열기 */
	let reg_do_btn = document.querySelector("#reg_do_btn");
	reg_do_btn.addEventListener("click", openNoticePop);
	
	function openNoticePop(){
		document.querySelector(".inner").style.display = "block";
	}
	
	/* 창닫기 */
	let close_btn = document.querySelector("#close_btn");
    close_btn.addEventListener("click", function(e){
        document.querySelector(".inner").style.display = "none";
    });
</script>
</body>
</html>