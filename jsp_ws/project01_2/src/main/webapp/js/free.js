/**
 * 
 */
 
 getList();
	// 게시글 목록 불러오기
	function getList(){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
			let list = JSON.parse(data);
			const main = document.querySelector("#freeboard_main");
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
									+ "<div id='view' title='조회수'>🔎" + list[i].view + "</div>"
									+ "<div id='comment' title='댓글수'>💬" + list[i].replyList.length + "</div>"
								+ "</div>"
							+ "</div>"
						+ "</div>";
			}
		}
		let univ = $("#user_univ").val();
		xhttp.open("GET", "getFreeList.do?univ=" + univ, true);
		xhttp.send();
	}
	
	// 게시글 상세보기
	// 동적태그에 이벤트를 지정해주려면 $(document).on("click", "", "")해야한다.
	$(document).on("click", ".post", function(e){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			const main = document.querySelector("#freeboard_main");
			let data = this.responseText;
			let obj = JSON.parse(data);
			$("#write_line_off").css("display", "none");	// 글쓰기 버튼 숨김
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
								+ "<h2>" + obj.title + "</h2>"
								+ "<p>" + obj.content + "</p>"
								+ "<ul class='comment_thumb'>"
									+ "<li>🔎" + obj.view + "</li>"
									+ "<li>💬" + obj.replyList.length + "</li>"
								+ "</ul>"
							+ "</div>" // info_box
							+ "<div id='reply_wrap'>"
								/* 댓글 데이터 */
							+"</div>"
							+ "<div id='reg_reply_wrap'>"
								+ "<input type='text' id='replyContent' name='reply' placeholder='댓글을 입력하세요.' autocomplete='off'>"
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
	
	// 게시글 삭제
	$(document).on("click", ".del", function(){
		if($("#user_id").val() == $("#info_id").text()){
			if(confirm("이 글을 삭제하시겠습니까?") == true){
				const xhttp = new XMLHttpRequest();
				xhttp.onload = function(){
					let data = this.responseText;
	   				let result = parseInt(data, 10);
	   				if(result == 1){
	   					alert("성공적으로 삭제되었습니다.");
	   					getList();
	   				}else{
	   					alert("삭제 실패");
	   				}
				}
				let bno = $("#info_bno").text();
				xhttp.open("POST", "deletePost.do", true);
				xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				xhttp.send("bno=" + bno);
			}else{
				return;
			}
		}else if($("#user_grade").val() == "manager"){
			if(confirm("관리자 권한으로 삭제하시겠습니까?") == true){
				const xhttp = new XMLHttpRequest();
				xhttp.onload = function(){
					let data = this.responseText;
	   				let result = parseInt(data, 10);
	   				if(result == 1){
	   					alert("성공적으로 삭제되었습니다.");
	   					getList();
	   				}else{
	   					alert("삭제 실패");
	   				}
				}
				let bno = $("#info_bno").text();
				xhttp.open("POST", "deletePost.do", true);
				xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				xhttp.send("bno=" + bno);
			}else{
				return;
			}
		}
	});
	
	// 게시글 수정
	$(document).on("click", ".update", function(){
		
	});
	
	// 댓글 등록
	function regReply(){
		let bno = $("#info_bno").text();
		if($("#replyContent").val() == ""){
    		alert("댓글 내용을 입력후 등록해주세요.");
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
    	alert(bno);
    	xhttp.open("POST", "getReply.do", true);
    	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("bno=" + bno);
    }
	
	
	// 게시글 등록 열기
	$("#write_line_off").on("click", function(e){
		if($("#user_id").val() == ""){
			alert("로그인 후 이용가능합니다.");
			if(confirm("로그인 하시겠습니까?") == true){
				location.href = "login.jsp";
			}
			return;
		}
		$("#write_line_on").css("display", "block");
		$("#write_line_off").css("display", "none");
		$(".free_container").css("height", "1250px");
	});
	
	// 게시글 등록 실행
	$("#write_input_wrap > img").on("click", function(e){
		if($("#write_post_title").val() == ""){
			alert("제목을 입력해주세요.");
			return;
		}else if($("#write_post_content").val() == ""){
			alert("내용을 입력해주세요.");
			return;
		}else if($("#write_post_content").val().length > 70){
			alert("내용은 70자 이하로만 입력가능합니다.");
			return;
		}else if($("#write_post_title").val().length > 30){
			alert("제목은 30자 이하로만 입력가능합니다.");
			return;
		}
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
			let result = parseInt(data, 10);
			if(result == 1){
				alert("게시글 등록 성공");
				$("#write_line_on").css("display", "none");
				$("#write_line_off").css("display", "block");
				$(".free_container").css("height", "950px");
				$("#write_post_title").val("");
				$("#write_post_content").val("");
				getList();
			}else{
				alert("error");
			}
		}
		let title = $("#write_post_title").val();
		let content = $("#write_post_content").val();
		let id = $("#user_id").val();
		let univ = $("#user_univ").val();
		xhttp.open("POST", "regPost.do", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("title=" + title + "&content=" + content + "&id=" + id + "&univ=" + univ);
	});