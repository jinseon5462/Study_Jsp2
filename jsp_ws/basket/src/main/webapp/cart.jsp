<%@page import="dto.CartDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<CartDTO> cartList = (ArrayList<CartDTO>)request.getAttribute("cartList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
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
<h1>장바구니</h1>
	<form action="charge.do" method="post">
		<table border="1">
			<thead>
				<tr>
					<th><input type="checkbox" id="all"></th><th>상품코드</th><th>상품명</th><th>상품각격</th><th>사진</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${cartList }">
				<tr>
					<td><input type="checkbox" class="chk" name="products" value="${item.pcode }"></td>
					<td>${item.pcode }</td>
					<td>${item.pname }</td>
					<td>${item.price }</td>
					<td><img src="files/${item.photo }"></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<input type="submit" id="charge" value="구매하기">
	</form>
</body>
</html>