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
<title>상품등록하기</title>
<style>
	table{
		margin: 0 auto;
	}
	textarea{
		resize: none;
	}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<form action="reg.do" method="post" encType="multipart/form-data">
		<table border="1">
			<tr>
				<th>상품코드</th><td><input type="text" name="pcode"></td>
			</tr>
			<tr>
				<th>상품명</th><td><input type="text" name="pname"></td>
			</tr>
			<tr>
				<th>가격</th><td><input type="text" name="price"></td>
			</tr>
			<tr>
				<th>상품설명</th><td><textarea name="pinfo"></textarea></td>
			</tr>
			<tr>
				<th>상품사진</th><td><input type="file" name="photo"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="reset" value="초기화">
					<input type="submit" value="등록">
				</td>
			</tr>
		</table>
	</form>
	<c:if test="${result == 1}">
		<script>
			alert("상품등록 성공");
			location.href = "getList.do";
		</script>
	</c:if>
</body>
</html>