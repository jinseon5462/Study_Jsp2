package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.FreeVO;

public class FreeDAO {
	
	// 게시글 등록
	public int insert(FreeVO free) {
		int result = 0;
		Connection conn = DBcon.getConnection();
		String query = "INSERT INTO p01_freeboard (title, content, writer, univ) VALUES (?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, free.getTitle());
			pstmt.setString(2, free.getContent());
			pstmt.setString(3, free.getWriter());
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
		String query = "SELECT * FROM p01_freeboard ORDER BY regdate DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeVO free = new FreeVO();
				free.setTitle(rs.getString("title"));
				free.setContent(rs.getString("content"));
				free.setWriter(rs.getString("writer"));
				free.setUniv(rs.getString("univ"));
				free.setRegdate(rs.getDate("regdate"));
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
			query = "SELECT * FROM p01_freeboard WHERE title LIKE ?";
		}else if(sel.equals("content")) {
			query = "SELECT * FROM p01_freeboard WHERE content LIKE ?";
		}else if(sel.equals("writer")){
			query = "SELECT * FROM p01_freeboard WHERE writer LIKE ?";
		}else if(sel.equals("univ")) {
			query = "SELECT * FROM p01_freeboard WHERE univ LIKE ?";
		}
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + keyword + "%");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				FreeVO free = new FreeVO();
				free.setTitle(rs.getString("title"));
				free.setContent(rs.getString("content"));
				free.setWriter(rs.getString("writer"));
				free.setUniv(rs.getString("univ"));
				free.setRegdate(rs.getDate("regdate"));
				list.add(free);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 게시글 조회
	public FreeVO selectOne(String title, String writer) {
		FreeVO free = new FreeVO();
		Connection conn = DBcon.getConnection();
		String query1 = "UPDATE p01_freeboard SET view = view + 1 WHERE title = ? AND writer = ?";
		String query2 = "SELECT * FROM p01_freeboard WHERE title = ? AND writer = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query1);
			pstmt.setString(1, title);
			pstmt.setString(2, writer);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(query2);
			pstmt.setString(1, title);
			pstmt.setString(2, writer);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				free.setNum(rs.getInt("num"));
				free.setTitle(rs.getString("title"));
				free.setContent(rs.getString("content"));
				free.setWriter(rs.getString("writer"));
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
	public ArrayList<FreeVO> getPage(){
		ArrayList<FreeVO> list = new ArrayList<>();
		Connection conn = DBcon.getConnection();
		String query = "";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
