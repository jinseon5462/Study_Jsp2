<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/free.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
</head>
<body>
	<div class="container">
        <%@ include file="header.jsp" %>
        <div class="box freeBoard_box">
        	<div id="searchBox">
        		<!-- 상단 서치바 -->
				<select id="sel">
					<option value="title">제목으로 검색하기</option>
					<option value="content">내용으로 검색하기</option>
					<option value="id">작성자로 검색하기</option>
					<option value="univ">학교로 검색하기</option>
				</select>
				<input type="text" id="keyword" value="">
				<!-- <input type="button" id="keyword_btn" value="검색"> -->
			</div>
			<!-- 상단 대제목 -->
        	<div id="title_freeBoard"><h2 id="tit">자유 게시판</h2></div>
					<input type="button" id="write_free_btn"value="글쓰기">
        	<div id="freeList_box">
        		<!-- 데이터 표시 -->
        	</div>
        </div>
       	<div class="box">
        	<input type="button" id="before_btn" value=" 이전">
        	<input type="button" id="after_btn" value="다음 >">
       	</div>
        <!-- 게시글 등록 팝업 -->
        <div class="outer">
        	<div class="inner">
        		<div id="close_btn">X</div>
        		<h2>게시글 등록</h2>
        		<input type="text" id="free_title" placeholder="제목을 입력해주세요."><br>
        		<textarea id="free_content" placeholder="내용을 입력해주세요.(200자 이하)"></textarea><br>
        		<button id="reg_do_btn">등록</button>
        	</div>
        </div>
        <%-- <input type="hidden" id="user_id" value="${sessionScope.user.id }"> --%><!-- 세션 아이디 -->
        <%-- <input type="hidden" id="user_univ" value="${sessionScope.user.univ }"> --%><!-- 세션 대학 -->
        <%-- <input type="hidden" id="user_grade" value="${sessionScope.user.grade }"> --%><!-- 세션 등급 -->
        <%@ include file="footer.jsp" %>
    </div> <!-- container -->
    

<script>
	getFreeboardList();
	/* 게시글 등록 열기 */
	let write_free_btn = document.querySelector("#write_free_btn");
	write_free_btn.addEventListener("click", openWriteFreePop);
	
	function openWriteFreePop(){
		if(document.querySelector("#user_id").value != ""){
			document.querySelector(".inner").style.display = "block";
		}else{
			alert("로그인 후 이용가능합니다.");
			let url = "login.jsp";
			window.open(url,"_blank",
				"width=301, height=301"		
			);
		}
	}
	/* 제목누르면 초기리스트 보여주기 */
	$("#tit").on("click", function(){
		document.querySelector(".freeBoard_box").style.height = "800px";
		document.querySelector("#searchBox").style.display = "block";
		document.querySelector("#before_btn").style.display = "inline-block";
		document.querySelector("#after_btn").style.display = "inline-block";
		document.querySelector("#write_free_btn").style.display = "block";
		getFreeboardList();
	});
	
	/* 게시글 목록 출력 */
	function getFreeboardList(){
		const freeList = document.querySelector("#freeList_box");
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
			let obj = JSON.parse(data);
			freeList.replaceChildren();
			for(let i = 0; i < obj.length; i++){
				let univ_logo = "";
				if(obj[i].univ === "동의대"){
					univ_logo = "images/donge.png";
				}else if(obj[i].univ === "경성대"){
					univ_logo = "images/kyungsung.png";
				}else if(obj[i].univ === "동아대"){
					univ_logo = "images/donga.png";
				}else if(obj[i].univ === "부경대"){
					univ_logo = "images/pukyeong.png";
				}else if(obj[i].univ === "부산대"){
					univ_logo = "images/busan.png";
				}
				freeList.innerHTML += 
					"<div id='free_info_box'>" 
					+ "<div id='freeTitle'>"
						+ "<h4>"+ obj[i].title + "</h4>"
					+ "</div>"
					+ "<div id='freeContent'>" + obj[i].content + "</div>"
					+ "<div id='gray_line'>"
						+ "<div id='id'>" + obj[i].id + "</div>"
						+ "<div id='univ'>" + "[" + obj[i].univ + "]" + "</div>"
						+ "<div id='logo_box'><img id='univ_logo' src=" + univ_logo + "></div>"
					+ "</div>"
					+ "<div id='bottom_regdate_view_replyCount_box'"
						+ "<div id='regdate'>" + obj[i].regdate + "일 등록" + "</div>"
						+ "<div id='replyCount'> 💬 " + obj[i].replyList.length + "</div>"
						+ "<div id='viewCount'> 🔎 " + obj[i].view + "</div>"
					+ "</div>"	/* bottom_regdate_view_replyCount_box */ 
					+ "</div>";
			}
			// 게시글 수가 5개가 되면 이전 다음버튼
			if(obj.length === 5){
				document.querySelector("#before_btn").style.display = "inline-block";
				document.querySelector("#after_btn").style.display = "inline-block";
			}else{
				document.querySelector("#before_btn").style.display = "none";
				document.querySelector("#after_btn").style.display = "none";
			}
		}
		xhttp.open("GET", "getFreeboardList.do", true);
		xhttp.send();
	}
	
	//게시글 등록
	let reg_do_btn = document.querySelector("#reg_do_btn");
	reg_do_btn.addEventListener("click", writeFree);
	
	function writeFree(){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
			let result = parseInt(data, 10);
			if(result == 1){
				alert("게시글 등록 성공");
				document.querySelector(".inner").style.display = "none";
				document.querySelector("#free_title").value = "";
				document.querySelector("#free_content").value = "";
				getFreeboardList();
			}else{
				alert("게시글 등록 실패");
			}
		}
		let title = document.querySelector("#free_title").value;
		let content = document.querySelector("#free_content").value;
		let id = document.querySelector("#user_id").value;
		let univ = document.querySelector("#user_univ").value;
		
		xhttp.open("POST", "regFree.do", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("title=" + title + "&content=" + content + "&id=" + id + "&univ=" + univ);
	}
	
	// 창닫기
	let close_btn = document.querySelector("#close_btn");
    close_btn.addEventListener("click", function(e){
        document.querySelector(".inner").style.display = "none";
    });
    
    // 키워드검색
    let keyword = document.querySelector("#keyword");
    keyword.addEventListener("keyup", getKeywordList);
    
    function getKeywordList(e){
		if(e.keyCode != null){
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function(){
				const freeList = document.querySelector("#freeList_box");
				let data = this.responseText;
				let obj = JSON.parse(data);
				freeList.replaceChildren();
				for(let i = 0; i < obj.length; i++){
					let univ_logo = "";
					if(obj[i].univ === "경성대"){
						univ_logo = "images/kyungsung.png";
					}else if(obj[i].univ === "동의대"){
						univ_logo = "images/donge.png";
					}else if(obj[i].univ === "동아대"){
						univ_logo = "images/donga.png";
					}else if(obj[i].univ === "부경대"){
						univ_logo = "images/pukyeong.png";
					}else if(obj[i].univ === "부산대"){
						univ_logo = "images/busan.png";
					}
					freeList.innerHTML += 
						"<div id='free_info_box'>" 
						+ "<div id='freeTitle'>"
							+ "<h4>"+ obj[i].title + "</h4>"
						+ "</div>"
						+ "<div id='freeContent'>" + obj[i].content + "</div>"
						+ "<div id='gray_line'>"
							+ "<div id='id'>" + obj[i].id + "</div>"
							+ "<div id='univ'>" + "[" + obj[i].univ + "]" + "</div>"
							+ "<div id='logo_box'><img id='univ_logo' src=" + univ_logo + "></div>"
						+ "</div>"
						+ "<div id='bottom_regdate_view_replyCount_box'"
							+ "<div id='regdate'>" + obj[i].regdate + "일 등록" + "</div>"
							+ "<div id='replyCount'> 💬 " + obj[i].replyList.length + "</div>"
							+ "<div id='viewCount'> 🔎 " + obj[i].view + "</div>"
						+ "</div>"
						+ "</div>";
				}
				if(obj.length === 5){
					document.querySelector("#before_btn").style.display = "inline-block";
					document.querySelector("#after_btn").style.display = "inline-block";
				}else if(obj.length < 5){
					document.querySelector("#before_btn").style.display = "none";
					document.querySelector("#after_btn").style.display = "none";
				}
			}
			let sel = document.querySelector("#sel").value;
			let keyw = document.querySelector("#keyword").value;
			
			xhttp.open("GET", "getKeywordList.do?sel=" + sel + "&keyword=" + keyw, true);
			xhttp.send();
		}
    }
    
    // 게시글 상세보기
    $("#freeList_box").on("click", "h4", getDetail);
    
   	function getDetail(e){
    	const freeList = document.querySelector("#freeList_box");
    	const xhttp = new XMLHttpRequest();
    	xhttp.onload = function(){
    		document.querySelector("#searchBox").style.display = "none";
    		document.querySelector("#before_btn").style.display = "none";
    		document.querySelector("#after_btn").style.display = "none";
    		document.querySelector("#write_free_btn").style.display = "none";
    		document.querySelector(".freeBoard_box").style.height = "700px";
			let data = this.responseText;
			
			let info = JSON.parse(data);
			freeList.replaceChildren();
			let photo = "";
			if(info.univ === "경성대"){
				photo = "images/kyungsung.png";
			}else if(info.univ === "동의대"){
				photo = "images/donge.png";
			}else if(info.univ === "부경대"){
				photo = "images/pukyeong.png";
			}else if(info.univ === "동아대"){
				photo = "images/donga.png";
			}else if(info.univ === "부산대"){
				photo = "images/busan.png";
			}
			
			freeList.innerHTML = "<div class='info_box'>"
			+ "<div id='close_button'><button type='button' id='info_close_btn' onclick='close_info()'>X</button></div>"
			+ "<div id='info_photo'><img src=" + photo + "></div>"
			+ "<div id='info_id'>" + info.id + "</div>"
			+ "<div id='info_univ'>" + info.univ + "</div>"
			+ "<div id='info_regdate'>" + info.regdate + "</div>"
			+ "<div id='info_title'>" + info.title + "</div>"
			+ "<div id='info_content'>" + info.content + "</div>"
			+ "<div id='info_view'>" + "🔎 : " + info.view + "</div>"
			// + "<div id='replyCount'> 💬 " + info.replyList.length + "</div>"
			+ "<input type='hidden' id='bno' name='bno' value=" + info.bno + ">"	// bno
			+ "</div>"	// info_box 
			+ "<div class='reply_box'>" + "</div>"
			+ "<input type='text' id='reply' name='reply' placeholder='댓글을 입력하세요.' autocomplete='off'>"
			+ "<img id='pen' src='images/write.png' onclick='regReply()'>";
			
			// 댓글 목록 가져오기
			const xhttp2 = new XMLHttpRequest();
			xhttp2.onload = function(){
				let arr = this.responseText;
				let reply = JSON.parse(arr);
				
				let reply_box = document.querySelector(".reply_box");
				for(let i = 0; i < reply.length; i++){
					let reply_logo = "";
					if(reply[i].univ === "경성대"){
						reply_logo = "images/kyungsung.png";
					}else if(reply[i].univ === "동의대"){
						reply_logo = "images/donge.png";
					}else if(reply[i].univ === "동아대"){
						reply_logo = "images/donga.png";
					}else if(reply[i].univ === "부경대"){
						reply_logo = "images/pukyeong.png";
					}else if(reply[i].univ === "부산대"){
						reply_logo = "images/busan.png";
					}
					
					reply_box.innerHTML +=
						"<div id='reply_innerBox'>"
						+ "<div id='reply_top'>"
						+ "<img id='reply_logo' src=" + reply_logo + ">"
						+ "<div id='reply_id'>" + reply[i].id + "</div>"
						+ "</div>"
						+ "<div id='reply_content'>" + reply[i].content + "</div>"
						+ "<div id='reply_regdate'>" + reply[i].regdate + "</div>"
						+ "</div>";
				}
			}
			xhttp2.open("GET", "getReply.do?bno=" + info.bno, true);
			xhttp2.send();
    	}
    	
    	let title = e.target.innerText;
    	let id = e.target.parentElement.nextElementSibling.nextElementSibling.children[0].innerText;
    	xhttp.open("POST", "showInfo.do", true);
    	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    	xhttp.send("title=" + title + "&id=" + id);
    }
    
    /* 상세보기 닫기 */
	function close_info(){
    	document.querySelector(".freeBoard_box").style.height = "800px";
		document.querySelector("#searchBox").style.display = "block";
		document.querySelector("#write_free_btn").style.display = "block";
		document.querySelector("#before_btn").style.display = "inline-block";
		document.querySelector("#after_btn").style.display = "inline-block";
		getFreeboardList();
    }
    
    /* 댓글 등록 */
	function regReply(){
    	if(document.querySelector("#reply").value == ""){
    		alert("댓글 내용을 입력후 등록해주세요.");
    		return;
    	}else if(document.querySelector("#user_id").value == ""){
    		alert("로그인 후 이용가능합니다.");
    		let url = "login.jsp";
    		window.open(url,"_blank",
    			"width=301, height=301"		
    		);
    		return;
    	}
    	const xhttp = new XMLHttpRequest();
    	xhttp.onload = function(){
    		let data = this.responseText;
    		let result = parseInt(data, 10);
    		if(result == 1){
    			alert("댓글 등록 성공!");
    			document.querySelector("#reply").value = "";	// 댓글 등록후 입력창 초기화
    			getRpl(document.querySelector("#bno").value);	// 게시글 번호 취득
    		}
    	}
    	xhttp.open("POST", "regReply.do", true);
    	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    	
    	let content = document.querySelector("#reply").value;
    	let id = document.querySelector("#user_id").value;
    	let univ = document.querySelector("#user_univ").value;
    	let bno = document.querySelector("#bno").value;
    	/* alert("id : " + id + ", content : " + content + ", univ : " + univ + ", bno : " + bno); */
    	xhttp.send("id=" + id + "&univ=" + univ + "&content=" + content + "&bno=" + bno);
    }
    
	/* 댓글 등록후 목록 갱신 */
    function getRpl(bno){
    	const xhttp = new XMLHttpRequest();
    	xhttp.onload = function(){
    		let arr = this.responseText;
			let reply = JSON.parse(arr);
			
			let reply_box = document.querySelector(".reply_box");
			reply_box.replaceChildren();
			for(let i = 0; i < reply.length; i++){
				let reply_logo = "";
				if(reply[i].univ === "경성대"){
					reply_logo = "images/kyungsung.png";
				}else if(reply[i].univ === "동의대"){
					reply_logo = "images/donge.png";
				}else if(reply[i].univ === "동아대"){
					reply_logo = "images/donga.png";
				}else if(reply[i].univ === "부경대"){
					reply_logo = "images/pukyeong.png";
				}else if(reply[i].univ === "부산대"){
					reply_logo = "images/busan.png";
				}
				
				reply_box.innerHTML +=
					"<div id='reply_innerBox'>"
					+ "<div id='reply_top'>"
					+ "<img id='reply_logo' src=" + reply_logo + ">"
					+ "<div id='reply_id'>" + reply[i].id + "</div>"
					+ "</div>"
					+ "<div id='reply_content'>" + reply[i].content + "</div>"
					+ "<div id='reply_regdate'>" + reply[i].regdate + "</div>"
					+ "</div>";
			}
    	}
    	xhttp.open("GET", "getReply.do?bno=" + bno, true);
		xhttp.send();
    }
    
    /* 페이징 */
    /* $("#before_btn").on("click", function(){
    	const xhttp = new XMLHttpRequest();
    	xhttp.onload = function(){
    		let data = this.responseText;
    		let list = JSON.parse(data);
    	}
    	xhttp.open("GET", "getPage.do", true);
    	xhttp.send();
    }); */
</script>
</body>
</html>