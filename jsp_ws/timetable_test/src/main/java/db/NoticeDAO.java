package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import vo.NoticeVO;

public class NoticeDAO {
	
	public int insert(NoticeVO notice) {
		int result = 0;
		Connection conn = DBcon.getConnection();
		String query = "INSERT INTO project01_notice (title, content, grade) VALUES (?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getContent());
			pstmt.setString(3, notice.getGrade());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public ArrayList<NoticeVO> getNoticeList(){
		ArrayList<NoticeVO> list = new ArrayList<>();
		Connection conn = DBcon.getConnection();
		String query = "SELECT * FROM project01_notice ORDER BY regdate DESC LIMIT 0, 10";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				NoticeVO notice = new NoticeVO();
				notice.setNum(rs.getInt("num"));
				notice.setTitle(rs.getString("title"));
				notice.setContent(rs.getString("content"));
				notice.setGrade(rs.getString("grade"));
				String regdate = rs.getString("regdate").substring(0, 16);
				notice.setRegdate(regdate);
				list.add(notice);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<NoticeVO> getMainNoticeList(){
		ArrayList<NoticeVO> list = new ArrayList<>();
		Connection conn = DBcon.getConnection();
		String query = "SELECT * FROM project01_notice ORDER BY regdate DESC LIMIT 0, 10";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				NoticeVO notice = new NoticeVO();
				notice.setNum(rs.getInt("num"));
				notice.setTitle(rs.getString("title"));
				notice.setContent(rs.getString("content"));
				notice.setGrade(rs.getString("grade"));
				String regdate = rs.getString("regdate").substring(0, 16);
				notice.setRegdate(regdate);
				list.add(notice);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int removeNotice(int num) {
		int result = 0;
		Connection conn = DBcon.getConnection();
		try {
			String query = "DELETE FROM project01_notice WHERE num = ?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int updateNotice(String title, String content, int num) {
		int result = 0;
		Connection conn = DBcon.getConnection();
		String query = "UPDATE project01_notice SET title = ?, content = ?, regdate = now() WHERE num = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, num);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public NoticeVO getNoticeInfo(int num) {
		NoticeVO notice = new NoticeVO();
		Connection conn = DBcon.getConnection();
		String query = "SELECT * FROM project01_notice WHERE num = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			notice.setNum(rs.getInt("num"));
			notice.setTitle(rs.getString("title"));
			notice.setContent(rs.getString("content"));
			notice.setGrade(rs.getString("grade"));
			String regdate = rs.getString("regdate").substring(0, 16);
			notice.setRegdate(regdate);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return notice;
	}
}
