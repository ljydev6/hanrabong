package com.harmony.ensemble.model.service;

import static com.harmony.common.JDBCTemplate.close;
import static com.harmony.common.JDBCTemplate.getConnection;
import static com.harmony.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.harmony.ensemble.model.dao.EnsembleDao;
import com.harmony.ensemble.model.dto.EnsembleTeam;
import com.harmony.ensemble.model.dto.EnsembleTeamMusic;
import com.harmony.ensemble.model.dto.EnsembleTeamVideo;
import com.harmony.ensemble.model.dto.Genre;


public class EnsembleService {

	private EnsembleDao dao = new EnsembleDao();
	
	public List<Genre> searchAllGenre(){
		Connection conn=getConnection();
		List<Genre> result=dao.searchAllGenre(conn);
		close(conn);
		return result;
	}
	
	public int insertTeam(EnsembleTeam ensTeam, List<EnsembleTeamMusic> musicList, List<EnsembleTeamVideo> videoList) {
		Connection conn=getConnection();
		
		
		
		int result = dao.insertTeam(conn, ensTeam);
		
		
		
		if(result>0) {
			if(!musicList.isEmpty()) {
				for(EnsembleTeamMusic music : musicList) {
					int result2 = dao.insertMusic(conn, music);
					if(result2==0) {
						rollback(conn);
						throw new IllegalArgumentException("노노노");
					}
				}		
			}
			if(!videoList.isEmpty()) {
				for(EnsembleTeamVideo video : videoList) {		
					int result3 = dao.insertVideo(conn, video);
					if(result3==0) {
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
