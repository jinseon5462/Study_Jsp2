<%@page import="dto.CartDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.ProductDTO"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<CartDTO> cartList = (ArrayList<CartDTO>)request.getAttribute("list");
	pageContext.setAttribute("cartList", cartList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	img{
		width: 150px;
	}
</style>
<body>
<h1>Cart page</h1>
<hr>
<form action="ordered.jsp" method="get">
	<table border="1">
		<thead>
			<tr>
				<th>선택</th><th>상품코드</th><th>상품명</th><th>상품가격</th><th>상품사진</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="prod" items="${cartList }">
			<tr>
				<td><input type="checkbox" name="products" class="chk" value="${prod.pcode }"></td>
				<td>${prod.pcode }</td>
				<td>${prod.pname }</td>
				<td>${prod.price }</td>
				<td><img src="upload/${prod.photo }"></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="5"><input type="submit" value="구매하기"></td>
			</tr>
		</tbody>
	</table>
</form>
</body>
</html>