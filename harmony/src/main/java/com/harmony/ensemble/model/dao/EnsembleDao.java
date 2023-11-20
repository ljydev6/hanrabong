package com.harmony.ensemble.model.dao;

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

import com.harmony.ensemble.model.dto.EnsembleBoard;
import com.harmony.ensemble.model.dto.EnsembleBoardWantPart;
import com.harmony.ensemble.model.dto.EnsembleMember;
import com.harmony.ensemble.model.dto.EnsembleTeam;
import com.harmony.ensemble.model.dto.EnsembleTeamMusic;
import com.harmony.ensemble.model.dto.EnsembleTeamTime;
import com.harmony.ensemble.model.dto.EnsembleTeamVideo;
import com.harmony.ensemble.model.dto.Genre;
import com.harmony.ensemble.model.dto.Inst;
import com.harmony.ensemble.model.dto.VEnsList;

public class EnsembleDao {
	private Properties sql = new Properties();

	{
		String path = EnsembleDao.class.getResource("/sql/ensemble/ensemble_sql.properties").getPath();
		try (FileReader fr = new FileReader(path)) {
			sql.load(fr);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
		

	/*
	 * public List<EnsembleBoard> selectBoard(Connection conn,int cPage,int
	 * numPerpage){ 
	 * PreparedStatement pstmt=null; ResultSet rs=null;
	 * List<EnsembleBoard> result=new ArrayList<>(); try {
	 * pstmt=conn.prepareStatement(sql.getProperty("selectBoard")); pstmt.setInt(1,
	 * (cPage-1)*numPerpage+1); pstmt.setInt(2, cPage*numPerpage);
	 * rs=pstmt.executeQuery(); while(rs.next()) { result.add(getEnsBoard(rs)); }
	 * }catch(SQLException e) { e.printStackTrace(); }finally { close(rs);
	 * close(pstmt); } System.out.println("dao selectBoard result : " + result);
	 * return result; }
	 */
	 

	/*
	 * public List<EnsembleBoardWantPart> selectPartsByBoardNo(Connection conn,
	 * EnsembleBoard board){ PreparedStatement pstmt = null; ResultSet rs = null;
	 * List<EnsembleBoardWantPart> parts = new ArrayList<EnsembleBoardWantPart>();
	 * try { pstmt = conn.prepareStatement(sql.getProperty("selectPartsByBoardNo"));
	 * pstmt.setString(1, board.getEnsBoardNo()); rs=pstmt.executeQuery();
	 * 
	 * if(rs.next()) parts.add(getWantPart(rs));
	 * 
	 * }catch(SQLException e) { e.printStackTrace(); }finally { close(rs);
	 * close(pstmt); }
	 * 
	 * return parts; }
	 */

	/*
	 * public List<EnsembleTeam> selectTeamByTeamNo(Connection conn, EnsembleBoard
	 * board) { PreparedStatement pstmt=null; ResultSet rs = null;
	 * List<EnsembleTeam> team = new ArrayList<>(); try { pstmt =
	 * conn.prepareStatement(sql.getProperty("selectTeamTypeByTeamNo"));
	 * pstmt.setString(1, board.getEnsTeamNo()); rs=pstmt.executeQuery();
	 * 
	 * if(rs.next()) team.add(getEnsTeam(rs));
	 * 
	 * }catch(SQLException e) { e.printStackTrace(); }finally { close(rs);
	 * close(pstmt);
	 * 
	 * } return team; }
	 */
	
	public List<VEnsList> selectBoardList(Connection conn,int cPage, int numPerpage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<VEnsList> boardList = new ArrayList<VEnsList>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("V_ENS_LIST"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs = pstmt.executeQuery();
			
			while(rs.next()) boardList.add(getBoardList(rs));
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return boardList;
		
		
	}
	 
	public int selectBoardCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectBoardCount"));
			rs = pstmt.executeQuery();
			if (rs.next())
				result = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

//	public EnsembleBoard selectBoardByNo(Connection conn, int boardNo) {
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		EnsembleBoard b = null;
//		try {
//			pstmt = conn.prepareStatement(sql.getProperty("selectBoardByNo"));
//			pstmt.setInt(1, boardNo);
//			rs = pstmt.executeQuery();
//			if (rs.next())
//				b = getBoardList(rs);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rs);
//			close(pstmt);
//		}
//		return b;
//	}

	public String selectTeamNoByMemNo(Connection conn, String loginMemNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String teamNo = "";
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectTeamNoByMemNo"));
			pstmt.setString(1, loginMemNo);
			rs = pstmt.executeQuery();
			if (rs.next())
				teamNo = rs.getString("ENS_TEAM_NO");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return teamNo;

	}

	public EnsembleTeam selectTeamByNo(Connection conn, String teamNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EnsembleTeam team = null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectTeamByNo"));
			pstmt.setString(1, teamNo);
			rs = pstmt.executeQuery();
			if (rs.next())
				team = getTeam(rs);

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			close(rs);
			close(pstmt);

		}
		return team;
	}

	public String selectMemberByEmail(Connection conn, String userEmail) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String memNo = "";
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectMemberByEmail"));
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();

			if (rs.next())
				memNo = rs.getString("MEM_NO");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return memNo;
	}

	public int insertWantPart(Connection conn, EnsembleBoardWantPart part) {
		PreparedStatement pstmt = null;
		int result = 0;
		System.out.println(part.getEnsInstNo() + " 여기 dao!");
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertWantPart"));
			pstmt.setString(1, part.getEnsBoardNo());
			pstmt.setString(2, part.getEnsInstNo());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertEnsBoard(Connection conn, EnsembleBoard board) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertEnsBoard"));
			pstmt.setString(1, board.getEnsBoardNo());
			pstmt.setString(2, board.getEnsTeamNo());
			pstmt.setString(3, board.getEnsWriter());
			pstmt.setString(4, board.getEnsLocation());
			pstmt.setString(5, board.getEnsPlace());
			pstmt.setString(6, board.getEnsDetail());
			pstmt.setString(7, board.getEnsBoardTitle());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertEnsMember(Connection conn, EnsembleMember eMem) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertEnsMember"));
			pstmt.setString(1, eMem.getEnsTeamNo());
			pstmt.setString(2, eMem.getEnsInstCode());
			pstmt.setString(3, eMem.getEnsMemNo());
			pstmt.setString(4, eMem.getEnsMemPosition());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close(pstmt);
		}

		return result;
	}

	public int compareMemNo(Connection conn, String loginMemNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql.getProperty("compareMemNo"));
			pstmt.executeQuery();
			pstmt.setString(1, loginMemNo);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();

		}
		return result;
	}

	public List<EnsembleTeamTime> selectTimes(Connection conn, String teamNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<EnsembleTeamTime> result = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectTimes"));
			pstmt.setString(1, teamNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				result.add(getTime(rs));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(conn);

		}
		return result;
	}

	public List<EnsembleTeamMusic> selectMusics(Connection conn, String teamNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<EnsembleTeamMusic> result = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectMusics"));
			pstmt.setString(1, teamNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				result.add(getMusic(rs));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(conn);

		}
		return result;
	}

	public List<EnsembleTeamVideo> selectVideos(Connection conn, String teamNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<EnsembleTeamVideo> result = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectVideos"));
			pstmt.setString(1, teamNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				result.add(getVideo(rs));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(conn);

		}
		return result;
	}

	public List<Inst> searchAllInst(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Inst> result = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("searchAllInst"));
			rs = pstmt.executeQuery();

			while (rs.next()) {
				result.add(getInst(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public List<Genre> searchAllGenre(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Genre> result = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("searchAllGenre"));
			rs = pstmt.executeQuery();
			while (rs.next()) {
				result.add(getGenre(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public int insertTime(Connection conn, EnsembleTeamTime time) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertTime"));
			pstmt.setString(1, time.getEnsTeamNo());
			pstmt.setString(2, time.getEnsDayOfWeek());
			pstmt.setTimestamp(3, time.getEnsStartTime());
			pstmt.setTimestamp(4, time.getEnsEndTime());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertTeam(Connection conn, EnsembleTeam ensTeam) {
		PreparedStatement pstmt = null;
		int result = 0;
//		System.out.println("팀테이블 팀번호: "+ensTeam.getEnsTeamNo());
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertTeam"));
			pstmt.setString(1, ensTeam.getEnsTeamNo());
			pstmt.setString(2, ensTeam.getEnsTeamName());
			pstmt.setString(3, ensTeam.getEnsGenreNo());
			pstmt.setString(4, ensTeam.getEnsTeamType());
			pstmt.setString(5, ensTeam.getEnsTeamInfo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertMusic(Connection conn, EnsembleTeamMusic music) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertMusic"));
			pstmt.setString(1, music.getTeamNo());
			pstmt.setString(2, music.getMOriName());
			pstmt.setString(3, music.getMReName());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertVideo(Connection conn, EnsembleTeamVideo video) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertVideo"));
			pstmt.setString(1, video.getTeamNo());
			pstmt.setString(2, video.getVOriName());
			pstmt.setString(3, video.getVReName());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public String selectSeq(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String seq = "";
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectSeq"));
			rs = pstmt.executeQuery();
			if (rs.next())
				seq = rs.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return seq;
	}

	public String selectBoardSeq(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String seq = "";
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectBoardSeq"));
			rs = pstmt.executeQuery();
			if (rs.next())
				seq = rs.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return seq;
	}

//	private EnsembleBoardWantPart getWantPart(ResultSet rs) throws SQLException {
//		return EnsembleBoardWantPart.builder().ensPartIndex(rs.getString("ENS_PART_INDEX"))
//				.ensBoardNo(rs.getString("ENS_BOARD_NO")).ensInstNo(rs.getString("ENS_INST_NO")).build();
//
//	}
//
//	private EnsembleTeam getEnsTeam(ResultSet rs) throws SQLException {
//		return EnsembleTeam.builder().ensTeamNo(rs.getString("ENS_TEAM_NO")).ensTeamName(rs.getString("ENS_TEAM_NAME"))
//				.ensGenreNo(rs.getString("ENS_GENRE_NO")).ensTeamType(rs.getString("ENS_TEAM_TYPE"))
//				.ensTeamInfo(rs.getString("ENS_TEAM_INFO")).build();
//
//	}
//
//	private EnsembleBoard getEnsBoard(ResultSet rs) throws SQLException {
//		return EnsembleBoard.builder().ensBoardNo(rs.getString("ENS_BOARD_NO")).ensTeamNo(rs.getString("ENS_TEAM_NO"))
//				.ensWriter(rs.getString("ENS_WRITER")).ensLocation(rs.getString("ENS_LOCATION"))
//				.ensPlace(rs.getString("ENS_PLACE")).ensDetail(rs.getString("ENS_DETAIL"))
//				.ensBoardDate(rs.getTimestamp("ENS_BOARD_DATE")).ensBoardTitle(rs.getString("ENS_BOARD_TITLE"))
//				.ensBoardView(rs.getInt("ENS_BOARD_VIEW")).build();
//	}

	
	private VEnsList getBoardList(ResultSet rs) throws SQLException{
		return VEnsList.builder()
							.ensBoardNo(rs.getString("ENS_BOARD_NO"))
							.ensBoardTitle(rs.getString("ENS_BOARD_TITLE"))
							.ensTeamName(rs.getString("ENS_TEAM_NAME"))
							.genreName(rs.getString("GENRE_NAME"))
							.ensLocation(rs.getString("ENS_LOCATION"))
							.ensTeamType(rs.getString("ENS_TEAM_TYPE"))
							.ensBoardDate(rs.getTimestamp("ENS_BOARD_DATE"))
							.instrument(rs.getString("ENS_BOARD_DATE").split(","))
							.build();
	}
	
	private EnsembleTeamTime getTime(ResultSet rs) throws SQLException {
		return EnsembleTeamTime.builder().ensDayOfWeek(rs.getString("ENS_DAY_OF_WEEK"))
				.ensStartTime(rs.getTimestamp("ENS_START_TIME")).ensEndTime(rs.getTimestamp("ENS_END_TIME")).build();
	}

	private EnsembleTeamMusic getMusic(ResultSet rs) throws SQLException {
		return EnsembleTeamMusic.builder().mNo(rs.getString("M_NO")).mOriName(rs.getString("M_ORI_NAME"))
				.mReName(rs.getString("M_RE_NAME")).build();
	}

	private EnsembleTeamVideo getVideo(ResultSet rs) throws SQLException {
		return EnsembleTeamVideo.builder().vNo(rs.getString("V_NO")).vOriName(rs.getString("V_ORI_NAME"))
				.vReName(rs.getString("V_RE_NAME")).build();
	}

	private EnsembleTeam getTeam(ResultSet rs) throws SQLException {
		return EnsembleTeam.builder().ensTeamNo(rs.getString("ENS_TEAM_NO")).ensTeamName(rs.getString("ENS_TEAM_NAME"))
				.ensGenreNo(rs.getString("ENS_GENRE_NO")).ensTeamType(rs.getString("ENS_TEAM_TYPE"))
				.ensTeamInfo(rs.getString("ENS_TEAM_INFO")).build();

	}

	private Genre getGenre(ResultSet rs) throws SQLException {
		return Genre.builder().genreCode(rs.getString("genre_Code")).genreName(rs.getString("genre_Name")).build();
	}

	private Inst getInst(ResultSet rs) throws SQLException {
		return Inst.builder().instCode(rs.getString("inst_Code")).instName(rs.getString("inst_Name")).build();
	}
}
