<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        		<input type="button" id="reg_do_btn" value="공지 등록하기">
        	</c:if>
        	<div id="noticeList_box">
        		<!-- 데이터 -->
        	</div>
        </div>
        <!-- 공지등록 팝업 -->
        <div class="outer">
        	<div class="inner">
        		<div id="close_btn">X</div>
        		<h2>공지등록</h2>
        		<!-- 글자 수 카운트 -->
        		<div class="textLengthWrap">
	        		제목 :&nbsp;<p class="reg_textCount1">0자</p>
	        		<p class="textTotal1">/30자</p>
        		</div>
        		<div class="textLengthWrap">
	        		내용 :&nbsp;<p class="reg_textCount2">0자</p>
	        		<p class="textTotal2">/70자</p>
        		</div>
        		<input type="text" id="notice_title" placeholder="제목을 입력해주세요.(30자 이하)"><br>
        		<textarea id="notice_content" placeholder="내용을 입력해주세요.(70자 이하)"></textarea><br>
        		<button id="write_notice_btn">등록</button>
        	</div>
        </div>
        
        <!-- 공지 수정 팝업 -->
        <div class="outer">
        	<div class="update_inner">
        		<div id="update_close_btn">X</div>
        		<h2>공지수정</h2>
        		<!-- 글자 수 카운트 -->
        		<div class="textLengthWrap">
	        		제목 :&nbsp;<p class="update_textCount1">0자</p>
	        		<p class="textTotal1">/30자</p>
        		</div>
        		<div class="textLengthWrap">
	        		내용 :&nbsp;<p class="update_textCount2">0자</p>
	        		<p class="textTotal2">/70자</p>
        		</div>
        		<input type="text" id="notice_update_title" placeholder="수정할 제목을 입력해주세요.(30자 이하)"><br>
        		<textarea id="notice_update_content" placeholder="수정할 내용을 입력해주세요.(70자 이하)"></textarea><br>
        		<button id="notice_update_btn">수정</button>
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
			for(let i = 0; i < obj.length; i++){
				listBox.innerHTML += 
				"<div id='notice_info_box'>" 
				+ "<div id='noticeTitle'><h4>"+ obj[i].title + "</h4></div>"
				+ "<div id='noticeContent'>" + obj[i].content + "</div>"
				+ "<div id='grade'>" + obj[i].grade + "</div>"
				+ "<div id='regdate'>" + obj[i].regdate + "</div>"
				+ "<input type='hidden' id='num' name='num' value=" + obj[i].num + ">"
				+ "<button type='button' id='update_notice_btn'>수정하기</button>"
				+ "<input type='button' id='delete_notice_btn' name='delete_notice_btn' value='삭제하기'>"
				+ "</div>";
			}
		}
		xhttp.open("GET", "getNoticeList.do", true);
		xhttp.send();
	}
	
	/* 공지 수정, 삭제 */
	const noticeList_box = document.querySelector("#noticeList_box");
	noticeList_box.addEventListener("click", function(e){
		let grade = document.querySelector("#user_grade").value;
		/* if(e.target.tagName != "INPUT" && e.target.tagName != "BUTTON"){
			return;
		}else if(grade != "manager"){
			alert(e.target.id);
			alert("관리자만 공지를 삭제할 수 있습니다.");
			return;
		} */
		if(e.target.tagName != "INPUT" && e.target.tagName != "BUTTON"){
			return;
		}else if(e.target.id == "update_notice_btn" && grade == "manager"){
			// 수정 실행
			let title = e.target.parentElement.children[0].innerText;
			let content = e.target.parentElement.children[1].innerText;
			let num = e.target.parentElement.children[4].value;
			document.querySelector(".update_inner").style.display = "block";
			document.querySelector("#notice_update_title").value = title;
			document.querySelector("#notice_update_content").value = content;
			$(".update_textCount1").text(title.length + "자"); // 수정할 공지의 제목길이
			$(".update_textCount2").text(content.length + "자"); // 수정할 공지의 내용길이
			
			let notice_update_btn = document.querySelector("#notice_update_btn");
			notice_update_btn.addEventListener("click", function(evt){
				const xhttp = new XMLHttpRequest();
				xhttp.onload = function(){
					let data = this.responseText;
					let result = parseInt(data, 10);
					if(result == 1){
						alert("공지 수정 성공");
						document.querySelector("#notice_update_title").value = "";
						document.querySelector("#notice_update_content").value = "";
						document.querySelector(".update_inner").style.display = "none";
						getNoticeList();
					}else{
						alert("공지 수정 실패");
					}
				}
				let update_title = document.querySelector("#notice_update_title").value;
				let update_content = document.querySelector("#notice_update_content").value;
				xhttp.open("POST", "updateNotice.do", true);
				xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				xhttp.send("num=" + num + "&title=" + update_title + "&content=" + update_content);
			});
		}else if(e.target.id == "delete_notice_btn" && grade == "manager"){
			// 삭제 실행
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function(){
				let data = this.responseText;
				let result = parseInt(data, 10);
				
				if(result === 1){
					alert("공지 삭제 완료");
					getNoticeList();
				}else{
					alert("공지 삭제 실패");
				}
			}
			let num = e.target.parentElement.children[4].value;
			xhttp.open("POST", "deleteNotice.do", true);
			xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhttp.send("num=" + num);
		}else{
			alert("관리자만 공지를 수정, 삭제할 수 있습니다.");
		}
	});
	
	/* 수정 창닫기 */
	let update_close_btn = document.querySelector("#update_close_btn");
	update_close_btn.addEventListener("click", function(e){
        document.querySelector(".update_inner").style.display = "none";
    });
	/* 공지 수정 제목 글자 수 제한 */
	$("#notice_update_title").keyup(function(e){
		let title = $(this).val();
		if(title.length == 0 || title == ""){
			$(".update_textCount1").text("0자");
		}else{
			$(".update_textCount1").text(title.length + "자");
		}
		if (title.length > 30) {
	    	// 30자 부터는 타이핑 X
	        $(this).val($(this).val().substring(0, 30));
	        // 30자 넘으면 알림창 뜨도록
	        alert("제목은 최대 30자까지 입력 가능합니다.");
	    };
	});
	/* 공지 수정 내용 글자 수 제한 */
	$("#notice_update_content").keyup(function(e){
		let content = $(this).val();
		if(content.length == 0 || content == ""){
			$(".update_textCount2").text("0자");
		}else{
			$(".update_textCount2").text(content.length + "자");
		}
		if (content.length > 70) {
	    	// 100자 부터는 타이핑 되지 않도록
	        $(this).val($(this).val().substring(0, 70));
	        // 100자 넘으면 알림창 뜨도록
	        alert("공지수정 내용은 최대 70자까지 입력 가능합니다.");
	    };
	});
	
	/* 공지 등록 제목 글자 수 제한 */
	$("#notice_title").keyup(function(e){
		let title = $(this).val();
		if(title.length == 0 || title == ""){
			$(".reg_textCount1").text("0자");
		}else{
			$(".reg_textCount1").text(title.length + "자");
		}
		if (title.length > 30) {
	    	// 30자 부터는 타이핑 X
	        $(this).val($(this).val().substring(0, 30));
	        // 30자 넘으면 알림창 뜨도록
	        alert('공지등록 제목은 최대 30자까지 입력 가능합니다.');
	    };
	});
	/* 공지 등록 내용 글자 수 제한 */
	$("#notice_content").keyup(function(e){
		let content = $(this).val();
		if(content.length == 0 || content == ""){
			$('.reg_textCount2').text('0자');
		}else{
			$('.reg_textCount2').text(content.length + '자');
		}
		if (content.length > 70) {
	    	// 100자 부터는 타이핑 되지 않도록
	        $(this).val($(this).val().substring(0, 70));
	        // 100자 넘으면 알림창 뜨도록
	        alert('공지등록 내용은 최대 70자까지 입력 가능합니다.');
	    };
	});
	
	/* $("#update_notice_btn").on("click", updateNotice);
	function updateNotice(e){
		if(e.target.tagName != "BUTTON"){
			return;
		}
		alert("update button");
	} */

	
	
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
		let grade = "manager";
		xhttp.send("title=" + title + "&content=" + content + "&grade=" + grade);
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