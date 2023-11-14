package com.harmony.lesson.dao;

import static com.harmony.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.harmony.lesson.dto.Lesson;

public class LessonDao {
	private Properties sql=new Properties();
	{
		String path=LessonDao.class
				.getResource("/sql/lesson/lesson_sql.properties").getPath();
		try(FileReader fr=new FileReader(path)) {
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	// 검색창에 있는 레슨 다 나오게하기
	public List<Lesson> printLessonAll(Connection conn,int cPage,int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Lesson> result=new ArrayList<>();
		try {
			pstmt=conn.prepareCall(sql.getProperty("printLessonAll"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result.add(getLesson(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	// 레슨 숫자가져오기
	public int printLessonCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("printLessonCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	// 번호로 레슨찾기
	public Lesson selectLessonByNo(Connection conn, int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Lesson l=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectLessonByNo"));
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) l=getLesson(rs);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return l;
	}
	// lesson 등록
	public int insertLesson(Connection conn, Lesson l) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertLesson"));
			pstmt.setString(1, l.getTeacherNo());
			pstmt.setString(2, String.join(",", l.getInstNo()));
			pstmt.setString(3, l.getBoardTitle());
			pstmt.setString(4, l.getBoardContent());
			pstmt.setString(5, l.getBoardPlace());
			pstmt.setString(6, l.getBoardPrice());
			pstmt.setString(7, l.getBoardImg());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	// lesson 시간, 요일정보 등록
	public int insertLessonTime(Connection conn, Lesson l) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertLessonTime"));
			pstmt.setTimestamp(1, l.getLessonStartTime());
			pstmt.setTimestamp(2, l.getLessonEndTime());
			pstmt.setString(3, String.join(",", l.getDay()));
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	// lesson 조회수 카운트
	public int updateLessonReadCount(Connection conn, int no) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("updateLessonReadCount"));
			pstmt.setInt(1, no);
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
//	public int insertBoardComment(Connection conn, BoardComment bc) {
//		PreparedStatement pstmt = null;
//		int result = 0;
//		try {
//			pstmt = conn.prepareStatement(sql.getProperty("insertBoardComment"));
//			pstmt.setInt(1, bc.getLevel());
//			pstmt.setString(2, bc.getBoardCommentWriter());
//			pstmt.setString(3, bc.getBoardCommentContent());
//			pstmt.setInt(4, bc.getBoardRef());
//			pstmt.setString(5, bc.getBoardCommentRef()==0?null:
//								String.valueOf(bc.getBoardCommentRef()));
//			//문자로들어오면 알아서 숫자로 형변환해서 오라클에 들어간다
//			result = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		} return result;
//		
//	}
	
//	public List<BoardComment> selectBoardComment(Connection conn, int no){
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		List<BoardComment> result = new ArrayList<>();
//		try {
//			pstmt= conn.prepareStatement(sql.getProperty("selectBoardComment"));
//			pstmt.setInt(1, no);
//			rs=pstmt.executeQuery();
//			while(rs.next()) {
//				result.add(getBoardComment(rs));
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rs);
//			close(pstmt);
//		} return result;
//	}
//	
//	private BoardComment getBoardComment(ResultSet rs) throws SQLException{
//		return BoardComment.builder()
//				.boardCommentNo(rs.getInt("board_comment_no"))
//				.level(rs.getInt("board_comment_level"))
//				.boardCommentWriter(rs.getString("board_comment_writer"))
//				.boardCommentContent(rs.getString("board_comment_content"))
//				.boardRef(rs.getInt("board_ref"))
//				.boardCommentRef(rs.getInt("board_comment_ref"))
//				.boardCommentDate(rs.getDate("board_comment_date"))
//				.build();
//	}
	
	private Lesson getLesson(ResultSet rs) throws SQLException {
		return Lesson.builder()
				.boardNo(rs.getInt("board_no"))
				.teacherNo(rs.getString("teacher_number"))
				.instNo(rs.getString("inst_no")!=null?
						rs.getString("inst_no").split(","):null)
				.boardTitle(rs.getString("board_title"))
				.boardContent(rs.getString("board_content"))
				.boardDate(rs.getTimestamp("board_date"))
				.boardView(rs.getInt("board_view_count"))
				.boardPlace(rs.getString("board_place"))
				.boardPrice(rs.getString("board_price"))
				.boardImg(rs.getString("board_image"))
				.boardDeadline(rs.getString("board_deadline").charAt(0))
				.build();
	}
	
}
