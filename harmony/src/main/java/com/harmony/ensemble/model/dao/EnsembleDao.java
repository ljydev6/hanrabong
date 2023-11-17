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

import com.harmony.ensemble.model.dto.EnsembleMember;
import com.harmony.ensemble.model.dto.EnsembleTeam;
import com.harmony.ensemble.model.dto.EnsembleTeamMusic;
import com.harmony.ensemble.model.dto.EnsembleTeamTime;
import com.harmony.ensemble.model.dto.EnsembleTeamVideo;
import com.harmony.ensemble.model.dto.Genre;
import com.harmony.ensemble.model.dto.Inst;
import com.harmony.ensemble.model.dto.MemberEns;
import com.harmony.ensemble.model.service.EnsembleService;


public class EnsembleDao {
private Properties sql=new Properties();
	
	{
		String path=EnsembleDao.class
				.getResource("/sql/ensemble/ensemble_sql.properties").getPath();
		try(FileReader fr=new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public String selectMemberByEmail(Connection conn, String userEmail) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String memNo = "";
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectMemberByEmail"));
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();
			
			if(rs.next()) memNo = rs.getString("MEM_NO");
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return memNo;
	}

	
	
	
	public MemberEns searchMemberById(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberEns m = null;
		
		try {
			pstmt = conn.prepareStatement(sql.getProperty("searchMemberById"));
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
			m=(MemberEns.builder()
							.memNo(rs.getString("MEM_NO"))
							.memInfoEmail(rs.getString("MEM_INFO_EMAIL"))
							.build());
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m; 
	}
	
	public int insertEnsMember(Connection conn, EnsembleMember eMem) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertEnsMember"));
			pstmt.setString(1, eMem.getEnsTeamNo());
			pstmt.setString(2, eMem.getEnsInstCode());
			pstmt.setString(3, eMem.getEnsMemNo());
			pstmt.setString(4, eMem.getEnsMemPosition());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			
			close(pstmt);
		}
		
		
		return result;
	}
	
	public int compareMemNo(Connection conn, String loginMemNo) {
		PreparedStatement pstmt =null;
//		ResultSet rs = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql.getProperty("compareMemNo"));
			pstmt.executeQuery();
			pstmt.setString(1, loginMemNo);
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}
		return result;
	}
	

	
	public List<Inst> searchAllInst(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Inst> result=new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchAllInst"));
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				result.add(getInst(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	
	public List<Genre> searchAllGenre(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Genre> result=new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchAllGenre"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result.add(getGenre(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	
	public int insertTime(Connection conn, EnsembleTeamTime time) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertTime"));
			pstmt.setString(1, time.getEnsTeamNo());
			pstmt.setString(2, time.getEnsDayOfWeek());
			pstmt.setTimestamp(3, time.getEnsStarTime());
			pstmt.setTimestamp(4, time.getEnsEndTime());
			
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	
	public int insertTeam(Connection conn, EnsembleTeam ensTeam) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertTeam"));
			pstmt.setString(1, ensTeam.getEnsTeamNo());
			pstmt.setString(2, ensTeam.getEnsTeamName());
			pstmt.setString(3, ensTeam.getEnsGenreNo());
			pstmt.setString(4, ensTeam.getEnsTeamType());
			pstmt.setString(5, ensTeam.getEnsTeamInfo());
			
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int insertMusic(Connection conn, EnsembleTeamMusic music) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertMusic"));
			pstmt.setString(1, music.getTeamNo());
			pstmt.setString(2, music.getMOriName());
			pstmt.setString(3, music.getMReName());
			
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	public int insertVideo(Connection conn, EnsembleTeamVideo video) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertVideo"));
			pstmt.setString(1, video.getTeamNo());
			pstmt.setString(2, video.getVOriName());
			pstmt.setString(3, video.getVReName());
			
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public String selectSeq(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String seq = "";
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectSeq"));
			rs=pstmt.executeQuery();
			if(rs.next()) seq =  rs.getString(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return seq;
	}
	
	private Genre getGenre(ResultSet rs) throws SQLException{
		return Genre.builder()
				.genreCode(rs.getString("genre_Code"))
				.genreName(rs.getString("genre_Name"))
				.build();
	}

	private Inst getInst(ResultSet rs) throws SQLException{
		return Inst.builder()
				.instCode(rs.getString("inst_Code"))
				.instName(rs.getString("inst_Name"))
				.build();
	}
}
