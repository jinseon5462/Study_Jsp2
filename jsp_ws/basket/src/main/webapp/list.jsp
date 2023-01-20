<%@page import="dto.ProductDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<ProductDTO> list = (ArrayList<ProductDTO>)request.getAttribute("list");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<style>
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
	<h1>상품목록</h1>
	<hr>
	<form action="insertCart.do" method="post">
	<table border="1">
		<thead>
			<tr>
				<th><input type="checkbox" id="all"></th>
				<th>상품코드</th>
				<th>상품명</th>
				<th>가격</th>
				<th>사진</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="prod" items="${list }">
			<tr>
				<td><input type="checkbox" name="products" id="chk" value="${prod.pcode }"></td>
				<input type="hidden" name="pcode" value="${prod.pcode }">
				<input type="hidden" name="pname" value="${prod.pname }">
				<input type="hidden" name="price" value="${prod.price }">
				<input type="hidden" name="photo" value="${prod.photo }">
				<td>${prod.pcode }</td>
				<td><a href="getProductInfo.do?pcode=${prod.pcode }">${prod.pname }</a></td>
				<td>${prod.price }</td>
				<td id="${prod.photo }"><img src="files/${prod.photo }"></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<input type="submit" value="장바구니 담기">
	</form>
<script>
	// 전체선택
	/* const all = document.querySelector("#all");
	all.addEventListener("change", selectAll);
	
	function selectAll(){
		const chks = document.querySelectorAll("#chk");
		for(let i = 0; i < chks.length; i++){
			chks[i].checked = all.checked;
		}
	} */
	
	// 개별담기
	/* const tbody = document.querySelector("tbody");
	tbody.addEventListener("change", addCart);
	
	function addCart(e){
		let checkbox = document.querySelector("input[type='checkbox']");
		if(!checkbox && document.querySelector("#all")){
			return;
		}else{
			var info = {
				pcode: e.target.parentElement.parentElement.children[1].innerText,
				pname: e.target.parentElement.parentElement.children[2].innerText,
				price: e.target.parentElement.parentElement.children[3].innerText,
				photo: e.target.parentElement.parentElement.children[4].id
			}
			alert(info.pcode + ", " + info.pname + "," + info.price + ", " + info.photo);
		}
	} */
	
	/* const cart_in = document.querySelector("#cart_in");
	cart_in.addEventListener("click", add);
	function add(){
		let count = document.querySelectorAll("input[type='checkbox']:checked").length;
		for(let i = 0; i < count; i++){
			let pcode = document.querySelectorAll("input[type='checkbox']:checked")[i].parentElement.parentElement.children[1].innerText;
			let pname = document.querySelectorAll("input[type='checkbox']:checked")[i].parentElement.parentElement.children[2].innerText;
			let price = document.querySelectorAll("input[type='checkbox']:checked")[i].parentElement.parentElement.children[3].innerText;
			let photo = document.querySelectorAll("input[type='checkbox']:checked")[i].parentElement.parentElement.children[4].id;
			console.log(pcode + "," + pname + "," + price + "," + photo);
			cart.push(prod);
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function(){
				
			}
			xhttp.open("POST", "insertCart.do");
			xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhttp.send("pcode=" + pcode + "&pname=" + pname + "&price=" + price + "&photo=" + photo);
		}
	} */
</script>
</body>
</html>