<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] products = request.getParameterValues("products");
	ArrayList<ProductDTO> sessionList = (ArrayList<ProductDTO>)session.getAttribute("cartList");
	//세션에서 주문한 상품 데이터 삭제하기
	/* System.out.println(sessionList.size());
	System.out.println(products.length);
	for(int i = 0; i < sessionList.size(); i++){
		for(int j = 0; j < products.length; j++){
			if(sessionList.get(i).getPcode().equals(products[j])){
				sessionList.remove(i);
			}
		}
	} */
	Class.forName("org.mariadb.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mariadb://localhost:3306/myshop",
			"root",
			"1234"
			);
	Statement stmt = con.createStatement();
	
	// 카트테이블에서 주문한 상품 데이터 삭제하기
	for(int i = 0; i < products.length; i++){
		String query = "DELETE FROM cart_tbl WHERE pcode='" + products[i] + "'";
		stmt.executeUpdate(query);
	}
	
	// 주문 완료된 데이터를 데이터베이스에 저장하기
	String query = "INSERT INTO order_tbl (pcode, orderdate) VALUES (?, now())";
	
	for(int i = 0; i < products.length; i++){
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, products[i]);
		pstmt.executeUpdate();
	}
	ResultSet rs = stmt.executeQuery("SELECT * FROM order_tbl");
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>주문완료</h1>
<hr>
주문이 완료되었어요.
<hr>
<%
	while(rs.next()){
		
%>
		<p><%=rs.getInt("orderno") %> / <%=rs.getString("pcode") %> / <%=rs.getString("orderdate") %></p>
<%
	}
%>
</body>
</html>