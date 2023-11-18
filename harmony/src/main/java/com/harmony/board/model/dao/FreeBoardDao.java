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
import com.harmony.board.free.model.dto.FreeCommentBoard;

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
	    //페이지네이션을 위한 게시판 목록 조회
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
	    //자유게시판의 전체 게시글 수를 조회
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
        //특정 번호(no)의 게시글을 조회
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
		//새로운 게시글을 데이터베이스에 삽입하는 메소드
	}

	public int insertFreeBoardComment(Connection conn, FreeCommentBoard fc) {
	    PreparedStatement pstmt = null;
	    int result = 0;
	    try {
	        pstmt = conn.prepareStatement(sql.getProperty("insertFreeBoardComment"));
	        pstmt.setInt(1, fc.getFreBrdNo());
	        pstmt.setString(2, fc.getFreComWriter());
	        pstmt.setString(3, fc.getFreComContent());
	        if (fc.getFreComRefNo() != null) {
	            pstmt.setInt(4, fc.getFreComRefNo());
	        } else {
	            pstmt.setNull(4, java.sql.Types.INTEGER);
	        }
	        pstmt.setInt(5, fc.getFreComLevel());
	        
	        result = pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(pstmt);
	    }
	    return result;
	}
	
	
	public List<FreeCommentBoard> selectFreeBoardComments(Connection conn, int boardNo) {
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List<FreeCommentBoard> comments = new ArrayList<>();

	    try {
	        pstmt = conn.prepareStatement(sql.getProperty("selectFreeBoardComment")); 
	        pstmt.setInt(1, boardNo);
	        rs = pstmt.executeQuery();
	        
	        while(rs.next()) {
	            FreeCommentBoard comment = getFreeComment(rs);
	            comments.add(comment);
	        }
	    } catch(SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }
	    
	    return comments;
	}
	
	public int updateBoardReadCount(Connection conn, int no) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("updateFreeBoardReadcount"));
			pstmt.setInt(1, no);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	
	private FreeBoard getFreeBoard(ResultSet rs) throws SQLException {
	    return FreeBoard.builder()
	            .freBrdNo(rs.getInt("FRE_BRD_NO"))
	            .freBrdWriter(rs.getString("FRE_BRD_WRITER"))
	            .freBrdTitle(rs.getString("FRE_BRD_TITLE"))
	            .freBrdContent(rs.getString("FRE_BRD_CONTENT"))
	            .freBrdTitleImg(rs.getString("FRE_BRD_TITLE_IMG"))
	            .freBrdDate(rs.getDate("FRE_BRD_DATE"))
	            .freBrdViews(rs.getInt("FRE_BRD_VIEWS"))
	            .build();
	}
	//esultSet으로부터 데이터를 읽어와 FreeBoard 객체를 생성하는 메소드
	
	private FreeCommentBoard getFreeComment(ResultSet rs) throws SQLException {
	    Integer freComRefNo = rs.getObject("FRE_COM_REF_NO", Integer.class); 
	    return FreeCommentBoard.builder()
	            .freComNo(rs.getInt("FRE_COM_NO"))
	            .freBrdNo(rs.getInt("FRE_BRD_NO"))
	            .freComWriter(rs.getString("FRE_COM_WRITER"))
	            .freComContent(rs.getString("FRE_COM_CONTENT"))
	            .freComDate(rs.getTimestamp("FRE_COM_DATE"))
	            .freComRefNo(freComRefNo)
	            .freComLevel(rs.getInt("FRE_COM_LEVEL"))
	            .build();
	
  }
	
}
	

