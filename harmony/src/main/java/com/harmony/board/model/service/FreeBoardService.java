package com.harmony.board.model.service;

import static com.harmony.common.JDBCTemplate.close;
import static com.harmony.common.JDBCTemplate.commit;
import static com.harmony.common.JDBCTemplate.getConnection;
import static com.harmony.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.harmony.board.free.model.dto.FreeBoard;
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
}
