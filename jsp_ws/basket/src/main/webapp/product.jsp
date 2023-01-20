<%@page import="dto.ProductDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ProductDTO prod = (ProductDTO)request.getAttribute("prod");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세보기</title>
<style>
	*{
		text-align: center;
	}
	table{
		width: 500px;
		margin: 0 auto;
	}
	img{
		width: 150px;
		height: 150px;
	}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<h1>상품 상세보기</h1>
<table border="1">
	<tr>
		<th>상품코드</th><td>${prod.pcode }</td>
	</tr>
	<tr>
		<th>상품명</th><td>${prod.pname }</td>
	</tr>
	<tr>
		<th>상품가격</th><td>${prod.price }</td>
	</tr>
	<tr>
		<th>상품정보</th><td>${prod.pinfo }</td>
	</tr>
	<tr>
		<th>사진</th><td><img src="files/${prod.photo }"></td>
	</tr>
	<tr>
		<th>상품코드</th><td>${prod.pcode }</td>
	</tr>
</table>
<form action="cart.do" method="post">
	<input type="hidden" name="pcode" value="${prod.pcode }">
	<input type="hidden" name="pname" value="${prod.pname }">
	<input type="hidden" name="price" value="${prod.price }">
	<input type="hidden" name="pinfo" value="${prod.pinfo }">
	<input type="hidden" name="photo" value="${prod.photo }">
	<input type="submit" value="장바구니에 담기">
</form>
</body>
</html>