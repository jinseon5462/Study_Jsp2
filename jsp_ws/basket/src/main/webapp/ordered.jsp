<%@page import="java.util.ArrayList"%>
<%@page import="dto.OrderDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<OrderDTO> list = (ArrayList<OrderDTO>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문목록</title>
<style>
	table{
		margin: 0 auto;
	}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<h1>주문완료 목록</h1>
<table>
	<tr>
		<th>주문번호</th><th>제품코드</th><th>주문일자</th>
	</tr>
	<c:forEach var="item" items="${list }">
	<tr>
		<td>${item.orderno }</td>
		<td>${item.pcode }</td>
		<td>${item.orderdate }</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>