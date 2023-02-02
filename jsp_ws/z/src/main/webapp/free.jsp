<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<link rel="stylesheet" href="css/free.css?v1.1">
</head>
<body>
<%@ include file="header.jsp" %>
	<div class="free_container">
		<div id="freeboard_wrap">
			<div id="freeboard_title">
				<h2><a href="free.jsp">자유게시판</a></h2>
			</div>
			<div id="write_line_off">
				<div id="writeArticleButton">새 글을 작성해주세요!</div>
				<div id="write_pen"><img src="images/pen1.png"></div>
			</div>
			<div id="write_line_on">
				<p id="write_input_wrap"><input type="text" id="write_post_title" name="write_post_title" placeholder="글 제목"><img src="images/write.png"></p>
				<p><textarea id="write_post_content" placeholder="에브리데이는 누구나 기분 좋게 참여할 수 있는 커뮤니티를 만들기 위해 커뮤니티 이용규칙을 제정하여 운영하고 있습니다.&#10;위반 시 게시물이 삭제되고 서비스 이용이 일정 기간 제한될 수 있습니다.&#10;아래는 이 게시판에 해당하는 핵심 내용에 대한 요약 사항이며, 게시물 작성 전 커뮤니티 이용규칙 전문을 반드시 확인하시기 바랍니다.&#10;&#10;※ 정치·사회 관련 행위 금지&#10;- 국가기관, 정치 관련 단체, 언론, 시민단체에 대한 언급 혹은 이와 관련한 행위&#10;- 정책·외교 또는 정치·정파에 대한 의견, 주장 및 이념, 가치관을 드러내는 행위&#10;- 성별, 종교, 인종, 출신, 지역, 직업, 이념 등 사회적 이슈에 대한 언급 혹은 이와 관련한 행위&#10;- 위와 같은 내용으로 유추될 수 있는 비유, 은어 사용 행위&#10;* 해당 게시물은 시사·이슈 게시판에만 작성 가능합니다.&#10;&#10;※ 홍보 및 판매 관련 행위 금지&#10;- 영리 여부와 관계 없이 사업체·기관·단체·개인에게 직간접적으로 영향을 줄 수 있는 게시물 작성 행위&#10;- 위와 관련된 것으로 의심되거나 예상될 수 있는 바이럴 홍보 및 명칭·단어 언급 행위&#10;* 해당 게시물은 홍보게시판에만 작성 가능합니다.&#10;&#10;※ 불법촬영물 유통 금지&#10;불법촬영물등을 게재할 경우 전기통신사업법에 따라 삭제 조치 및 서비스 이용이 영구적으로 제한될 수 있으며 관련 법률에 따라 처벌받을 수 있습니다.&#10;&#10;※ 그 밖의 규칙 위반&#10;- 타인의 권리를 침해하거나 불쾌감을 주는 행위&#10;- 범죄, 불법 행위 등 법령을 위반하는 행위&#10;- 욕설, 비하, 차별, 혐오, 자살, 폭력 관련 내용을 포함한 게시물 작성 행위&#10;- 음란물, 성적 수치심을 유발하는 행위&#10;- 스포일러, 공포, 속임, 놀라게 하는 행위"></textarea></p>
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
			for(let i = 0; i < list.length; i++){
				main.innerHTML +=
					"<div class='post'>"
						+ "<div id='bno' style='display: none;'>" + list[i].bno + "</div>"
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
		xhttp.open("GET", "getFreeList.do", true);
		xhttp.send();
	}
	
	// 게시글 등록 열기
	$("#write_line_off").on("click", function(e){
		if($("#user_id").val() == ""){
			alert("로그인 후 이용가능합니다.");
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
				$("#write_line_off").css("display", "flex");
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
	
	// 게시글 상세보기
</script>
</body>
</html>