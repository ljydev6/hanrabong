package com.harmony.ensemble.model.service;

import static com.harmony.common.JDBCTemplate.close;
import static com.harmony.common.JDBCTemplate.getConnection;
import static com.harmony.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.harmony.ensemble.model.dao.EnsembleDao;
import com.harmony.ensemble.model.dto.EnsembleBoard;
import com.harmony.ensemble.model.dto.EnsembleBoardWantPart;
import com.harmony.ensemble.model.dto.EnsembleMember;
import com.harmony.ensemble.model.dto.EnsembleTeam;
import com.harmony.ensemble.model.dto.EnsembleTeamMusic;
import com.harmony.ensemble.model.dto.EnsembleTeamTime;
import com.harmony.ensemble.model.dto.EnsembleTeamVideo;
import com.harmony.ensemble.model.dto.Genre;
import com.harmony.ensemble.model.dto.Inst;


public class EnsembleService {

	private EnsembleDao dao = new EnsembleDao();
	
	
	public EnsembleTeam writeBoard(EnsembleBoard board ,List<EnsembleBoardWantPart> partList) {
		
		Connection conn = getConnection();
		
//		dao.selectTeamNo();
//		dao.select
//		
//		int result = dao.insertBoard();
//		
//		if(result>0) {
//			int result2 = dao.insertWantPart();
//			}else {
//				rollback(conn);
//				throw new IllegalArgumentException("글 등록 에러");
//		}
		
		return null;
	}

	
	
	public int insertTeam(EnsembleTeam ensTeam, List<EnsembleTeamMusic> musicList, 
							List<EnsembleTeamVideo> videoList, List<EnsembleTeamTime> timeList,
							List<EnsembleMember> ensMemList) {
		Connection conn=getConnection();
		
		int result = dao.insertTeam(conn, ensTeam);
		
		if(result>0) {
			
			if(!timeList.isEmpty()) {
				for(EnsembleTeamTime time : timeList) {
					int result2 = dao.insertTime(conn, time);
					if(result2==0) {
						rollback(conn);
						throw new IllegalArgumentException("합주 일정 에러");
					}
				}
			}
			
			if(!musicList.isEmpty()) {
				for(EnsembleTeamMusic music : musicList) {
					int result3 = dao.insertMusic(conn, music);
					if(result3==0) {
						rollback(conn);
						throw new IllegalArgumentException("음원 업로드 에러");
					}
				}		
			}
			if(!videoList.isEmpty()) {
				for(EnsembleTeamVideo video : videoList) {		
					int result4 = dao.insertVideo(conn, video);
					if(result4==0) {
						rollback(conn);
						throw new IllegalArgumentException("비디오 업로드 에러");
					}
				}
			}		
			
			if(!ensMemList.isEmpty()) {
				for(EnsembleMember ensMem : ensMemList) {		
					int result5 = dao.insertEnsMember(conn, ensMem);
					if(result5==0) {
						rollback(conn);
						throw new IllegalArgumentException("팀원 등록 에러");
					}
				}
			}	
			
		}else {
			rollback(conn);
			throw new IllegalArgumentException("팀테이블 등록 에러");
		}
		close(conn);
		return result;
	}
	
	public List<Inst> searchAllInst(){
		Connection conn=getConnection();
		List<Inst> result=dao.searchAllInst(conn);
		close(conn);
		return result;
	}
	
	public List<Genre> searchAllGenre(){
		Connection conn=getConnection();
		List<Genre> result=dao.searchAllGenre(conn);
		close(conn);
		return result;
	}
	
	public String selectMemberByEmail(String userEmail) {
		Connection conn=getConnection();
		String memNo = dao.selectMemberByEmail(conn, userEmail);
		close(conn);
		return memNo;
	}
	
	public String selectSeq() { //팀 번호 가져오는 메소드
		Connection conn = getConnection();
		
		String seq = dao.selectSeq(conn);
		
		return seq;
		
	}
	
	public String selectTeamNoByMemNo(String loginMemNo) { 
		
		Connection conn = getConnection();
		String teamNo = dao.selectTeamNoByMemNo(conn, loginMemNo);
		return teamNo;
	}
	
	public EnsembleTeam selectTeamByNo(String teamNo) {
		Connection conn = getConnection();
		EnsembleTeam team = dao.selectTeamByNo(conn, teamNo);
		return team;
	}
	
}
