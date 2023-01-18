package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.CartDTO;
import dto.ProductDTO;

@WebServlet("/cart.do")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CartDTO> list = new ArrayList<>();
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mariadb://localhost:3306/myshop",
					"root",
					"1234"
					);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM cart_tbl");
			while(rs.next()) {
				CartDTO item = new CartDTO();
				item.setCno(rs.getInt("cno"));
				item.setPcode(rs.getString("pcode"));
				item.setPname(rs.getString("pname"));
				item.setPrice(rs.getInt("price"));
				item.setPhoto(rs.getString("photo"));
				
				list.add(item);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("list", list);
		request.getRequestDispatcher("cart.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// 장바구니 담기(상세페이지에서)
		String pcode = request.getParameter("pcode");
		String pname = request.getParameter("pname");
		String price = request.getParameter("price");
		String photo = request.getParameter("photo");
		
		ProductDTO prod = new ProductDTO();
		prod.setPcode(pcode);
		prod.setPname(pname);
		prod.setPrice(Integer.parseInt(price));
		prod.setPhoto(photo);
		
		String query = "INSERT INTO cart_tbl (pcode, pname, price, photo) VALUES (?, ?, ?, ?)";
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mariadb://localhost:3306/myshop",
					"root",
					"1234"
					);
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, prod.getPcode());
			pstmt.setString(2, prod.getPname());
			pstmt.setInt(3, prod.getPrice());
			pstmt.setString(4, prod.getPhoto());
			pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		doGet(request, response);
	}
}
