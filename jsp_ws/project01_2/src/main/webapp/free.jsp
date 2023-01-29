<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<link rel="stylesheet" href="css/free.css?v1.62">
<script src="jquery/jquery-3.3.1.min.js"></script>
</head>
<body id="free">
<%@ include file="header.jsp" %>
	<div class="free_container">
		<div id="freeboard_wrap">
			<div id="freeboard_title">
				<h2><a href="free.jsp">${sessionScope.user.univ } 자유게시판</a></h2>
			</div>
			<div id="write_line_off">
				<div id="writeArticleButton">새 글을 작성해주세요!</div>
				<div id="write_pen"><img src="images/pen1.png"></div>
			</div>
			<div id="write_line_on">
				<p id="write_input_wrap"><input type="text" id="write_post_title" name="write_post_title" maxlength="50" placeholder="글 제목"><img src="images/write.png"></p>
				<p><textarea id="write_post_content" maxlength="100" placeholder="에브리데이는 누구나 기분 좋게 참여할 수 있는 커뮤니티를 만들기 위해 커뮤니티 이용규칙을 제정하여 운영하고 있습니다.&#10;위반 시 게시물이 삭제되고 서비스 이용이 일정 기간 제한될 수 있습니다.&#10;아래는 이 게시판에 해당하는 핵심 내용에 대한 요약 사항이며, 게시물 작성 전 커뮤니티 이용규칙 전문을 반드시 확인하시기 바랍니다.&#10;&#10;※ 정치·사회 관련 행위 금지&#10;- 국가기관, 정치 관련 단체, 언론, 시민단체에 대한 언급 혹은 이와 관련한 행위&#10;- 정책·외교 또는 정치·정파에 대한 의견, 주장 및 이념, 가치관을 드러내는 행위&#10;- 성별, 종교, 인종, 출신, 지역, 직업, 이념 등 사회적 이슈에 대한 언급 혹은 이와 관련한 행위&#10;- 위와 같은 내용으로 유추될 수 있는 비유, 은어 사용 행위&#10;* 해당 게시물은 시사·이슈 게시판에만 작성 가능합니다.&#10;&#10;※ 홍보 및 판매 관련 행위 금지&#10;- 영리 여부와 관계 없이 사업체·기관·단체·개인에게 직간접적으로 영향을 줄 수 있는 게시물 작성 행위&#10;- 위와 관련된 것으로 의심되거나 예상될 수 있는 바이럴 홍보 및 명칭·단어 언급 행위&#10;* 해당 게시물은 홍보게시판에만 작성 가능합니다.&#10;&#10;※ 불법촬영물 유통 금지&#10;불법촬영물등을 게재할 경우 전기통신사업법에 따라 삭제 조치 및 서비스 이용이 영구적으로 제한될 수 있으며 관련 법률에 따라 처벌받을 수 있습니다.&#10;&#10;※ 그 밖의 규칙 위반&#10;- 타인의 권리를 침해하거나 불쾌감을 주는 행위&#10;- 범죄, 불법 행위 등 법령을 위반하는 행위&#10;- 욕설, 비하, 차별, 혐오, 자살, 폭력 관련 내용을 포함한 게시물 작성 행위&#10;- 음란물, 성적 수치심을 유발하는 행위&#10;- 스포일러, 공포, 속임, 놀라게 하는 행위"></textarea></p>
			</div>
			<div id="freeboard_main">
				<!-- 데이터 -->
			</div>
		</div>
		<div id="sideboard_wrap">
			sideboard
		</div>
	</div>
<%@ include file="footer.jsp" %>
<script>
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
	
	// 게시글 수정 열기
	$(document).on("click", ".update", function(){
		let title = $("#info_title").text();
		let content = $("#info_content").text();
		let bno = $("#info_bno").text();
		let main = document.querySelector("#freeboard_main");
		main.innerHTML = 
			"<div id='update_post_box'>"
				+ "<p id='update_input_wrap'><input type='text' id='update_post_title' name='update_post_title' maxlength='50' placeholder='글 제목'><img src='images/write.png' id='update_btn'></p>"
				+ "<div id='info_bno' style='display: none;'>" + bno + "</div>"
				+ "<p><textarea id='update_post_content' maxlength='100' placeholder='에브리데이는 누구나 기분 좋게 참여할 수 있는 커뮤니티를 만들기 위해 커뮤니티 이용규칙을 제정하여 운영하고 있습니다.&#10;위반 시 게시물이 삭제되고 서비스 이용이 일정 기간 제한될 수 있습니다.&#10;아래는 이 게시판에 해당하는 핵심 내용에 대한 요약 사항이며, 게시물 작성 전 커뮤니티 이용규칙 전문을 반드시 확인하시기 바랍니다.&#10;&#10;※ 정치·사회 관련 행위 금지&#10;- 국가기관, 정치 관련 단체, 언론, 시민단체에 대한 언급 혹은 이와 관련한 행위&#10;- 정책·외교 또는 정치·정파에 대한 의견, 주장 및 이념, 가치관을 드러내는 행위&#10;- 성별, 종교, 인종, 출신, 지역, 직업, 이념 등 사회적 이슈에 대한 언급 혹은 이와 관련한 행위&#10;- 위와 같은 내용으로 유추될 수 있는 비유, 은어 사용 행위&#10;* 해당 게시물은 시사·이슈 게시판에만 작성 가능합니다.&#10;&#10;※ 홍보 및 판매 관련 행위 금지&#10;- 영리 여부와 관계 없이 사업체·기관·단체·개인에게 직간접적으로 영향을 줄 수 있는 게시물 작성 행위&#10;- 위와 관련된 것으로 의심되거나 예상될 수 있는 바이럴 홍보 및 명칭·단어 언급 행위&#10;* 해당 게시물은 홍보게시판에만 작성 가능합니다.&#10;&#10;※ 불법촬영물 유통 금지&#10;불법촬영물등을 게재할 경우 전기통신사업법에 따라 삭제 조치 및 서비스 이용이 영구적으로 제한될 수 있으며 관련 법률에 따라 처벌받을 수 있습니다.&#10;&#10;※ 그 밖의 규칙 위반&#10;- 타인의 권리를 침해하거나 불쾌감을 주는 행위&#10;- 범죄, 불법 행위 등 법령을 위반하는 행위&#10;- 욕설, 비하, 차별, 혐오, 자살, 폭력 관련 내용을 포함한 게시물 작성 행위&#10;- 음란물, 성적 수치심을 유발하는 행위&#10;- 스포일러, 공포, 속임, 놀라게 하는 행위'></textarea></p>"
			+ "</div>";
		$("#update_post_title").val(title);
		$("#update_post_content").val(content);
	});
	
	// 게시글 수정 실행
	$(document).on("click", "#update_btn", function(){
		if($("#update_post_title").val() == ""){
			alert("제목을 입력해주세요.");
			return;
		}else if($("#update_post_content").val() == ""){
			alert("내용을 입력해주세요.");
			return;
		}else{
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function(){
				const main = document.querySelector("#freeboard_main");
				let data = this.responseText;
				let obj = JSON.parse(data);
				if(obj != null){
					alert("수정성공");
					$("#update_post_title").val("");
					$("#update_post_content").val("");
					main.innerHTML = 
						"<div id='info_box'>"
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
			}
			let title = $("#update_post_title").val();
			let content = $("#update_post_content").val();
			let bno = $("#info_bno").text();
			
			xhttp.open("POST", "updatePost.do", true);
			xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhttp.send("title=" + title + "&content=" + content + "&bno=" + bno);
		}
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
			$("#write_post_title").focus();
			return;
		}else if($("#write_post_content").val() == ""){
			alert("내용을 입력해주세요.");
			$("#write_post_content").focus();
			return;
		}else{
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
		}
	});
	
</script>
</body>
</html>