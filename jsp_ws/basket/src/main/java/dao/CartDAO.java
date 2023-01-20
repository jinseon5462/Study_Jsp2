package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import dto.CartDTO;
import dto.OrderDTO;
import dto.ProductDTO;

public class CartDAO {
	public void insert(ProductDTO prod) {
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
	}
	public int insertCart(String[] pcode, String[] pname, String[] price, String[] photo) {
		int result = 0;
		String query = "INSERT INTO cart_tbl (pcode, pname, price, photo) VALUES (?, ?, ?, ?)";
		try {
				for(int i = 0; i < pcode.length; i++) {
					Class.forName("org.mariadb.jdbc.Driver");
					Connection con = DriverManager.getConnection(
							"jdbc:mariadb://localhost:3306/myshop",
							"root",
							"1234"
							);
					PreparedStatement pstmt = con.prepareStatement(query);
					pstmt.setString(1, pcode[i]);
					pstmt.setString(2, pname[i]);
					pstmt.setInt(3, Integer.parseInt(price[i]));
					pstmt.setString(4, photo[i]);
					pstmt.executeUpdate();
				}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		return result;
	}
	
	public ArrayList<CartDTO> getCartList(){
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
		return list;
	}
	
	public ArrayList<OrderDTO> charge(String[] products) {
		ArrayList<OrderDTO> list = new ArrayList<>();
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mariadb://localhost:3306/myshop",
					"root",
					"1234"
					);
			PreparedStatement pstmt = null;
			for(int i = 0; i < products.length; i++){
				String query1 = "DELETE FROM cart_tbl WHERE pcode = ?";
				pstmt = con.prepareStatement(query1);
				pstmt.setString(1, products[i]);
				pstmt.executeUpdate();
			}
			for(int i = 0; i < products.length; i++){
				String query2 = "INSERT INTO order_tbl (pcode, orderdate) VALUES (?, now())";
				pstmt = con.prepareStatement(query2);
				pstmt.setString(1, products[i]);
				pstmt.executeUpdate();
			}
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM order_tbl");
			while(rs.next()) {
				OrderDTO order = new OrderDTO();
				order.setOrderno(rs.getInt("orderno"));
				order.setPcode(rs.getString("pcode"));
				order.setOrderdate(rs.getTimestamp("orderdate"));
				list.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return list;
	}
}
