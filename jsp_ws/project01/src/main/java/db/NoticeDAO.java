package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.NoticeVO;

public class NoticeDAO {
	
	public int insert(NoticeVO notice) {
		int result = 0;
		Connection conn = DBcon.getConnection();
		String query = "INSERT INTO p01_noticeboard (title, content, writer) VALUES (?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getContent());
			pstmt.setString(3, notice.getWriter());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public ArrayList<NoticeVO> getNoticeList(){
		ArrayList<NoticeVO> list = new ArrayList<>();
		Connection conn = DBcon.getConnection();
		String query = "SELECT * FROM p01_noticeboard ORDER BY regdate DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				NoticeVO notice = new NoticeVO();
				notice.setNum(rs.getInt("num"));
				notice.setTitle(rs.getString("title"));
				notice.setContent(rs.getString("content"));
				notice.setWriter(rs.getString("writer"));
				notice.setRegdate(rs.getDate("regdate"));
				list.add(notice);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
