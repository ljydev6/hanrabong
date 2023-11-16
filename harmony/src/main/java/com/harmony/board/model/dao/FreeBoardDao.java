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

import com.harmony.board.free.model.dto.FreeBoard;

public class FreeBoardDao {
	
	private Properties sql = new Properties();
	{
		String path = InfoBoardDao.class.getResource("/board/board_sql.properties").getPath();
		try (FileReader fr = new FileReader(path)) {
			sql.load(fr);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public List<FreeBoard> selectFreeBoard(Connection conn, int cPage, int numPerpage) {
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List<FreeBoard> result = new ArrayList<>();
	    try {
	        pstmt = conn.prepareCall(sql.getProperty("selectFreeBoard")); 
	        pstmt.setInt(1, (cPage - 1) * numPerpage + 1);
	        pstmt.setInt(2, cPage * numPerpage);
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	            result.add(getFreeBoard(rs)); 
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }
	    return result;
	}
	
	public int selectFreeBoardCount(Connection conn) {
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int result = 0;
	    try {
	        pstmt = conn.prepareStatement(sql.getProperty("selectFreeBoardCount"));
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            result = rs.getInt(1); 
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }
	    return result;
	}

	public FreeBoard selectFreeBoardByNo(Connection conn, int no) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        FreeBoard freeBoard = null;
        try {
            pstmt = conn.prepareStatement(sql.getProperty("selectFreeBoardByNo"));
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                freeBoard = getFreeBoard(rs); 
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        return freeBoard;
    }
	
	
	
	public int insertFreeBoard(Connection conn, FreeBoard b) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertFreeBoard"));
	        pstmt.setString(1, b.getFreBrdWriter());  
	        pstmt.setString(2, b.getFreBrdTitle());  
	        pstmt.setString(3, b.getFreBrdContent());  
	        pstmt.setString(4, b.getFreBrdTitleImg());
	        
	        result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	private FreeBoard getFreeBoard(ResultSet rs) throws SQLException {
	    return FreeBoard.builder()
	            .freBrdNo(rs.getInt("fre_brd_no"))
	            .freBrdWriter(rs.getString("fre_brd_writer"))
	            .freBrdTitle(rs.getString("fre_brd_title"))
	            .freBrdContent(rs.getString("fre_brd_content"))
	            .freBrdTitleImg(rs.getString("fre_brd_title_img"))
	            .freBrdDate(rs.getDate("fre_brd_date"))
	            .freBrdViews(rs.getInt("fre_brd_views"))
	            .build();
	}
}
