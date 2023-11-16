package com.harmony.ensemble.model.service;

import static com.harmony.common.JDBCTemplate.close;
import static com.harmony.common.JDBCTemplate.getConnection;
import static com.harmony.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.harmony.ensemble.model.dao.EnsembleDao;
import com.harmony.ensemble.model.dto.EnsembleMember;
import com.harmony.ensemble.model.dto.EnsembleTeam;
import com.harmony.ensemble.model.dto.EnsembleTeamMusic;
import com.harmony.ensemble.model.dto.EnsembleTeamTime;
import com.harmony.ensemble.model.dto.EnsembleTeamVideo;
import com.harmony.ensemble.model.dto.Genre;
import com.harmony.ensemble.model.dto.Inst;
import com.harmony.ensemble.model.dto.MemberEns;
import com.harmony.model.dto.MemberInfo;


public class EnsembleService {

	private EnsembleDao dao = new EnsembleDao();
	
	public List<Genre> searchAllGenre(){
		Connection conn=getConnection();
		List<Genre> result=dao.searchAllGenre(conn);
		close(conn);
		return result;
	}
	
	public List<Inst> searchAllInst(){
		Connection conn=getConnection();
		List<Inst> result=dao.searchAllInst(conn);
		close(conn);
		return result;
	}
	
	
	public String selectMemberByEmail(String userEmail) {
		Connection conn=getConnection();
		String memNo = dao.selectMemberByEmail(conn, userEmail);
		close(conn);
		return memNo;
	}
	
	public int insertTeamLeader(String memNo, String instCode) {
		Connection conn = getConnection();
		int result = dao.insertTeamLeader(conn, memNo, instCode);
		close(conn);
		return result;
	}
	
	public int insertTeamMember(String memNo, String instCode) {
		Connection conn = getConnection();
		int result = dao.insertTeamMember(conn, memNo, instCode);
		close(conn);
		return result;
	}
	
//	
//	public MemberEns searchMemberById() {
//		Connection conn=getConnection();
//		MemberEns m = dao.searchMemberById(conn);
//		return m;
//	}
//	
	
	public int insertTeam(EnsembleTeam ensTeam, List<EnsembleTeamMusic> musicList, 
							List<EnsembleTeamVideo> videoList, List<EnsembleTeamTime> timeList) {
		Connection conn=getConnection();
		
		int result = dao.insertTeam(conn, ensTeam);
		
		if(result>0) {
			
			if(!timeList.isEmpty()) {
				for(EnsembleTeamTime time : timeList) {
					int result2 = dao.insertTime(conn, time);
					if(result2==0) {
						rollback(conn);
						throw new IllegalArgumentException("노노");
					}
				}
			}
			
			
			if(!musicList.isEmpty()) {
				for(EnsembleTeamMusic music : musicList) {
					int result3 = dao.insertMusic(conn, music);
					if(result3==0) {
						rollback(conn);
						throw new IllegalArgumentException("노노노");
					}
				}		
			}
			if(!videoList.isEmpty()) {
				for(EnsembleTeamVideo video : videoList) {		
					int result4 = dao.insertVideo(conn, video);
					if(result4==0) {
						rollback(conn);
						throw new IllegalArgumentException("노노노");
					}
				}
			}		
			
		}else {
			rollback(conn);
			throw new IllegalArgumentException("노노노");
		}
		close(conn);
		return result;
	}
	
	public String selectSeq() {
		Connection conn = getConnection();
		
		String seq = dao.selectSeq(conn);
		
		return seq;
		
	}
	
}
