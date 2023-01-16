<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="css/headerStyle.jsp" %>
<%@ include file="css/footerStyle.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근 강의평</title>
<style>
	.class_box{
		margin-top: 20px;
		width: 800px;
		height: 900px;
		border: solid 1px red;
	}
	/* 강의평 등록 박스 */
	#write_box{
		top: 300;
		left: 750;
		position: fixed;
		display: none;
	}
	#write_evaluation_box{
		margin-top: 30px;
		width: 400px;
		margin: 0 auto;
		border: solid 1px gray;
		border-radius: 10px;
		height: 360px;
	}
	#top_bar{
		margin: 10px;
		display: flex;
		border-bottom: solid 1px gainsboro;
	}
	#x_btn{
		width: 20px;
		height: 20px;
		margin-left: 270px;
		cursor: pointer;
		color: gray;
		text-align: center;
	}
	#write_evaluation_box  h4{
		color: gray;
	}
	#info_box{
		margin: 10px;
		height: 250px;
	}
	#nameBox{
		margin-top: 10px;
		margin-bottom: 5px;
		display: flex;
	}
	
	#nameBox > div:nth-child(2){
		margin-left: 140px;
	}
	#className{
		width: 185px;
		height: 25px;
		outline: none;
		padding-left: 5px;
	}
	#professorName{
		width: 185px;
		height: 25px;
		outline: none;
		padding-left: 5px;
	}
	#title_box{
		display: flex;
		margin-top: 5px;
		margin-bottom: 5px;
	}
	#title_box div:nth-child(1){
		margin-right: 35px;
	}
	#title_box div:nth-child(2){
		margin-right: 35px;
	}
	#title_box div:nth-child(3){
		margin-right: 35px;
	}
	select{
		width: 90px;
		cursor: pointer;
		outline: none;
	}
	
	#write_title_box{
		margin-top: 5px;
	}
	#evaluation_title{
		width: 373px;
		height: 30px;
		outline: none;
		padding-left: 5px;
	}
	#evaluation_box{
		margin-top: 5px;
	}
	#evaluation_content{
		resize: none;
		width: 373px;
		height: 100px;
		outline: none;
		padding: 5px 0 0 5px;
	}
	#bottom_bar > input[type="button"]{
		/* float: right; */
		margin-top: 5px;
		margin-right: 5px;
		cursor: pointer;
		width: 50px;
		height: 25px;
	}
	#bottom_bar > input[type="button"]:nth-child(1){
		float: right;
	}
	#bottom_bar > input[type="button"]:nth-child(2){
		float: right;
	}
	
	#do_evaluation{
		height: 30px;
		cursor: pointer;
		color: gray;
		background: none;
		border: 2px solid gray;
		border-radius: 5px;
	}
</style>
</head>
<body>
	<div class="container">
		<%@ include file="header.jsp" %>
		<div class="box class_box">
			<div id="write_box">
				<div id="write_evaluation_box">
					<div id="top_bar">
						<h4>평가 등록하기</h4>
						<div id="x_btn">X</div>
					</div>
					<div id="info_box">
						<div id="nameBox">
							<div>강의명</div><div>교수명</div>
						</div>
						<input type="text" id="className" name="className" placeholder="강의명">
						<input type="text" id="professorName" name="professorName" placeholder="교수명">
						<div id="title_box">
							<div id="yearTitle">수강 연도</div><div id="monthTitle">수강 학기</div><div id="subjectTitle">강의 구분</div><div id="sub_score">평점</div>
						</div>
						<div id="select_box">
							<select id="sel_year">
								<option value="2022">2022</option>
								<option value="2021">2021</option>
								<option value="2020">2020</option>
								<option value="2019">2019</option>
							</select>
							<select id="sel_month">
								<option>1학기</option>
								<option>2학기</option>
							</select>
							<select id="sel_subject">
								<option>전공</option>
								<option>교양</option>
							</select>
							<select id="sel_score">
								<option value="5">5</option>
								<option value="4">4</option>
								<option value="3">3</option>
								<option value="2">2</option>
								<option value="1">1</option>
							</select>
						</div><!-- select_box -->
						<div id="write_title_box">
							<div>제목</div>
							<input type="text" id="evaluation_title" placeholder="제목">
						</div>
						<div id="evaluation_box">
							<div>내용</div>
							<textarea id="evaluation_content" placeholder="70자 이하로 입력"></textarea>
						</div>
						<div id="bottom_bar">
							<input id="reg_btn" type="button" value="등록">
							<input id="cancle_btn" type="button" value="취소">
						</div>
					</div><!-- info_box -->
				</div><!-- write_evaluation_box -->
			</div>
			<div id="title_class">
				<h2 id="tit">최근 강의평</h2>
				<hr>
			</div>
			<input type="button" id="do_evaluation" value="강의평 등록하기">
			
		</div><!-- class_box -->
		<%@ include file="footer.jsp" %>
	</div>
<script>
	/* 강의평 등록 닫기 */
	$("#x_btn").on("click", function(){
		$("#write_box").css("display", "none");
	});
	
	/* 강의평 등록 열기 */
	$("#do_evaluation").on("click", function(){
		let id = $("#user_id").val();
		if(id == ""){
			alert("로그인 후 이용가능합니다.");
			let url = "login.jsp";
			window.open(url,"_blank",
				"width=301, height=301"		
			);
			return;
		}
		$("#write_box").css("display", "block");
	});
	
	/* 강의 등록 실행 */
	$("#reg_btn").on("click", function(){
		let subjectName = $("#className").val();
		let professorName = $("#professorName").val();
		let year = $("#sel_year").val();
		let semester = $("#sel_month").val();
		let subjectType = $("#sel_subject").val();
		let score = $("#sel_score").val();
		let evalTitle = $("#evaluation_title").val();
		let evalContent = $("#evaluation_content").val();
		let id = $("#user_id").val();
		let univ = $("#user_univ").val();
		
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			
		}
		xhttp.open("POST", "regEvaluation.do", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("subjectName=" + subjectName + "&professorName=" + professorName 
				+ "&year=" + year + "&semester=" + semester + "&subjectType=" + subjectType
				+ "&score=" + score + "&evalTitle=" + evalTitle + "&evalContent=" + evalContent
				+ "&id=" + id + "&univ=" + univ);
	});
</script>
</body>
</html>