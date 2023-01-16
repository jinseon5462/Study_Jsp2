package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.ReplyVO;

public class ReplyDAO {
	
	public int insert(ReplyVO reply) {
		int result = 0;
		Connection conn = DBcon.getConnection();
		try {
			String query = "INSERT INTO project01_reply (bno, content, id, univ) VALUES (?, ?, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reply.getBno());
			pstmt.setString(2, reply.getContent());
			pstmt.setString(3, reply.getId());
			pstmt.setString(4, reply.getUniv());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<ReplyVO> getReply(int bno){
		ArrayList<ReplyVO> list = new ArrayList<ReplyVO>();
		Connection conn = DBcon.getConnection();
		String query = "SELECT * FROM project01_reply WHERE bno = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bno);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				ReplyVO reply = new ReplyVO();
				reply.setRno(rs.getInt("rno"));
				reply.setBno(rs.getInt("bno"));
				reply.setContent(rs.getString("content"));
				reply.setId(rs.getString("id"));
				reply.setUniv(rs.getString("univ"));
				reply.setRegdate(rs.getDate("regdate"));
				list.add(reply);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
