<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홍보게시판</title>
<link rel="stylesheet" href="css/notice.css?v1.22">
</head>
<body id="notice">
<%@ include file="header.jsp" %>
	<div class="notice_container">
		<div id="notice_wrap">
			<div id="notice_title">
				<h2><a href="notice.jsp">공지게시판</a></h2>
			</div>
			<c:if test="${sessionScope.user.grade eq 'manager' }">
				<div id="write_line_off">
					<div id="open_notice_btn">새 공지를 작성해주세요!</div>
					<div id="write_pen"><img src="images/pen1.png"></div>
				</div>
				<div id="write_line_on">
					<p id="write_input_wrap"><input type="text" id="write_notice_title" name="write_notice_title" maxlength="50" placeholder="제목을 입력해주세요."><img src="images/write.png"></p>
					<p><textarea id="write_notice_content" placeholder="내용을 입력해주세요." maxlength="100"></textarea></p>
				</div>
			</c:if>
			<div id="noticeboard_main">
				<!-- 데이터 -->
			</div>
		</div>
	</div>
<%@ include file="footer.jsp" %>
<script>
	getNoticeList();
	/* 공지 목록출력 */
	function getNoticeList(){
		const main = document.querySelector("#noticeboard_main");
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
			let obj = JSON.parse(data);
			main.replaceChildren();
			$("#write_line_off").css("display", "flex");
			for(let i = 0; i < obj.length; i++){
				let ln = /<br>/gi;
				let content = obj[i].content.replace(ln, " ");
				main.innerHTML += 
					"<div id='notice_info_box'>" 
						+ "<div id='num'>" + obj[i].num + "</div>"
						+ "<div id='noticeTitle'>"+ obj[i].title + "</div>"
						+ "<div id='noticeContent'>" + content + "</div>"
						+ "<div id='regdate_grade_wrap'>"
							+ "<div id='regdate'>" + obj[i].regdate + "</div>"
							+ "<div id='grade'>관리자</div>"
						+ "</div>"
						+ "<div id='num' name='num' style='display:none;'" + obj[i].num + "</div>"
					+ "</div>";
			}
		}
		xhttp.open("GET", "getNoticeList.do", true);
		xhttp.send();
	}
	
	$("#write_line_off").on("click", function(){
		$("#write_line_on").css("display", "block");
		$("#write_line_off").css("display", "none");
		$(".notice_container").css("height", "1300px");
	});
	
	// 공지 등록
	$("#write_input_wrap > img").on("click", function(e){
		if($("#write_notice_title").val() == ""){
			alert("제목을 입력해주세요.");
			$("#write_notice_title").focus();
			return;
		}else if($("#write_notice_content").val() == ""){
			$("#write_notice_content").focus();
			alert("내용을 입력해주세요.");
			return;
		}else{
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function(){
				let data = this.responseText;
				let result = parseInt(data, 10);
				if(result == 1){
					alert("공지등록 완료");
					$("#write_notice_title").val("");
					$("#write_notice_content").val("");
					$("#write_line_on").css("display", "none");
					$("#write_line_off").css("display", "flex");
					$(".notice_container").css("height", "1000px");
					getNoticeList();
				}else{
					alert("공지등록 실패");
				}
			}
			let title = $("#write_notice_title").val();
			let content = $("#write_notice_content").val();
			let grade = "manager";
			let ln = /\n/gi;	// ln 전부다 정규식
			let content2 = content.replace(ln, "<br>");	// 개행처리하기
			
			xhttp.open("POST", "regNotice.do", true);
			xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhttp.send("title=" + title + "&content=" + content2 + "&grade=" + grade);
		}
	});
	
	// 공지 상세보기
	$(document).on("click", "#notice_info_box", function(e){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
			let obj = JSON.parse(data);
			/* alert(obj.num + ", " + obj.title + ", " + obj.content + ", " + obj.grade + ", " + obj.regdate); */
			let noticeboard_main = document.querySelector("#noticeboard_main");
			$("#write_line_off").css("display", "none");	// 글쓰기 버튼 숨김
			noticeboard_main.innerHTML = 
					"<div id='notice_box'>"
						+ "<div id='notice_num' style='display: none;'>" + obj.num + "</div>"
						+ "<div id='notice_header'>"
							+ "<img src='images/profile_img.png'>"
							+ "<div id='notice_grade_regdate'>"
								+ "<div id='notice_grade'>관리자</div>"
								+ "<div id='notice_regdate'>" + obj.regdate + "</div>"
							+ "</div>"
							+ "<ul class='updt_del'>"
								+ "<li class='update'>수정</li>"
								+ "<li class='del'>삭제</li>"
							+ "</ul>"
						+ "</div>"
						+ "<h2 id='noticeInfo_title'>" + obj.title + "</h2>"
						+ "<p id='notice_content'>" + obj.content + "</p>"
					+ "</div>";
			if($("#user_grade").val() == "manager"){
				// 등급이 매니저이면 수정, 삭제 on
				$(".del").css("display", "block");
				$(".update").css("display", "block");
			}
				
		}
		let num = e.currentTarget.children[0].innerText;
		xhttp.open("POST", "getNoticeInfo.do", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("num=" + num);
	});
	
	// 공지 삭제
	$(document).on("click", ".del", function(){
		if(confirm("공지를 삭제하시겠습니까?") == true){
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function(){
				let data = this.responseText;
   				let result = parseInt(data, 10);
   				if(result == 1){
   					alert("성공적으로 삭제되었습니다.");
   					getNoticeList();
   				}else{
   					alert("삭제실패");
	   			}
			}
			let num = $("#notice_num").text();
			xhttp.open("POST", "deleteNotice.do", true);
			xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhttp.send("num=" + num);
		}else{
			return;
		}
	});
	
	// 공지 수정
	$(document).on("click", ".update", function(){
		let title = $("#noticeInfo_title").text();
		let content = $("#notice_content").text();
		let num = $("#notice_num").text();
		const main = document.querySelector("#noticeboard_main");
		main.innerHTML =
			"<div id='update_notice_box'>"
				+ "<p id='update_input_wrap'><input type='text' id='update_notice_title' name='update_notice_title' maxlength='50' placeholder='공지 제목'><img src='images/write.png' id='update_btn'></p>"
				+ "<p><textarea id='update_notice_content' maxlength='100' placeholder='공지 내용'></textarea></p>"
				+ "<div id='notice_info_num' style='display:none;'>" + num + "</div>"
			+ "</div>";
		$("#update_notice_title").val(title);
		$("#update_notice_content").val(content);
	});
	
	// 수정 실행
	$(document).on("click", "#update_btn", function(){
		if($("#update_notice_title").val() == ""){
			alert("공지 제목을 입력해주세요.");
			return;
		}else if($("#update_notice_content").val() == ""){
			alert("공지 내용을 입력해주세요.");
			return;
		}else{
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function(){
				let data = this.responseText;
   				let result = parseInt(data, 10);
   				if(result == 1){
   					alert("성공적으로 수정되었습니다.");
   					getNoticeList();
   				}else{
   					alert("수정실패");
	   			}
			}
			let title = $("#update_notice_title").val();
			let content = $("#update_notice_content").val();
			let num = $("#notice_info_num").text();
			
			xhttp.open("POST", "updateNotice.do", true);
			xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhttp.send("title=" + title + "&content=" + content + "&num=" + num);
		}
	});
</script>
</body>
</html>