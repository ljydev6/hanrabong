package com.harmony.board.model.service;

import static com.harmony.common.JDBCTemplate.close;
import static com.harmony.common.JDBCTemplate.getConnection;
import static com.harmony.common.JDBCTemplate.commit;
import static com.harmony.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.harmony.board.info.model.dto.InfoBoard;
import com.harmony.board.model.dao.InfoBoardDao;


public class InfoBoardService {
	private InfoBoardDao dao=new InfoBoardDao();
	
	public List<InfoBoard> selectBoard(int cPage,int numPerpage){
		Connection conn=getConnection();
		//DB에 연결하는 코드
		List<InfoBoard> result=dao.selectBoard(conn, cPage, numPerpage);
		//dao의 selectBoard메소드(글을 5개씩 보여주기)를 실행해서 result에 저장
		close(conn);
		return result;
	}

	public int selectBoardCount() {
		Connection conn=getConnection();
		int result=dao.selectBoardCount(conn);
		//dao의 selectBoardCount메소드(갯수)를 실행해서 result에 저장
		close(conn);
		return result;
	}
}








