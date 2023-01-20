<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="css/main.css?v1">
<script src="jquery/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div class="main">
		<div id="notice_board">
		    <h3 class="title1"><a href="notice.jsp">공지사항</a></h3>
		    <ul class="notice_list">
		    </ul>
		</div>
		<div id="free_board">
		    <h3 class="freeBoard_title"><a href="free.jsp">자유 게시판</a></h3>
		    <ul class="free_list">
		    </ul>
		</div>
		<div id="timeTable">
		    <h3 class="timeTable_title"><a href="#">내 시간표</a></h3>
		    <ul class="timeTable_list">
		    </ul>
		</div>
		<div id="hot_board">
		    <h3 class="hotBoard_title"><a href="#">🔥HOT 게시글🔥(추가예정)</a></h3>
		    <ul class="hot_list">
		    </ul>
		</div>
	</div>
<script>
	getNoticeList();
	getFreeList();
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
	
	/* 자유게시글 섹션 */
	function getFreeList(){
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
		xhttp.open("GET", "getMainFreeList.do", true);
		xhttp.send();
	}
</script>
</body>
</html>