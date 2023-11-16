package com.harmony.lesson.service;

import static com.harmony.common.JDBCTemplate.close;
import static com.harmony.common.JDBCTemplate.commit;
import static com.harmony.common.JDBCTemplate.getConnection;
import static com.harmony.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.harmony.lesson.dao.LessonDao;
import com.harmony.lesson.dto.Lesson;
import com.harmony.lesson.dto.LessonApply;
import com.harmony.lesson.dto.SaveLesson;


public class LessonService {
	private LessonDao dao=new LessonDao();
	
	//모든 레슨정보 출력
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
		Lesson l = dao.selectLessonByNo(conn, no);
		close(conn);
		return l;
	}
	// 레슨 번호로 레슨정보가져오기 && 조회수출력
	public Lesson selectLessonByNo(int no, boolean readResult) {
		Connection conn=getConnection();
		Lesson l = dao.selectLessonByNo(conn, no);
		if(l!=null && !readResult) {
			int result = dao.updateLessonReadCount(conn, no);
			
			if(result>0) {
				commit(conn);
				l.setBoardView(l.getBoardView()+1);
			}
		}
		close(conn);
		return l;
	}
	// 레슨 신청 정보 번호로 리뷰가져오기
	public List<LessonApply> selectReviewByNo(int no) {
		Connection conn = getConnection();
		List<LessonApply> l = dao.selectReviewByNo(conn,no);
		close(conn);
		return l;
	}
	// 리뷰개수
	public int selectReviewCountByNo(int no) {
		Connection conn=getConnection();
		int result=dao.selectReviewCountByNo(conn, no);
		close(conn);
		return result;
	}
	
	public Lesson selectTimeByNo(int no) {
		Connection conn=getConnection();
		Lesson result=dao.selectTimeByNo(conn, no);
		close(conn);
		return result;
	}
	//레슨 신청하기
	public int applyLesson(LessonApply member) {
		Connection conn=getConnection();
		int result=dao.applyLesson(conn, member);
		int result2=dao.applyLessonTime(conn, member);
		
		if(result>0 && result2>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
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
	public int updateLesson(Lesson l) {
		Connection conn=getConnection();
		int result=dao.updateLesson(conn, l);
		// 1. 시퀀스가져오기
		// 2. CURRVAL사용하기
		int result2=dao.updateLessonTime(conn,l);
		
		if(result>0 && result2>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public int deleteLesson(int no) {
		Connection conn=getConnection();
		int result2=dao.deleteLessonTime(conn, no);
		int result=dao.deleteLesson(conn, no);
		
		if(result>0 && result2>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	// 찜이되었는지 확인
	public SaveLesson saveLessonConfirm(int boardNo, String userNo){
		Connection conn=getConnection();
		SaveLesson result = dao.saveLessonConfirm(conn,boardNo,userNo);
		close(conn);
		return result;
	}
	// 찜하기
	public int saveLesson(int boardNo, String userNo){
		Connection conn=getConnection();
		int result = dao.saveLesson(conn,boardNo,userNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	// 찜삭제
	public int deleteSavedLesson(int boardNo, String userNo){
		Connection conn=getConnection();
		int result = dao.deleteSavedLesson(conn,boardNo,userNo);
		if(result>0) commit(conn);
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
