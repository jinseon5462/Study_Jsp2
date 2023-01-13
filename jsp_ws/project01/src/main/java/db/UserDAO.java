package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.UserVO;

public class UserDAO {
	
	public int checkId(String id) {
		int result = 0;
		Connection conn = DBcon.getConnection();
		String query = "SELECT COUNT(id) as cnt FROM p01_usertable WHERE id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt("cnt");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int insert(UserVO user) {
		int result = 0;
		Connection conn = DBcon.getConnection();
		String query = "INSERT INTO p01_usertable (id, pw, name, tel, univ, grade) VALUES (?, ?, ?, ?, ?, 'user')";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPw());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getTel());
			pstmt.setString(5, user.getUniv());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public UserVO login(String id, String pw) {
		UserVO user = null;
		Connection conn = DBcon.getConnection();
		String query = "SELECT * FROM p01_usertable WHERE id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("id").equals(id) && rs.getString("pw").equals(pw)) {
					user = new UserVO();
					user.setId(rs.getString("id"));
					user.setPw(rs.getString("pw"));
					user.setName(rs.getString("name"));
					user.setTel(rs.getString("tel"));
					user.setUniv(rs.getString("univ"));
					user.setGrade(rs.getString("grade"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
}
