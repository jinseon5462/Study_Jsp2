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
	height: 1400px;
	/* border: solid 1px red; */
}

/* 상단 검색바 */
#searchBox{
	margin-top: 10px;
	width: 270px;
	display: block;
}

/* 게시글 목록 박스 */
#freeList_box{
	margin: 30px 0 20px 0;
	height: 1200px;
}

/* 게시글 한 박스 */
#free_info_box{
	height: 120px;
	border: solid 1px gainsboro;
}

/* 게시글 제목 */
#free_info_box h4{
	padding: 10px 0 10px 0;
	margin-left: 50px;
	border-bottom: 1px solid gainsboro;
	cursor: pointer;
}
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

/* 작성자 아이디 */
#free_info_box > #writer{
	padding-left: 50px;
	color: gray;
	display: flex;
}

/* 아이디 옆 로고 */
#univ_logo{
	width: 20px;
	height: 20px;
	border: solid 1px gray;
	border-radius: 10px;
}

#writer div{
	width: 20px;
	height: 20px;
}

/* 작성일 */
#regdate{
	padding-left: 50px;
	color: #7a7a7a;
}

/* 글쓰기 버튼 */
#write_free_btn{
	padding: 5px;
	float: right;
	border-radius: 10px;
	cursor: pointer;
}

/* 팝업창 */
.inner{
	display: none;
	position: fixed;
	top: 30%;
	left: 40%;
	text-align: center;
	height: 500px;
	width: 500px;
	border: solid 2px black;
	border-radius: 10px;
	margin:0 auto;
	background-color: #c2c2c2;
	box-shadow: 10px 10px 10px black;
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
}

/* 팝업 내용 */
#free_content{
	width: 400px;
	height: 300px;
	border-radius: 10px;
	padding: 20px;
	margin-bottom: 10px;
	border: solid 2px black;
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
	background-color: red;
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
	display: inline-block;
	width: 50px;
	height: 30px;
	cursor: pointer;
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
	background-color: red;
	border-radius: 10px;
	border: 1px solid black;
	padding-left: 2.5px;
	cursor: pointer;
	float: right;
}

/* 상세보기 프로필 */
#info_photo > img{
	margin: 10px;
	width: 40px;
	height: 40px;
	border-radius: 10px;
	border: solid 1px gainsboro;
}
#info_photo{
	float: left;
}

/* 상세보기 작성자 */
#info_writer{
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
/* 상세보기 조회수 */
#info_view{
	margin-left: 10px;
	/* border: solid 1px green; */
}


/* 댓글박스 */
.reply_box{
	width: 1300px;
	height: 300px;
	border: solid 1px gainsboro;
	padding: 20px;
}
#reply{
	width: 1260px;
	height: 40px;
	padding-left: 20px;
	border-radius: 0 0 0 10px;
	border: 1px solid gainsboro;
	background: #ebebeb;
	float:left;
}
#pen{
	cursor: pointer;
	border-radius: 0 0 10px 0;
}

</style>