package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.UserVO;

public class UserDAO {
	public UserVO login(String id, String pw) {
		UserVO user = null;
		Connection conn = DBcon.getConnection();
		String query = "SELECT * FROM project02_user WHERE id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				if(pw.equals(rs.getString("pw"))) {
					user = new UserVO();
					user.setId(rs.getString("id"));
					user.setPw(rs.getString("pw"));
					user.setGrade(rs.getString("grade"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
}
