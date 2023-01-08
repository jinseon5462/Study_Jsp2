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
	
	public int delete(String id) {
		int result = 0;
		Connection conn = DBcon.getConnection();
		String query = "DELETE FROM ajaxmember WHERE id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<MemberVO> getSearchList(String sel, String content) {
		ArrayList<MemberVO> list = new ArrayList<>();
		Connection conn = DBcon.getConnection();
		String query = "";
		if(sel.equals("id")) {
			query = "SELECT * FROM ajaxmember WHERE id LIKE ?";
		}else if(sel.equals("name")) {
			query = "SELECT * FROM ajaxmember WHERE name LIKE ?";
		}else {
			query = "SELECT * FROM ajaxmember WHERE tel LIKE ?";
		}
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + content + "%");
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
	
	public ArrayList<MemberVO> getMember(String id) {
		ArrayList<MemberVO> list = new ArrayList<>();
		MemberVO member = new MemberVO();
		Connection conn = DBcon.getConnection();
		String query = "SELECT * FROM ajaxmember WHERE id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			member.setId(rs.getString("id"));
			member.setPw(rs.getString("pw"));
			member.setName(rs.getString("name"));
			member.setTel(rs.getString("tel"));
			list.add(member);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int update(MemberVO member) {
		Connection conn = DBcon.getConnection();
		String query = "UPDATE ajaxmember SET pw = ?, name = ?, tel = ? WHERE id = ?";
		int result = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getPw());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getTel());
			pstmt.setString(4, member.getId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
