package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.FreeVO;
import vo.ReplyVO;

public class HotDAO {
	// HOT 게시판 글목록
	public ArrayList<FreeVO> getHotList(String univ){
		ArrayList<FreeVO> list = new ArrayList<>();
		Connection conn = DBcon.getConnection();
		try {
			String query = "SELECT * FROM project01_free WHERE univ = ? ORDER BY view DESC LIMIT 0, 10";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, univ);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeVO free = new FreeVO();
				free.setBno(rs.getInt("bno"));
				free.setTitle(rs.getString("title"));
				free.setContent(rs.getString("content"));
				free.setId(rs.getString("id"));
				free.setUniv(rs.getString("univ"));
				String regdate = rs.getString("regdate").substring(0, 16);
				free.setRegdate(regdate);
				free.setView(rs.getInt("view"));
				
				// 해당 게시물의 댓글 ArrayList 가져오기
				String query2 = "SELECT * FROM project01_reply WHERE bno = ? ORDER BY regdate DESC";
				pstmt = conn.prepareStatement(query2);
				pstmt.setInt(1, free.getBno());
				ArrayList<ReplyVO> replyList = new ArrayList<>();
				ResultSet rs2 = pstmt.executeQuery();
				while(rs2.next()) {
					ReplyVO reply = new ReplyVO();
					reply.setRno(rs2.getInt("rno"));
					reply.setBno(rs.getInt("bno"));
					reply.setContent(rs2.getString("content"));
					reply.setId(rs2.getString("id"));
					reply.setUniv(rs2.getString("univ"));
					String regdate2 = rs.getString("regdate").substring(0, 16);
					reply.setRegdate(regdate2);
					replyList.add(reply);
				}
				free.setReplyList(replyList);	// 가져온 댓글목록을 FreeVO필드에 저장
				list.add(free);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
