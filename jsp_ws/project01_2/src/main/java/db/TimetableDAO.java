package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.TimetableVO;

public class TimetableDAO {
	public int insert(TimetableVO table) {
		int result = 0;
		Connection conn = DBcon.getConnection();
		String query = "INSERT INTO project01_timetable (subName, profName, day, startTime, endTime, place, id, color)"
					 + " VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			// 수강시간이 1시간 이상이면 1시간씩 잘라서 db저장
			if(table.getEndTime() - table.getStartTime() > 1) {
				for(int i = 0, j = 1; i < table.getEndTime() - table.getStartTime(); i++, j++) {
					pstmt.setString(1, table.getSubName());
					pstmt.setString(2, table.getProfName());
					pstmt.setString(3, table.getDay());
					pstmt.setInt(4, table.getStartTime() + i);
					pstmt.setInt(5, table.getStartTime() + j);
					pstmt.setString(6, table.getPlace());
					pstmt.setString(7, table.getId());
					pstmt.setString(8, table.getColor());
					result = pstmt.executeUpdate();
				}
			}else {
				pstmt.setString(1, table.getSubName());
				pstmt.setString(2, table.getProfName());
				pstmt.setString(3, table.getDay());
				pstmt.setInt(4, table.getStartTime());
				pstmt.setInt(5, table.getEndTime());
				pstmt.setString(6, table.getPlace());
				pstmt.setString(7, table.getId());
				pstmt.setString(8, table.getColor());
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<TimetableVO> getTimetable(String id){
		ArrayList<TimetableVO> list = new ArrayList<>();
		String query = "SELECT * FROM project01_timetable WHERE id = ?";
		Connection conn = DBcon.getConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				TimetableVO table = new TimetableVO();
				table.setSubName(rs.getString("subName"));
				table.setProfName(rs.getString("profName"));
				table.setDay(rs.getString("day"));
				table.setStartTime(rs.getInt("startTime"));
				table.setEndTime(rs.getInt("endTime"));
				table.setPlace(rs.getString("place"));
				table.setId(rs.getString("id"));
				table.setColor(rs.getString("color"));
				//System.out.println(table.toString());
				list.add(table);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int deleteSubject(String subName, String profName, String place) {
		int result = 0;
		Connection conn = DBcon.getConnection();
		try {
			String query = "DELETE FROM project01_timetable WHERE subName = ? AND profName = ? AND place = ?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, subName);
			pstmt.setString(2, profName);
			pstmt.setString(3, place);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
