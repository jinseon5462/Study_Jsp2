<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="css/headerStyle.jsp" %>
<%@ include file="css/freeBoardStyle.jsp" %>
<%@ include file="css/footerStyle.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
<script src="jquery/jquery-3.3.1.min.js"></script>

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
					<option value="writer">작성자로 검색하기</option>
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
        	<div class="2btn">
	        	<button type="button" id="before_btn">이전</button>
	        	<button type="button" id="after_btn">다음</button>
        	</div>
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
        <input type="hidden" id="user_id" value="${sessionScope.user.id }"><!-- 세션 아이디 -->
        <input type="hidden" id="user_univ" value="${sessionScope.user.univ }"><!-- 세션 대학 -->
        <input type="hidden" id="user_grade" value="${sessionScope.user.grade }"><!-- 세션 등급 -->
        <%@ include file="footer.jsp" %>
    </div> <!-- container -->
    
<c:if test="${sessionScope.user != null }">
	<script>
	/* 게시글 등록 열기 */
	if(document.querySelector("#user_id") != null){
		let write_free_btn = document.querySelector("#write_free_btn");
		write_free_btn.addEventListener("click", openWriteFreePop);
		
		function openWriteFreePop(){
			document.querySelector(".inner").style.display = "block";
		}
	}
	</script>
</c:if>

<script>
	getFreeboardList();
	
	/* 제목누르면 초기리스트 보여주기 */
	$("#tit").on("click", function(){
		document.querySelector(".freeBoard_box").style.height = "1400px";
		document.querySelector("#searchBox").style.display = "block";
		document.querySelector("#write_free_btn").style.display = "block";
		getFreeboardList();
	});
	
	/* 게시글 출력 */
	function getFreeboardList(){
		const freeList = document.querySelector("#freeList_box");
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
			let obj = JSON.parse(data);
			freeList.replaceChildren();
			for(let i = 0; i < 10; i++){
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
				"<div id='free_info_box'><div id='freeTitle'><h4>"
				+ obj[i].title + "</h4></div>" + "<div id='freeContent'>" + obj[i].content + "</div>"
				+ "<div id='writer'>" + obj[i].writer + "(" + obj[i].univ + ")" 
				+ "<div id='logo_box'><img id='univ_logo' src=" + univ_logo + "></div>" + "</div>" 
				+ "<div id='regdate'>" + obj[i].regdate + "일 등록" + "</div></div>"; 
			}
		}
		xhttp.open("GET", "getFreeboardList.do", true);
		xhttp.send();
	}
	
	/* 게시글 등록 */
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
		let writer = document.querySelector("#user_id").value;
		let univ = document.querySelector("#user_univ").value;
		
		xhttp.open("POST", "regFree.do", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("title=" + title + "&content=" + content + "&writer=" + writer + "&univ=" + univ);
	}
	
	/* 창닫기 */
	let close_btn = document.querySelector("#close_btn");
    close_btn.addEventListener("click", function(e){
        document.querySelector(".inner").style.display = "none";
    });
    
    /* 키워드검색 */
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
				for(let i = 0; i < 10; i++){
					let univ_logo = "";
					if(obj[i].univ === "동의대"){
						univ_logo = "images/donge.png";
					}else if(obj[i].univ === "경성대"){
						univ_logo = "images/kyungsung.png";
					}else{
						univ_logo = "images/pukyeong.png";
					}
					freeList.innerHTML += "<div id='free_info_box'><div id='freeTitle'><h4>"
						+ obj[i].title + "</h4></div>" + "<div id='freeContent'>" + obj[i].content + "</div>"
						+ "<div id='writer'>" + obj[i].writer + "<div id='logo_box'><img id='univ_logo' src=" + univ_logo + "></div>"
						+ "</div>" + "<div id='regdate'>" + obj[i].regdate + "일 등록" + "</div></div>";
				}
			}
			let sel = document.querySelector("#sel").value;
			let keyw = document.querySelector("#keyword").value;
			
			xhttp.open("GET", "getKeywordList.do?sel=" + sel + "&keyword=" + keyw, true);
			xhttp.send();
		}
    }
    
    /* 상세보기 */
    $("#freeList_box").on("click", "h4", function(e){
    	const freeList = document.querySelector("#freeList_box");
    	const xhttp = new XMLHttpRequest();
    	xhttp.onload = function(){
    		document.querySelector("#before_btn").style.display = "none";
    		document.querySelector("#searchBox").style.display = "none";
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
			}else{
				photo = "images/pukyeong.png";
			}
			freeList.innerHTML = "<div class='info_box'>"
			+ "<div id='close_button'><button type='button' id='info_close_btn' onclick='close_info()'>X</button></div>"
			+ "<div id='info_photo'><img src=" + photo + "></div>"
			+ "<div id='info_writer'>" + info.writer + "</div>"
			+ "<div id='info_regdate'>" + info.regdate + "</div>"
			+ "<div id='info_title'>" + info.title + "</div>"
			+ "<div id='info_content'>" + info.content + "</div>"
			/* + "<div id='info_univ'>" + info.univ + "</div>" */
			+ "<div id='info_view'>" + "조회수 : " + info.view + "</div>"
			+ "</div>"
			/* 댓글영역 */
			+ "<div class='reply_box'>"
			+ "<div>hello</div>"
			+ "<div>hello</div>"
			+ "<div>hello</div>"
			+ "</div>"
			+ "<input type='text' id='reply' name='reply' placeholder='댓글을 입력하세요.' autocomplete='off'>"
			+ "<img id='pen' src='images/write.png'>";
    	}
    	
    	let title = e.target.innerText;
    	let writer = e.target.parentElement.parentElement.children[2].innerText;
    	xhttp.open("POST", "showInfo.do", true);
    	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    	xhttp.send("title=" + title + "&writer=" + writer);
    });
    
    
    /* 상세보기 닫기 */
	function close_info(){
    	document.querySelector(".freeBoard_box").style.height = "1400px";
		document.querySelector("#searchBox").style.display = "block";
		document.querySelector("#write_free_btn").style.display = "block";
		getFreeboardList();
    }
    
    $("#pen").on("click", function(){
    	
    });
    
    
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