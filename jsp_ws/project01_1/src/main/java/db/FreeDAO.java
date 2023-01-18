package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.FreeVO;
import common.ReplyVO;

public class FreeDAO {
	
	// 게시글 등록
	public int insert(FreeVO free) {
		int result = 0;
		Connection conn = DBcon.getConnection();
		String query = "INSERT INTO project01_free (title, content, id, univ) VALUES (?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, free.getTitle());
			pstmt.setString(2, free.getContent());
			pstmt.setString(3, free.getId());
			pstmt.setString(4, free.getUniv());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 자유게시판 글목록
	public ArrayList<FreeVO> getFreeList(){
		ArrayList<FreeVO> list = new ArrayList<>();
		Connection conn = DBcon.getConnection();
		try {
			String query = "SELECT * FROM project01_free ORDER BY regdate DESC LIMIT 0, 5";
			PreparedStatement pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeVO free = new FreeVO();
				free.setBno(rs.getInt("bno"));
				free.setTitle(rs.getString("title"));
				free.setContent(rs.getString("content"));
				free.setId(rs.getString("id"));
				free.setUniv(rs.getString("univ"));
				free.setRegdate(rs.getDate("regdate"));
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
					reply.setRegdate(rs2.getDate("regdate"));
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
	
	// 키워드 목록 출력
	public ArrayList<FreeVO> getKeywordList(String sel, String keyword) {
		ArrayList<FreeVO> list = new ArrayList<>();
		Connection conn = DBcon.getConnection();
		String query = "";
		if(sel.equals("title")) {
			query = "SELECT * FROM project01_free WHERE title LIKE ? ORDER BY regdate DESC LIMIT 0, 5";
		}else if(sel.equals("content")) {
			query = "SELECT * FROM project01_free WHERE content LIKE ? ORDER BY regdate DESC LIMIT 0, 5";
		}else if(sel.equals("id")){
			query = "SELECT * FROM project01_free WHERE id LIKE ? ORDER BY regdate DESC LIMIT 0, 5";
		}else if(sel.equals("univ")) {
			query = "SELECT * FROM project01_free WHERE univ LIKE ? ORDER BY regdate DESC LIMIT 0, 5";
		}
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + keyword + "%");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeVO free = new FreeVO();
				free.setBno(rs.getInt("bno"));
				free.setTitle(rs.getString("title"));
				free.setContent(rs.getString("content"));
				free.setId(rs.getString("id"));
				free.setUniv(rs.getString("univ"));
				free.setRegdate(rs.getDate("regdate"));
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
					reply.setRegdate(rs2.getDate("regdate"));
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
	
	// 게시글 상세 조회
	public FreeVO selectOne(String title, String id) {
		FreeVO free = new FreeVO();
		Connection conn = DBcon.getConnection();
		try {
			String query1 = "UPDATE project01_free SET view = view + 1 WHERE title = ? AND id = ?";
			PreparedStatement pstmt = conn.prepareStatement(query1);
			pstmt.setString(1, title);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			
			String query2 = "SELECT * FROM project01_free WHERE title = ? AND id = ?";
			pstmt = conn.prepareStatement(query2);
			pstmt.setString(1, title);
			pstmt.setString(2, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				free.setBno(rs.getInt("bno"));
				free.setTitle(rs.getString("title"));
				free.setContent(rs.getString("content"));
				free.setId(rs.getString("id"));
				free.setUniv(rs.getString("univ"));
				free.setRegdate(rs.getDate("regdate"));
				free.setView(rs.getInt("view"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return free;
	}
	
	// 페이지 처리
//	public ArrayList<FreeVO> getPage(){
//		ArrayList<FreeVO> list = new ArrayList<>();
//		Connection conn = DBcon.getConnection();
//		String query = "";
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(query);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return list;
//	}
}
