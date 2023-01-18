<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOT 게시판</title>
</head>
<body>
	<div class="container">
        <%@ include file="header.jsp" %>
        <div class="box freeBoard_box">
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
        <input type="hidden" id="user_id" value="${sessionScope.user.id }"><!-- 세션 아이디 -->
        <input type="hidden" id="user_univ" value="${sessionScope.user.univ }"><!-- 세션 대학 -->
        <input type="hidden" id="user_grade" value="${sessionScope.user.grade }"><!-- 세션 등급 -->
       	<%@ include file="footer.jsp" %>
	</div> <!-- container -->
</body>
</html>