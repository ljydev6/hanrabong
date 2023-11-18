package com.harmony.board.model.service;

import static com.harmony.common.JDBCTemplate.close;
import static com.harmony.common.JDBCTemplate.commit;
import static com.harmony.common.JDBCTemplate.getConnection;
import static com.harmony.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.harmony.board.free.model.dto.FreeBoard;
import com.harmony.board.free.model.dto.FreeCommentBoard;
import com.harmony.board.model.dao.FreeBoardDao;

public class FreeBoardService {
    private FreeBoardDao dao = new FreeBoardDao();

    public List<FreeBoard> selectFreeBoard(int cPage, int numPerpage) {
        Connection conn = getConnection();
        List<FreeBoard> result = dao.selectFreeBoard(conn, cPage, numPerpage);
        close(conn);
        return result;
    }   
    
    public int selectFreeBoardCount() {
        Connection conn = getConnection();
        int result = dao.selectFreeBoardCount(conn);
      //dao의 selectFreeBoardCount메소드(갯수)를 실행해서 result에 저장
        close(conn);
        return result;
    }

    public FreeBoard selectFreeBoardByNo(int no) {
        Connection conn = getConnection();
        FreeBoard b = dao.selectFreeBoardByNo(conn, no);
        close(conn);
        return b;
    }
    
    public int insertFreeBoard(FreeBoard b) {
        Connection conn = getConnection();
        int result = dao.insertFreeBoard(conn, b);
        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        close(conn);
        return result;
    }
    
    public FreeBoard selectBoardByNo(int no,boolean readResult) {
	    Connection conn = getConnection();
	    FreeBoard b = dao.selectFreeBoardByNo(conn, no);
	    System.out.println(readResult);
	    System.out.println(no);

	    if(b!=null&&readResult) {
			int result=dao.updateBoardReadCount(conn,no);
			
			if(result>0) { 
				commit(conn);
				b.setFreBrdViews(b.getFreBrdViews()+1);
			}
			else rollback(conn);
		}
		close(conn);
		return b;
	}
    
    public int insertFreeBoardComment(FreeCommentBoard fc) {
        Connection conn = getConnection();
        int result = dao.insertFreeBoardComment(conn, fc);
        if (result > 0) commit(conn);
        else rollback(conn);
        close(conn);
        return result;
    }
    
    public List<FreeCommentBoard> selectFreeBoardComments(int boardNo) {
        Connection conn = getConnection();
        List<FreeCommentBoard> comments = dao.selectFreeBoardComments(conn, boardNo);
        close(conn);
        return comments;
    }
    //특정 게시판의 댓글 목록을 가져오는 것
}
