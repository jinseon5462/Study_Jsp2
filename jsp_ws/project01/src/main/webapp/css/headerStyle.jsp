<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

* {
    margin: 0;
    padding: 0;
    list-style-type: none;
    box-sizing: border-box;
    text-decoration: none;
    color: black;
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

/* 헤더 */
header{
    height: 150px;
    border-bottom: 1px solid gainsboro;
}

/* 앵커태그 커서 */
header a{
	cursor: pointer;
}

header #gnb a{
	color: #999;
}
header #gnb a.on{
	color: #000;
}

#gnb span {
    border-bottom: 5px solid #ff6600;
    width: 150px;
}
/* 로그인 앵커 */
header #a_login{
	margin-right: 30px;
	font-weight: bold;
}

/* 상단 로그인 상태 */
#login_status{
    display: flex;
    justify-content: end;
    font-size: 15px;
    height: 20px;
    padding-top: 20px;
    padding-bottom: 20px;
}

/* 최상단 로고 이미지 */
#logo img{
    width: 110px;
    height: 110px;
    margin-left: 80px;
    margin-right: 50px;
    cursor: pointer;
    float: left;
}

/* 상단 네비게이션바 */
#main_menu a{
    float: left;
    padding: 41px;
    font-weight: bold;
    font-size: 20px;
    transition: 0.1s ease;
}
#main_menu li a:hover{
    border-bottom: 3px solid #ff6600;
}
*/
#main_box{
	height: 900px;
}
#main{
	height: 800px;
	margin-bottom: 20px;
}
</style>