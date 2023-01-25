<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("data", "hello~");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
    <style>
        #container{
            width: 800px;
            height: 700px;
            background-color: aquamarine;
        }
        #top{
            height: 300px;
            background-color: orange;
        }
        #wrap{
            display: flex;
        }
    </style>
</head>
<body>
    <div id="container">
        <div id="top">
            top<br> ${data }
        </div>
        <div id="wrap">
            <div id="left">
                <iframe src="iframe_sub.jsp"
                title="iframe Example 1"
                width="400"
                height="400">
            </iframe>
        </div>
        <div id="right">
            <iframe id="inlineFrameExample"
            title="Inline Frame Example"
            width="400"
            height="400"
            src="https://www.openstreetmap.org/export/embed.html?bbox=-0.004017949104309083%2C51.47612752641776%2C0.00030577182769775396%2C51.478569861898606&layer=mapnik">
        </iframe>
    </div>
</div>
</div>
</body>
</html>