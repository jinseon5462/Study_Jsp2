<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기 게시판</title>
<link rel="stylesheet" href="css/hot.css?v1.0.2">
<script src="jquery/jquery-3.3.1.min.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>
	<div class="hot_container">
		<div id="hotBoard_wrap">
			<div id="hotBoard_title">
				<h2><a href="hot.jsp">${sessionScope.user.univ } 인기게시판</a></h2>
			</div>
			<div id="hotBoard_main">
				<!-- 데이터 -->
			</div>
		</div>
	</div>
<%@ include file="footer.jsp" %>
<script>
	$(document).ready(function(){
		getHotList();
	});
	
	//게시글 목록 불러오기
	function getHotList(){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
			let list = JSON.parse(data);
			const main = document.querySelector("#hotBoard_main");
			main.replaceChildren();
			$("#write_line_off").css("display", "flex");
			for(let i = 0; i < list.length; i++){
				main.innerHTML +=
						"<div class='post'>"
							+ "<div id='bno'>" + list[i].bno + "</div>"
							+ "<div class='post_title'>" + list[i].title + "</div>"
							+ "<div class='post_content'>" + list[i].content + "</div>"
							+ "<div class='post_bottom'>"
								+ "<div class='date_writer'>"
									+ "<div id='date'>" + list[i].regdate + "</div>"
									+ "<div id='writer'>" + list[i].id + "</div>"
								+ "</div>"
								+ "<div class='view_comment'>"
									+ "<div id='view' title='조회수'>조회수 : " + list[i].view + "</div>"
									+ "<div id='comment' title='댓글수'>댓글 : " + list[i].replyList.length + "</div>"
								+ "</div>"
							+ "</div>"
						+ "</div>";
			}
		}
		let univ = $("#user_univ").val();
		xhttp.open("GET", "getHotList.do?univ=" + univ, true);
		xhttp.send();
	}
	
	// 인기글 상세보기
	// 동적태그에 이벤트를 지정해주려면 $(document).on("click", "", "")해야한다.
	$(document).on("click", ".post", function(e){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			const main = document.querySelector("#hotBoard_main");
			let data = this.responseText;
			let obj = JSON.parse(data);
			
			main.innerHTML = "<div id='info_box'>"
								+ "<div id='info_bno' style='display: none;'>" + obj.bno + "</div>"
								+ "<div id='info_header'>"
									+ "<img src='images/profile_img.png'>"
									+ "<div id='info_id_regdate'>"
										+ "<div id='info_id'>" + obj.id + "</div>"
										+ "<div id='info_regdate'>" + obj.regdate + "</div>"
									+ "</div>"
									+ "<ul class='updt_del'>"
										+ "<li class='update'>수정</li>"
										+ "<li class='del'>삭제</li>"
									+ "</ul>"
								+ "</div>"
								+ "<h2 id='info_title'>" + obj.title + "</h2>"
								+ "<p id='info_content'>" + obj.content + "</p>"
								+ "<ul class='comment_thumb'>"
									+ "<li>🔎" + obj.view + "</li>"
									+ "<li>💬" + obj.replyList.length + "</li>"
								+ "</ul>"
							+ "</div>" // info_box
							+ "<div id='reply_wrap'>"
								/* 댓글 데이터 */
							+"</div>"
							+ "<div id='reg_reply_wrap'>"
								+ "<input type='text' id='replyContent' name='reply' maxlength='100' placeholder='댓글을 입력하세요.' autocomplete='off'>"
								+ "<img id='write_reply_pen' src='images/write.png' onclick='regReply()'>"
							+ "</div>";
			//로그인 접속자가 게시글 작성자와 같다면 수정 삭제버튼 on
			if(obj.id == $("#user_id").val()){
				$(".del").css("display", "block");
				$(".update").css("display", "block");
			}else if($("#user_grade").val() == "manager"){
				// 등급이 매니저이면 삭제버튼만 on
				$(".del").css("display", "block");
			}
	
			// 댓글 로드
			const xhttp2 = new XMLHttpRequest();
			xhttp2.onload = function(){
				let arr = this.responseText;
				let reply = JSON.parse(arr);
				
				let reply_wrap = document.querySelector("#reply_wrap");
				for(let i = 0; i < reply.length; i++){
					reply_wrap.innerHTML += 
						"<div id='reply_box'>"
							+ "<div id='reply_header'>"
								+ "<img src='images/profile_img.png'>"
								+ "<div id='reply_id'>" + reply[i].id + "</div>"
							+ "</div>"
							+ "<div id='reply_content'>" + reply[i].content + "</div>"
							+ "<div id='reply_regdate'>" + reply[i].regdate + "</div>"
						+ "</div>";
				}
			}
			let bno = obj.bno;
			xhttp2.open("POST", "getReply.do", true);
			xhttp2.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhttp2.send("bno=" + bno);
		}
		let bno = e.currentTarget.children[0].innerText;
		xhttp.open("POST", "getInfo.do", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("bno=" + bno);
	});
	
	// 댓글 등록
	function regReply(){
		let bno = $("#info_bno").text();
		if($("#replyContent").val() == ""){
    		alert("댓글 내용을 입력후 등록해주세요.");
    		$("#replyContent").focus();
    		return;
    	}else if($("#user_id").val() == ""){
    		alert("로그인 후 이용가능합니다.");
    		return;
    	}
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
    		let result = parseInt(data, 10);
    		if(result == 1){
    			alert("댓글 등록 성공!");
    			$("#replyContent").val("");	// 댓글 등록후 입력창 초기화
    			getRpl(bno);	// 게시글 번호 취득
    		}
		}
		let replyContent = $("#replyContent").val();
		let id = $("#user_id").val();
		let univ = $("#user_univ").val();
		
		xhttp.open("POST", "regReply.do", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("replyContent=" + replyContent + "&univ=" + univ + "&id=" + id + "&bno=" + bno);
	}
	
	/* 댓글 등록후 목록 갱신 */
    function getRpl(bno){
    	const xhttp = new XMLHttpRequest();
    	xhttp.onload = function(){
    		let arr = this.responseText;
			let reply = JSON.parse(arr);
			
			let reply_wrap = document.querySelector("#reply_wrap");
			reply_wrap.replaceChildren();
			for(let i = 0; i < reply.length; i++){
				reply_wrap.innerHTML +=
					"<div id='reply_box'>"
						+ "<div id='reply_header'>"
							+ "<img src='images/profile_img.png'>"
							+ "<div id='reply_id'>" + reply[i].id + "</div>"
						+ "</div>"
						+ "<div id='reply_content'>" + reply[i].content + "</div>"
						+ "<div id='reply_regdate'>" + reply[i].regdate + "</div>"
					+ "</div>";
			}
    	}
    	xhttp.open("POST", "getReply.do", true);
    	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("bno=" + bno);
    }
</script>
</body>
</html>