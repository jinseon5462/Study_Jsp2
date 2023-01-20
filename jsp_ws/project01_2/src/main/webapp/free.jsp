<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<style>
	.free_box{
		margin: 0 auto;
		width: 1300px;
		height: 1000px;
		border: solid 1px blue;
	}
	
	#title_wrap{
		margin-top: 20px;
		margin: 0 auto;
		width: 800px;
		border: solid 1px red;
		display: flex;
	}
	#top_write_wrap{
		width: 800px;
		height: 40px;
		margin: 0 auto;
		border: solid 1px #80ff00;
	}
	#top_write_wrap > input{
		outline: none;
	}
	#title_wrap > h2{
		border: solid 1px green;
	}
	#pen_img{
		width: 30px;
		height: 30px;
		background-image: url(images/pen1.png);
		background-repeat: none;
		background-size: 100%;
		cursor: pointer;
		border: solid 1px black;
		
	}
	.btn_wrap{
		margin: 0 auto;
		width: 1300px;
		border: solid 1px orange;
	}
	#before{
		width: 50px;
		height: 30px;
		color: rgb(203, 56, 56);
		background: none;
		border: 2px solid rgb(203, 56, 56);
		border-radius: 5px;
		cursor: pointer;
		
	}
	#after_btn{
		float: right;
	}
	#after{
		width: 50px;
		height: 30px;
		color: rgb(203, 56, 56);
		background: none;
		border: 2px solid rgb(203, 56, 56);
		border-radius: 5px;
		cursor: pointer;
	}
	
</style>
</head>
<body>
<%@ include file="header.jsp" %>
	<div class="free_box">
		<div id="title_wrap">
			<h2>자유게시판</h2>
		</div>
		<div id="top_write_wrap">
			<input type="text" id="write_box" placeholder="새 글을 작성해주세요!" readonly>
		</div>
	</div>
	<div class="btn_wrap">
		<span id="before_btn">
			<input type="button" id="before" value="이전">
		</span>
		<span id="after_btn">
			<input type="button" id="after" value="다음">
		</span>
	</div>
<%@ include file="footer.jsp" %>
</body>
</html>