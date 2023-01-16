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

/* 회원가입 */
#signup ul li{
    line-height: 30px;
    padding: 5px 10px;
    margin-bottom: 2px;
}
fieldset{
    padding-top: 70px;
    margin: 0 auto;
    padding-left: 70px;
    margin-top: 100px;
    margin-bottom: 100px;
    width: 400px;
    height: 400px;
    border-radius: 10px;
    box-shadow: 10px 10px 10px gray;
    border: 4px solid orange;
}
fieldset > legend{
    /* text-align: center; */
    font-weight: bold;
    font-size: 20px;
    color: rgb(76, 76, 76);
}

fieldset input{
	outline: none;
    text-align: center;
}

#signup fieldset:first-of-type label{
    float: left;
    width: 60px;
}
#reg_ul input{
    height: 25px;
    border-radius: 5px;
    border: solid 1.5px gray;
}
select{
	outline: none;
    border: 2px solid gray;
    border-radius: 5px;
    width: 140px;
    text-align: center;
}
input[type="button"],
input[type="reset"]
{
    cursor: pointer;
}

input[name="reg"],
input[name="reset"]
{
	width: 60px;
}

#reg_btn{
	margin-left: 60px;
}

#checkIdResult1{
	color: green;
}
#checkIdResult2{
	color: red;
}
</style>