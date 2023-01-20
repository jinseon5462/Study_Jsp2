<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Class.forName("org.mariadb.jdbc.Driver");
	Connection con = DriverManager.getConnection(
				"jdbc:mariadb://localhost:3306/myshop",
				"root",
				"1234"
			);
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT * FROM product");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>상품목록</h1>
<hr>
<table border="1" width="600px" style="text-align: center">
	<thead>
		<tr>
			<th><input type="checkbox" id="all"></th>
			<th>상품코드</th>
			<th>상품명</th>
			<th>가격</th>
			<th>사진</th>
			<th>주문버튼</th>
		</tr>
	</thead>
	<tbody id="tbody">
	<form name="frm" action="cart.do" method="post">
	<%
		int i = 1;
		while(rs.next()){
	%>
		<tr>
			<td><input type="checkbox" name="products" id="chk" class="chk" value="<%= rs.getString("pcode") %>"></td>
			<td><%= rs.getString("pcode") %></td>
			<td><a href="product.jsp?pcode=<%=rs.getString("pcode")%>"><%= rs.getString("pname") %></a></td>
			<td><%= rs.getString("price") %></td>
			<td><img src="upload/<%= rs.getString("photo") %>" width="200px" height="100px"></td>
			<td><button type="button">장바구니담기</button></td>
		</tr>
	<%
			i++;
		}
	%>
	</form>
	</tbody>
</table>

<script>
	// 모두선택하기
	const all = document.querySelector("#all");
	all.addEventListener("change", change);
	
	function change(){
		//alert(all.checked);
		const chks = document.querySelectorAll(".chk");
		for(let i = 0; i < chks.length; i++){
			chks[i].checked = all.checked;
		}
	}
	
	// 장바구니 담기(개별)
	const tbody = document.querySelector("#tbody");
	
	tbody.addEventListener("click", f);
	
	function f(e){
		let target;
		if(e.target.tagName == "INPUT"){
			let target = e.target.parentElement.parentElement.firstElementChild.nextElementSibling.innerText;
			alert(target);
		}else if(e.target.tagName == "BUTTON"){
			let checkbox = document.querySelector("#chk");
			let is_checked = checkbox.checked;
			if(is_checked){
				document.frm.submit();
			}
		}
	}
</script>
</body>
</html>