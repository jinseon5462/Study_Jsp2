<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="header.jsp" %>
<table border="1">
	<tr>
		<th>선택</th>
		<th>이름</th>
		<th>설명</th>
		<th>가격</th>
		<th>이미지</th>
	</tr>
	<c:forEach var="product" items="${list }">
	<tr>
		<td><input type="checkbox" name="checkbox" id="checkbox"></td>
		<td style="display:none">${product.pcode }</td>
		<td>${product.pname }</td>
		<td>${product.pinfo }</td>
		<td>${product.price }</td>
		<td><img src="files/${product.img }" width="150px"></td>
	</tr>
	</c:forEach>
</table>
	<input type="button" id="addBasket" value="장바구니에 담기">
<script>
	$("#addBasket").on("click", function(){
		let checkbox = $("input[name=checkbox]:checked");
		let choiceProducts = [];
		checkbox.each(function(i){
			let tr = checkbox.parent().parent().eq(i);
			let td = tr.children();
			
			let pcode = td.eq(1).text();
			
			console.log(pcode);
			choiceProducts.push(pcode);
		});
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			
		}
		let id = $("#user_id").val();
		xhttp.open("POST", "addBasket.do", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("choiceProducts=" + choiceProducts + "&id=" + id);
	});
</script>
</body>
</html>