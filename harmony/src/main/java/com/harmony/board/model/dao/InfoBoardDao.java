package com.harmony.board.model.dao;

import static com.harmony.common.JDBCTemplate.close;


import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.harmony.board.info.model.dto.InfoBoard;


public class InfoBoardDao {
	private Properties sql = new Properties();
	{
		String path = InfoBoardDao.class.getResource("/board/board_sql.properties").getPath();
		try (FileReader fr = new FileReader(path)) {
			sql.load(fr);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<InfoBoard> selectBoard(Connection conn, int cPage, int numPerpage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<InfoBoard> result = new ArrayList<>();
		try {
			pstmt = conn.prepareCall(sql.getProperty("selectBoard"));
			// 전체글을 5개씩 보는거, 최신등록순 정렬
			pstmt.setInt(1, (cPage - 1) * numPerpage + 1);
			// cpage 1일떄 1
			// cpage 2일떄 6
			pstmt.setInt(2, cPage * numPerpage);
			// 1 * 5 5
			// 2 * 5 10
			rs = pstmt.executeQuery();
			while (rs.next()) {
				result.add(getBoard(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	// 이 코드는 전체글을 5개씩 보여주는 코드 (result에 저장하고 반환하는 코드)

	public int selectBoardCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectBoardCount"));
			rs = pstmt.executeQuery();
			if (rs.next())
				result = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	//이코드는 게시글 갯수를 카운트하는 코드
	
	public List<InfoBoard> selectBoardByCategory(Connection conn, String category, int cPage, int numPerpage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<InfoBoard> result = new ArrayList<>();
		try {
			pstmt = conn.prepareCall(sql.getProperty("selectBoardByCategory"));
			pstmt.setString(1, category);
			pstmt.setInt(2, (cPage - 1) * numPerpage + 1);
			pstmt.setInt(3, cPage * numPerpage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				result.add(getBoard(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	// pstmt로 sql 명령어로 카테고리를 조건문으로 걸어 특정 카테고리만 result에 담음 

	
	public int selectBoardCountByCategory(Connection conn, String keyword) {
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    int result = 0;

	    
	    try {
	    	pstmt = conn.prepareCall(sql.getProperty("selectBoardCountByCategory"));
	        pstmt.setString(1, keyword);
	        rset = pstmt.executeQuery();
	        if(rset.next()) {
	            result = rset.getInt(1);
	        }
	    } catch(Exception e) {
	        e.printStackTrace();
	    } finally {
	        close(rset);
	        close(pstmt);
	    }

	    return result;
	}

	
	private InfoBoard getBoard(ResultSet rs) throws SQLException {
		return InfoBoard.builder()
				.infBrdNo(rs.getInt("inf_brd_no"))
				.infBrdWriter(rs.getString("inf_brd_writer"))
				.infBrdTitle(rs.getString("inf_brd_title"))
				.infBrdContent(rs.getString("inf_brd_content"))
				.infBrdTitleImg(rs.getString("inf_brd_title_img"))
				.infBrdRegion(rs.getString("inf_brd_region"))
				.infBrdCatNo(rs.getString("inf_brd_cat_no"))
				.infBrdTagNo(rs.getString("inf_brd_tag_no"))
				.infBrdRegDate(rs.getDate("inf_brd_reg_date"))
				.build();
		
		//rs에 db에서 가져온 dto를 넣음
	}
	
	public int insertBoard(Connection conn, InfoBoard b) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertBoard"));
	        pstmt.setString(1, b.getInfBrdWriter());  
	        pstmt.setString(2, b.getInfBrdTitle());  
	        pstmt.setString(3, b.getInfBrdContent());  
	        pstmt.setString(4, b.getInfBrdTitleImg());  
	        pstmt.setString(5, b.getInfBrdRegion());
	        pstmt.setString(6, b.getInfBrdCatNo());
	        pstmt.setString(7, b.getInfBrdTagNo());
	        
	        result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
}
