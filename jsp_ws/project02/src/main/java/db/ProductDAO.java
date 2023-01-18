package db;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.ProductVO;

public class ProductDAO {
	public ArrayList<ProductVO> getList(){
		ArrayList<ProductVO> list = new ArrayList<>();
		Connection conn = DBcon.getConnection();
		String query = "SELECT * FROM project02_product";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductVO product = new ProductVO();
				product.setPcode(rs.getInt("pcode"));
				product.setPname(rs.getString("pname"));
				product.setPinfo(rs.getString("pinfo"));
				product.setPrice(rs.getInt("price"));
				product.setImg(rs.getString("img"));
				list.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int insert(ProductVO product, File file) {
		int result = 0;
		Connection conn = DBcon.getConnection();
		String query = "INSERT INTO project02_product (pname, pinfo, price, img) VALUES (?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, product.getPname());
			pstmt.setString(2, product.getPinfo());
			pstmt.setInt(3, product.getPrice());
			pstmt.setString(4, file.getName());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
