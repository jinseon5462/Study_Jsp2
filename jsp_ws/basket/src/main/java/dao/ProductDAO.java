package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import dto.ProductDTO;

public class ProductDAO {
	public int insert(ProductDTO prod) {
		int result = 0;
		String query = "INSERT INTO product (pcode, pname, price, pinfo, photo) VALUES (?, ?, ?, ?, ?)";
		Connection con = null;
		PreparedStatement pstmt = null;
			try {
				Class.forName("org.mariadb.jdbc.Driver");
				con = DriverManager.getConnection(
						"jdbc:mariadb://localhost:3306/myshop",
						"root",
						"1234"
						);
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, prod.getPcode());
				pstmt.setString(2, prod.getPname());
				pstmt.setInt(3, prod.getPrice());
				pstmt.setString(4, prod.getPinfo());
				pstmt.setString(5, prod.getPhoto());
				result = pstmt.executeUpdate();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			return result;
	}
	
	public ArrayList<ProductDTO> getList(){
		ArrayList<ProductDTO> list = new ArrayList<>();
		Connection con = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(
						"jdbc:mariadb://localhost:3306/myshop",
						"root",
						"1234"
					);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM product");
			while(rs.next()) {
				ProductDTO prod = new ProductDTO();
				prod.setPcode(rs.getString("pcode"));
				prod.setPname(rs.getString("pname"));
				prod.setPrice(rs.getInt("price"));
				prod.setPinfo(rs.getString("pinfo"));
				prod.setPhoto(rs.getString("photo"));
				list.add(prod);
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ProductDTO getProduct(String pcode) {
		ProductDTO prod = new ProductDTO();
		Connection conn = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(
						"jdbc:mariadb://localhost:3306/myshop",
						"root",
						"1234"
					);
			String query = "SELECT * FROM product WHERE pcode = ?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, pcode);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				prod.setPcode(rs.getString("pcode"));
				prod.setPname(rs.getString("pname"));
				prod.setPrice(rs.getInt("price"));
				prod.setPinfo(rs.getString("pinfo"));
				prod.setPhoto(rs.getString("photo"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return prod;
	}
}
