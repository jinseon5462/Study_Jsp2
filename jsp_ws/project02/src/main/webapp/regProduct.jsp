<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	int result = (Integer)request.getAttribute("result");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
</head>
<body>
<%@ include file="header.jsp" %>
<form id="frm" action="addProduct.do" method="post" enctype="multipart/form-data">
	<input type="text" name="pName"><br>	
	<input type="text" name="pInfo"><br>
	<input type="text" name="price"><br>	
	<input type="file" name="img"><br>
	<input type="submit" value="업로드"><br>
</form>
<c:if test="${result == 1}">
	<script>
		alert("등록성공");
		location.href = "getList.do";
	</script>
</c:if>
<c:if test="${result == 0}">
	<script>
		alert("등록실패");
		location.href = "getList.do";
	</script>
</c:if>
</body>
</html>