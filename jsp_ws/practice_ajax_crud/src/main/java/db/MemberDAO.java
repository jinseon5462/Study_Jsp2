package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.MemberVO;

public class MemberDAO {
	
	public int insert(MemberVO member) {
		int result = 0;
		Connection conn = DBcon.getConnection();
		String query = "INSERT INTO ajaxmember (id, pw, name, tel) VALUES (?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getTel());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public ArrayList<MemberVO> getList(){
		ArrayList<MemberVO> list = new ArrayList<>();
		Connection conn = DBcon.getConnection();
		String query = "SELECT * FROM ajaxmember";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVO member = new MemberVO();
				member.setId(rs.getString("id"));
				member.setPw(rs.getString("pw"));
				member.setName(rs.getString("name"));
				member.setTel(rs.getString("tel"));
				list.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<MemberVO> getKeywordList(String select, String keyword){
		ArrayList<MemberVO> list = new ArrayList<>();
		Connection conn = DBcon.getConnection();
		String query = "";
		
		if(select.equals("id")) {
			query = "SELECT * FROM ajaxmember WHERE id LIKE ?";
		}else if(select.equals("name")) {
			query = "SELECT * FROM ajaxmember WHERE name LIKE ?";
		}else if(select.equals("tel")) {
			query = "SELECT * FROM ajaxmember WHERE tel LIKE ?";
		}
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + keyword + "%");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVO member = new MemberVO();
				member.setId(rs.getString("id"));
				member.setPw(rs.getString("pw"));
				member.setName(rs.getString("name"));
				member.setTel(rs.getString("tel"));
				list.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void delete(String id) {
		Connection conn = DBcon.getConnection();
		String query = "DELETE FROM ajaxmember WHERE id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
