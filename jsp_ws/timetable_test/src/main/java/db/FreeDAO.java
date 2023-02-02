package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.FreeVO;
import vo.ReplyVO;


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
	public ArrayList<FreeVO> getFreeList(String univ){
		ArrayList<FreeVO> list = new ArrayList<>();
		Connection conn = DBcon.getConnection();
		try {
			String query = "SELECT * FROM project01_free WHERE univ = ? ORDER BY regdate DESC LIMIT 0, 10";
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
	
	public ArrayList<FreeVO> getMainFreeList(String univ){
		ArrayList<FreeVO> list = new ArrayList<>();
		Connection conn = DBcon.getConnection();
		try {
			String query = "SELECT * FROM project01_free WHERE univ = ? ORDER BY regdate DESC LIMIT 0, 10";
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
	public ArrayList<FreeVO> getNotLoginMainFreeList(){
		ArrayList<FreeVO> list = new ArrayList<>();
		Connection conn = DBcon.getConnection();
		try {
			String query = "SELECT * FROM project01_free  ORDER BY regdate DESC LIMIT 0, 10";
			PreparedStatement pstmt = conn.prepareStatement(query);
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
	
	// 게시글 상세 조회
	public FreeVO getInfo(int bno) {
		FreeVO free = new FreeVO();
		Connection conn = DBcon.getConnection();
		try {
			String query1 = "UPDATE project01_free SET view = view + 1 WHERE bno = ?";
			PreparedStatement pstmt = conn.prepareStatement(query1);
			pstmt.setInt(1, bno);
			pstmt.executeUpdate();
			
			String query2 = "SELECT * FROM project01_free WHERE bno = ?";
			pstmt = conn.prepareStatement(query2);
			pstmt.setInt(1, bno);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				free.setBno(rs.getInt("bno"));
				free.setTitle(rs.getString("title"));
				free.setContent(rs.getString("content"));
				free.setId(rs.getString("id"));
				free.setUniv(rs.getString("univ"));
				String regdate = rs.getString("regdate").substring(0, 16);
				free.setRegdate(regdate);
				free.setView(rs.getInt("view"));
				
				// 해당 게시물의 댓글 ArrayList 가져오기
				String query3 = "SELECT * FROM project01_reply WHERE bno = ? ORDER BY regdate DESC";
				pstmt = conn.prepareStatement(query3);
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
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return free;
	}
	
	// 게시글 수정
	public FreeVO updateInfo(String title, String content, int bno) {
		FreeVO free = null;
		Connection conn = DBcon.getConnection();
		String query = "UPDATE project01_free SET title = ?, content = ? WHERE bno = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, bno);
			pstmt.executeUpdate();
			
			String query2 = "SELECT * FROM project01_free WHERE bno = ?";
			pstmt = conn.prepareStatement(query2);
			pstmt.setInt(1, bno);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				free = new FreeVO();
				free.setBno(rs.getInt("bno"));
				free.setTitle(rs.getString("title"));
				free.setContent(rs.getString("content"));
				free.setId(rs.getString("id"));
				free.setUniv(rs.getString("univ"));
				String regdate = rs.getString("regdate").substring(0, 16);
				free.setRegdate(regdate);
				free.setView(rs.getInt("view"));
				
				// 해당 게시물의 댓글 ArrayList 가져오기
				String query3 = "SELECT * FROM project01_reply WHERE bno = ? ORDER BY regdate DESC";
				pstmt = conn.prepareStatement(query3);
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
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return free;
	}
	
	
	// 게시글 삭제
	public int removeInfo(int bno) {
		int result = 0;
		Connection conn = DBcon.getConnection();
		try {
			String query = "DELETE FROM project01_free WHERE bno = ?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bno);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
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
