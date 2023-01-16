<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

/* 자유 게시판 */

/* 상단 대제목 */
#title_freeBoard{
	margin-top: 20px;
	padding: 10px 0 10px 50px;
	border: solid 1px black;
	border-radius: 10px;
}
.freeBoard_box{
	height: 800px;
	/* border: solid 1px red; */
}

/* 상단 검색바 */
#searchBox{
	margin-top: 10px;
	width: 270px;
	display: block;
}
#sel{
	outline:none;
}
#keyword{
	outline:none;
}

/* 게시글 목록 박스 */
#freeList_box{
	margin: 30px 0 0 0;
	height: 650spx;
}

/* 게시글 한 박스 */
#free_info_box{
	height: 130px;
	border: solid 1px gainsboro;
}

/* 게시글 제목 */
#free_info_box h4{
	width: 300px;
	padding: 10px 0 10px 0;
	margin-left: 50px;
	border-bottom: 1px solid gainsboro;
	cursor: pointer;
}

/* 게시글 한박스 제목 */
#free_info_box h4{
	display: inline-block;
}
#freeTitle{
	background-color: gainsboro;
}

/* 게시글 내용 */
#free_info_box > #freeContent{
	height: 30px;
	line-height: 30px;
	padding-left: 50px;
	border-top: 1px solid gray;
}
#gray_line{
	display: flex;
	padding-left: 50px;
}
#bottom_regdate_view_replyCount_box{
	width: 1150px;
	padding-left: 50px;
	display: inline-block;
	color: gray;
}

/* 조회수 */
#viewCount{
	float: right;
	margin-right: 10px;
}

/* 댓글개수 */
#replyCount{
	width: 50px;
	float:right;
}


/* 작성자 아이디 */
#free_info_box > #id{
	padding-left: 50px;
	color: gray;
}
#univ{
	color: gray;
}
/* 아이디 옆 로고 */
#univ_logo{
	width: 17px;
	height: 17px;
	border: 1px solid gainsboro;
	margin-left: 1px;
	border-radius: 10px;
}
#id{
	color: #7a7a7a;
	/* width: 20px;
	height: 20px; */
}


/* 작성일 */
#regdate{
	padding-left: 50px;
	color: #7a7a7a;
	float:left;
}

/* 글쓰기 버튼 */
#write_free_btn{
	padding: 5px;
	float: right;
	border-radius: 10px;
	cursor: pointer;
}

/* 게시물 등록 팝업창 */
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
	background-color: #c2c2c2;
	box-shadow: 10px 10px 10px black;
}

.textLengthWrap{
	margin-left: 350px;
	display: flex;
}

/* 정보박스 한칸 제목 */
.inner > h2{
	margin: 5px 0 5px 0;
}

/* 팝업 제목 */
#free_title{
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

/* 팝업 내용 */
#free_content{
	width: 400px;
	height: 300px;
	border-radius: 10px;
	padding: 20px;
	margin-bottom: 10px;
	border: solid 2px black;
	outline: none;
}

/* 게시물 등록 버튼 */
#reg_do_btn{
	width: 100px;
	height: 30px;
	cursor: pointer;
	border-radius: 10px;
	background: gainsboro;
	
}
#reg_do_btn:hover{
	background-color:#4d4d4d;
	color: white;
}

/* 닫기버튼 */
#close_btn{
	width: 20px;
	height: 20px;
	border: solid 1px black;
	border-radius: 10px;
	background-color: #f56642;
	cursor: pointer;
}

/* 상세보기 제목 내용 정보 박스 */
.info_box{
	margin: 0 auto;
	width: 1300px;
	height: 250px;
	border: solid 1px gainsboro;
	border-radius: 10px 10px 0 0;
	padding: 10px;
}

/* 상세보기 상단 대제목 */
#tit{
	display: inline-block;
	cursor: pointer;
}

/* 다음이전버튼  */
#before_btn, #after_btn{
	margin-top: 10px;
	width: 50px;
	height: 30px;
	color: #f56042;
	background: none;
	border: 2px solid #f56042;
	border-radius: 5px;
	cursor: pointer;	
	display: none;
}
#after_btn{
	float: right;
}

/* x버튼 감싸는태그 */
#close_button{
	width: 1280px;
	height: 20px;
	/* border: 1px solid red; */
}



/* 상세보기 x버튼 */
#info_close_btn{
	text-algin: center;
	width: 20px;
	height: 20px;
	background-color: #f56642;
	border-radius: 10px;
	border: 1px solid black;
	cursor: pointer;
	float: right;
}

/* 상세보기 프로필 */
#info_photo > img{
	margin: 10px;
	width: 60px;
	height: 60px;
	border-radius: 10px;
	border: solid 1px gainsboro;
}
#info_photo{
	float: left;
}

/* 상세보기 작성자 */
#info_id{
	margin-top: 10px;
	font-weight: bold;
	/* border: solid 1px orange; */
}
/* 상세보기 등록일 */
#info_regdate{
	/* border: solid 1px gray; */
	color: #a1a1a1;
}
/* 상세보기 제목 */
#info_title{
	/* margin-left: 10px; */
	padding-top: 20px;
	padding-bottom: 20px;
	font-weight: bold;
	font-size: 20px;
	margin-left: 10px;
	/* border: solid 1px green; */
}
/* 상세보기 내용 */
#info_content{
	height: 50px;
	margin-left: 10px;
	/* border: solid 1px blue; */
}
#infoView_replyCount{
	display: flex;
	padding-left: 1000px;	
}

#infoView_replyCount > #info_view{
	margin-left: 90px;
	margin-right: 10px;
}

/* 상세보기 조회수 */
#info_view{
	text-align: right;
	/* border: solid 1px green; */
}

/* 게시글 수정, 삭제 */
#updateOrDelete{
	display: flex;
	float: left;
	margin-left: 10px;
}
#updt_btn{
	cursor: pointer;
	margin-right: 10px;
	color: gray;
}
#del_btn{
	cursor: pointer;
	color: gray;
}

/* 댓글 전체 박스 */
.reply_box{
	width: 1300px;
	height: 300px;
	border: solid 1px gainsboro;
}

#reply_innerBox{
	padding: 20px;
	width: 1300px;
	height: 100px;
	background-color: #f0f0f0;
	border-bottom: solid 1px gray;
	
}


/* 상세보기 댓글 로고, 이름 박스*/
#reply_top{
	display:flex;
	/* border: 1px solid red; */
}

/* 상세보기 댓글 로고 */
#reply_logo{
	border: 1px solid gainsboro;
	border-radius: 5px;
	margin-right: 5px;
	width: 25px;
	height: 25px;
}

/* 상세보기 댓글 아이디 */
#reply_id{
	font-weight: bold;
	line-height: 25px;
}
#reply_regdate{
	color: #a1a1a1;
}

#reply_content{
	margin-top: 5px;	
}

#reply{
	width: 1260px;
	height: 40px;
	padding-left: 20px;
	border-radius: 0 0 0 10px;
	border: 1px solid gainsboro;
	background: #ebebeb;
	float:left;
	outline: none;
}
#pen{
	cursor: pointer;
	border-radius: 0 0 10px 0;
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
#free_update_title{
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
#free_update_content{
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
#free_update_btn{
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