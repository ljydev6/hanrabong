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
import com.harmony.ensemble.model.dto.VBoardView;
import com.harmony.ensemble.model.dto.VEnsList;

public class EnsembleService {

	private EnsembleDao dao = new EnsembleDao();

	
	public VBoardView selectBoardView(String ensBoardNo) {
		Connection conn = getConnection();
		VBoardView board = dao.selectBoardView(conn, ensBoardNo);
		close(conn);
		return board;
	}
	
  public List<VEnsList> selectBoardList(int cPage,int numPerpage){ 
		  Connection conn=getConnection();
		  List<VEnsList> result=dao.selectBoardList(conn, cPage, numPerpage);
		  close(conn); 
		  return result; 
	  }
	  
	public int selectBoardCount() {
		Connection conn=getConnection();
		int result=dao.selectBoardCount(conn);
		close(conn);
		return result;
	}

	/*
	 * public List<EnsembleBoardWantPart> selectPartsByBoardNo(List<EnsembleBoard>
	 * boards){ Connection conn = getConnection(); List<EnsembleBoardWantPart> parts
	 * = new ArrayList<>();
	 * 
	 * if(!boards.isEmpty()) { for(EnsembleBoard board : boards) { parts =
	 * dao.selectPartsByBoardNo(conn, board); } }else throw new
	 * IllegalArgumentException("boars is empty");
	 * 
	 * return parts;
	 * 
	 * }
	 */

	/*
	 * public List<EnsembleTeam> selectTeamByTeamNo(List<EnsembleBoard> boards) {
	 * Connection conn = getConnection(); List<EnsembleTeam> team = new
	 * ArrayList<EnsembleTeam>();
	 * 
	 * if(!boards.isEmpty()) { for(EnsembleBoard board : boards) { team =
	 * dao.selectTeamByTeamNo(conn, board); } }else { throw new
	 * IllegalArgumentException("boars is empty"); } close(conn); return team; }
	 *
	 */
	/*
	 * public int selectBoardCount() { Connection conn=getConnection(); int
	 * result=dao.selectBoardCount(conn); close(conn); return result; }
	 */

	public int insertEnsBoard(EnsembleBoard board, List<EnsembleBoardWantPart> partList) {

		Connection conn = getConnection();

		int result = dao.insertEnsBoard(conn, board);

		if (result > 0) {
			if (!partList.isEmpty()) {
				for (EnsembleBoardWantPart part : partList) {
					System.out.println(part + "서비스!");
					int result2 = dao.insertWantPart(conn, part);
					if (result2 == 0) {
						rollback(conn);
						throw new IllegalArgumentException("모집파트 등록 에러");
					}
				}
			}
		} else {
			rollback(conn);
			throw new IllegalArgumentException("글 등록 에러");
		}
		close(conn);
		return result;
	}

	public int insertTeam(EnsembleTeam ensTeam, List<EnsembleTeamMusic> musicList, List<EnsembleTeamVideo> videoList,
			List<EnsembleTeamTime> timeList, List<EnsembleMember> ensMemList) {
		Connection conn = getConnection();

		int result = dao.insertTeam(conn, ensTeam);

		if (result > 0) {

			if (!timeList.isEmpty()) {
				for (EnsembleTeamTime time : timeList) {
					int result2 = dao.insertTime(conn, time);
					if (result2 == 0) {
						rollback(conn);
						throw new IllegalArgumentException("합주 일정 에러");
					}
				}
			}

			if (!musicList.isEmpty()) {
				for (EnsembleTeamMusic music : musicList) {
					int result3 = dao.insertMusic(conn, music);
					if (result3 == 0) {
						rollback(conn);
						throw new IllegalArgumentException("음원 업로드 에러");
					}
				}
			}
			if (!videoList.isEmpty()) {
				for (EnsembleTeamVideo video : videoList) {
					int result4 = dao.insertVideo(conn, video);
					if (result4 == 0) {
						rollback(conn);
						throw new IllegalArgumentException("비디오 업로드 에러");
					}
				}
			}

			if (!ensMemList.isEmpty()) {
				for (EnsembleMember ensMem : ensMemList) {
					int result5 = dao.insertEnsMember(conn, ensMem);
					if (result5 == 0) {
						rollback(conn);
						throw new IllegalArgumentException("팀원 등록 에러");
					}
				}
			}

		} else {
			rollback(conn);
			throw new IllegalArgumentException("팀테이블 등록 에러");
		}
		close(conn);
		return result;
	}

	public List<EnsembleTeamTime> selectTimes(String teamNo) {
		Connection conn = getConnection();
		List<EnsembleTeamTime> result = dao.selectTimes(conn, teamNo);
		close(conn);
		return result;
	}

	public List<EnsembleTeamMusic> selectMusics(String teamNo) {
		Connection conn = getConnection();
		List<EnsembleTeamMusic> result = dao.selectMusics(conn, teamNo);
		close(conn);
		return result;
	}

	public List<EnsembleTeamVideo> selectVideos(String teamNo) {
		Connection conn = getConnection();
		List<EnsembleTeamVideo> result = dao.selectVideos(conn, teamNo);
		close(conn);
		return result;
	}

	public List<Inst> searchAllInst() {
		Connection conn = getConnection();
		List<Inst> result = dao.searchAllInst(conn);
		close(conn);
		return result;
	}

	public List<Genre> searchAllGenre() {
		Connection conn = getConnection();
		List<Genre> result = dao.searchAllGenre(conn);
		close(conn);
		return result;
	}

	public String selectMemberByEmail(String userEmail) {
		Connection conn = getConnection();
		String memNo = dao.selectMemberByEmail(conn, userEmail);
		close(conn);
		return memNo;
	}

	public String selectSeq() { // 팀 번호 가져오는 메소드
		Connection conn = getConnection();

		String seq = dao.selectSeq(conn);

		return seq;

	}

	public String selectBoardSeq() {
		Connection conn = getConnection();

		String seq = dao.selectBoardSeq(conn);

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
