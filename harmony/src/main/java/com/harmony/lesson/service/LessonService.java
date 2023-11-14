package com.harmony.lesson.service;

import static com.harmony.common.JDBCTemplate.close;
import static com.harmony.common.JDBCTemplate.commit;
import static com.harmony.common.JDBCTemplate.getConnection;
import static com.harmony.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.harmony.lesson.dao.LessonDao;
import com.harmony.lesson.dto.Lesson;


public class LessonService {
	private LessonDao dao=new LessonDao();
	
	public List<Lesson> printLessonAll(int cPage,int numPerpage){
		Connection conn=getConnection();
		List<Lesson> result=dao.printLessonAll(conn, cPage, numPerpage);
		close(conn);
		return result;
	}
	public int printLessonCount() {
		Connection conn=getConnection();
		int result=dao.printLessonCount(conn);
		close(conn);
		return result;
	}
	
	public Lesson selectLessonByNo(int no) {
		Connection conn=getConnection();
		Lesson result=dao.selectLessonByNo(conn, no);
		close(conn);
		return result;
	}
	//조회수
//	public Lesson selectBoardByNo(int no,boolean readResult) {
//		Connection conn=getConnection();
//		Lesson b=dao.selectBoardByNo(conn, no);
//		if(b!=null&&!readResult) {
//			int result=dao.updateBoardReadCount(conn,no);
//			
//			if(result>0) { 
//				commit(conn);
//				b.setBoardReadcount(b.getBoardReadcount()+1);
//			}
//			else rollback(conn);
//		}
//		close(conn);
//		return b;
//	}
	public int insertLesson(Lesson l) {
		Connection conn=getConnection();
		int result=dao.insertLesson(conn, l);
		// 1. 시퀀스가져오기
		// 2. CURRVAL사용하기
		int result2=dao.insertLessonTime(conn,l);
		
		if(result>0 && result2>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	//댓글기능
//	public int insertBoardComment(BoardComment bc) {
//		Connection conn = getConnection();
//		int result= dao.insertBoardComment(conn,bc);
//		if(result>0) commit(conn);
//		else rollback(conn);
//		close(conn);
//		return result;
//	}
//	public List<BoardComment> selectBoardComment(int no) {
//		Connection conn = getConnection();
//		List<BoardComment> list = dao.selectBoardComment(conn, no);
//		close(conn);
//		return list;
//	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
