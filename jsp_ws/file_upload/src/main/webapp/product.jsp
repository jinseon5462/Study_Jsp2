<%@page import="dto.ProductDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pcode = request.getParameter("pcode");
	Class.forName("org.mariadb.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mariadb://localhost:3306/myshop",
			"root",
			"1234"
			);
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT * FROM product WHERE pcode='" + pcode + "'");
	if(rs.next()){
		ProductDTO prod = new ProductDTO();
		prod.setPcode(rs.getString("pcode"));
		prod.setPname(rs.getString("pname"));
		prod.setPrice(rs.getInt("price"));
		prod.setDesc(rs.getString("desc"));
		prod.setPhoto(rs.getString("photo"));
		pageContext.setAttribute("prod", prod);
	}
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
<h1>상품 상세보기 페이지</h1>
<hr>
<script>
	function cartin(){
		//장바구니 페이지로 이동하기
		const pcode = document.querySelector("#pcode").innerText;
		const pname = document.querySelector("#pname").innerText;
		const price = document.querySelector("#price").innerText;
		const photo = document.querySelector("#photo").innerText;
	}
</script>
<form action="cart.do" method="post">
	<div>
		<input type="hidden" name="pcode" value="${prod.pcode }">
		<input type="hidden" name="pname" value="${prod.pname }">
		<input type="hidden" name="price" value="${prod.price }">
		<input type="hidden" name="photo" value="${prod.photo }">
		<input type="submit" value="장바구니에 담기">
	</div>
</form>
	<table border="1">
		<tr>
			<th>상품코드</th><td id="pcode">${prod.pcode }</td>
		</tr>
		<tr>
			<th>상품명</th><td id="pname">${prod.pname }</td>
		</tr>
		<tr>
			<th>상품가격</th><td id="price">${prod.price }</td>
		</tr>
		<tr>
			<th>상품설명</th><td id="desc">${prod.desc }</td>
		</tr>
		<tr>
			<th>상품사진</th><td id="img"><img src="upload/${prod.photo }" alt="상품사진"></td>
		</tr>
	</table>
</body>
</html>