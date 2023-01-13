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

/* 로그인 */
.login_box{
	background-color: white;
	text-align: center;
	padding-top: 50px;
	width: 300px;
	height: 300px;
	border: 3px solid orange;
	border-radius: 10px;
	/* box-shadow: 20px 20px 20px black; */
}
.login_box input{
	margin: 10px;
}
.form input{
	border: 0;
	text-align: center;
	border: 2px solid gray;
	border-radius: 20px;
	transition: 0.3s;
	height: 30px;
}
.form input:focus{
	border-color: rgb(7, 247, 171);
}
.form input:hover{
	border-color: rgb(7, 247, 171);
}
.form input[type="reset"],
.form input[type="button"]{
	cursor: pointer;
	width: 55px;
}
</style>