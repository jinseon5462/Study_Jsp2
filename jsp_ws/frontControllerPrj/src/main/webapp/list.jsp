<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>List Page</h1>
<hr>
<div class="board">
	<table border="1">
		<thead>
			<tr>
				<th>num</th><th>title</th><th>writer</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="board" items="${msgList }">
			<tr>
				<td>${board.num }</td>
				<td><a href="view.jsp?num=${board.num }">${board.title }</a></td>
				<td>${board.writer }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>