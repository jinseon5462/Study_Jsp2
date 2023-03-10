<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
* {
    margin: 0;
    padding: 0;
    list-style-type: none;
    box-sizing: border-box;
    text-decoration: none;
    font-family: "돋움";
}
.container{
	height: 100%;
}
.footer{
	height: 230px;
	position: relative;
	transform: translateY(-100%);	
}
.box{
    margin: 0 auto;
    width: 1300px;
    /* border: 1px solid black; */
}

/* 공지 게시판 */
/* 상단 대제목 */
#title_noticeBoard{
	margin-top: 50px;
	padding: 10px 0 10px 50px;
	border: solid 1px black;
	border-radius: 10px;
}
/*  */
.noticeBoard_box{
	height: 700px;
}
/* 공지 목록 박스 */
#noticeList_box{
	margin: 30px 0 30px 0;
	height: 600px;
	border: solid 1px gainsboro;
}
/* 공지 한 박스 */
#notice_info_box{
	height: 120px;
	border: solid 1px gainsboro;
}
/* 공지 제목 */
#notice_info_box h4{
	padding: 10px 0 10px 50px;
	border-bottom: 1px solid gainsboro;
	background-color: gainsboro;
}

/* 공지 내용 */
#notice_info_box > #noticeContent{
	height: 30px;
	line-height: 40px;
	padding-left: 50px;
	border-top: 1px solid gray;
}

/* 공지 작성자 */
#notice_info_box > #grade{
	padding-left: 50px;
	color: gray;
}

/* 작성일 */
#regdate{
	padding-left: 50px;
	color: #7a7a7a;
	float:left;
}
/* 공지 수정 버튼 */
#update_notice_btn{
	margin-left: 1050px;
	margin-right: 10px;
	float: left;
	cursor: pointer;
	display: block;
}

/* 공지 삭제버튼 */
#delete_notice_btn{
	display: block;
	cursor: pointer;
	
}
/* 공지 쓰기 버튼 */
.reg_do_btn{
	/* border: 1px solid black; */
	padding: 0 0 30px 200px;
}
.write{
	padding: 5px;
	float: right;
	border-radius: 10px;
	cursor: pointer;
}
/*  */
#reg_do_btn{
	margin: 5px 0 5px 0;
	float: right;
	cursor: pointer;
}

/* 팝업창 */
.inner{
	display: none;
	position: fixed;
	top: 30%;
	left: 40%;
	text-align: center;
	height: 550px;
	width: 500px;
	border: solid 2px black;
	border-radius: 10px;
	margin:0 auto;
	background-color: #c9c9c9;
	box-shadow: 10px 10px 10px black;
}

/* 박스 한칸 제목 */
.inner > h2{
	margin: 5px 0 5px 0;
}

/* 공지 제목 */
#notice_title{
	width: 400px;
	height: 30px;
	resize: none;
	border-radius: 10px;
	padding-left: 20px;
	padding-right: 20px;
	line-height: 30px;
	margin-top: 30px;
	margin-bottom: 10px;
	outline: none;
}

/* 공지 내용 */
#notice_content{
	width: 400px;
	height: 300px;
	border-radius: 10px;
	padding: 20px;
	margin-bottom: 10px;
	border: solid 2px black;
	resize: none;
	outline: none;
}

/* 공지 등록 버튼 */
#write_notice_btn{
	width: 100px;
	height: 30px;
	cursor: pointer;
	border-radius: 10px;
	background: gainsboro;
	
}
#write_notice_btn:hover{
	background-color:#4d4d4d;
	color: white;
}

/* 닫기버튼 */
#close_btn{
	width: 20px;
	height: 20px;
	border: solid 1px black;
	border-radius: 10px;
	background-color: red;
	cursor: pointer;
}

/*  공지수정 팝업창 */
.update_inner{
	display: none;
	position: fixed;
	top: 30%;
	left: 40%;
	text-align: center;
	height: 550px;
	width: 500px;
	border: solid 2px black;
	border-radius: 10px;
	margin:0 auto;
	background-color: #c9c9c9;
	box-shadow: 10px 10px 10px black;
}

/* 박스 한칸 제목 */
.update_inner > h2{
	margin: 5px 0 5px 0;
}

/* 공지 입력 글자수 */
.textLengthWrap{
	margin-left: 350px;
	display: flex;
}
/* 공지 수정 제목 */
#notice_update_title{
	width: 400px;
	height: 30px;
	resize: none;
	outline: none;
	border-radius: 10px;
	padding-left: 20px;
	padding-right: 20px;
	line-height: 30px;
	margin-top: 30px;
	margin-bottom: 10px;
}

/* 공지 수정 내용 */
#notice_update_content{
	width: 400px;
	height: 300px;
	border-radius: 10px;
	padding: 20px;
	margin-bottom: 10px;
	border: solid 2px black;
	resize: none;
	outline: none;
}

/* 공지 수정 등록 버튼 */
#notice_update_btn{
	width: 100px;
	height: 30px;
	cursor: pointer;
	border-radius: 10px;
	background: gainsboro;
	
}
#notice_update_btn:hover{
	background-color:#4d4d4d;
	color: white;
}

/* 닫기버튼 */
#update_close_btn{
	width: 20px;
	height: 20px;
	border: solid 1px black;
	border-radius: 10px;
	background-color: red;
	cursor: pointer;
}
</style>