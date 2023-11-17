package com.harmony.model.dao;

import static com.harmony.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.harmony.model.dto.Member;
import com.harmony.model.dto.MemberInfo;
import com.harmony.model.dto.MemberMusic;
import com.harmony.model.dto.MemberVideo;

public class MemberDao {
	private Properties sql = new Properties();
	{
		String path= MemberDao.class.getResource("/sql/member/member_sql.properties").getPath();
		try (FileReader fr= new FileReader(path);){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public Member selectMemberByKakaoId(Connection conn, String kakaoNum) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m= null;
	try {
		pstmt=conn.prepareStatement(sql.getProperty("selectMemberByKakaoId"));
		pstmt.setString(1, kakaoNum);
		
		rs=pstmt.executeQuery();
		if(rs.next()) m=getMember(rs);
	}catch(SQLException e) {
		e.printStackTrace();
	}finally {
		close(rs);
		close(pstmt);
	}
		return m;
	}
	public int insertMember(Connection conn,Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertMember"));
			pstmt.setString(1, m.getMemNo());
			pstmt.setString(2, m.getMemAuthority());
			pstmt.setString(3, m.getMemKakaoNum());
			result=pstmt.executeUpdate();
		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int insertMemberInfo(Connection conn,MemberInfo mi) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertMemberInfo"));
			pstmt.setString(1, mi.getMemNo());
			pstmt.setString(2, mi.getEmail());
			result= pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public String selectMemNoFromDual(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result = null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectMemNoFromDual"));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	public int addintroduce(Connection conn,MemberInfo mi) {
		PreparedStatement pstmt= null;
		int result =0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("addintroduce"));
			pstmt.setString(1, mi.getMemNo());
			pstmt.setString(2,mi.getActivityArea());
			pstmt.setString(3,mi.getIntroduce());
			pstmt.setString(4, mi.getProfilPhoto());
			pstmt.setString(5, mi.getSchool());
			pstmt.setString(6, mi.getDepartment());
			pstmt.setString(7, mi.getSchoolState());
			pstmt.setString(8, mi.getName());
			pstmt.setString(9, mi.getGender());
			pstmt.setInt(10, mi.getAge());
			pstmt.setString(11,mi.getEmail());
			pstmt.setString(12,mi.getMemCareer());
			pstmt.setString(13, mi.getMemNo());
			result=pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			
			close(pstmt);
			
		}return result;
				
	}
	public int insertMusic(Connection conn,MemberMusic mm) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertMusic"));
			pstmt.setString(1,mm.getMemNo());
			pstmt.setString(2, mm.getMusicType());
			pstmt.setString(3,mm.getMusicLink());
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int insertVideo(Connection conn,MemberVideo mv) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertVideo"));
			pstmt.setString(1,mv.getMemNo());
			pstmt.setString(2, mv.getVideoType());
			pstmt.setString(3,mv.getVideoLink());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public MemberInfo selectMemberInfo(Connection conn,String memNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MemberInfo mi=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectMemberInfo"));
			pstmt.setString(1,memNo);
			rs=pstmt.executeQuery();
			if(rs.next()) mi=getMemberInfo(rs);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return mi;
	}
	
	public static Member getMember(ResultSet rs) throws SQLException{
		return Member.builder()
						.memNo(rs.getString("MEM_NO"))
						.memAuthority(rs.getString("mem_authority"))
						.memKakaoNum(rs.getString("mem_kakao_num"))
						.build();
	
	}
	public static MemberInfo getMemberInfo(ResultSet rs) throws SQLException{
		return MemberInfo.builder()
			    .memNo(rs.getString("MEM_NO"))
				.activityArea(rs.getString("MEM_INFO_ACTIVITY_AREA"))
				.introduce(rs.getString("MEM_INFO_INTRODUCE"))
				.profilPhoto(rs.getString("MEM_INFO_PROFIL_PHOTO"))
				.school(rs.getString("MEM_INFO_SCHOOL"))
				.department(rs.getString("MEM_INFO_DEPARTMENT"))
				.schoolState(rs.getString("MEM_INFO_SCHOOL_STATE"))
				.name(rs.getString("MEM_INFO_NAME"))
				.gender(rs.getString("MEM_INFO_GENDER"))
				.age(rs.getInt("MEM_INFO_AGE"))
				.email(rs.getString("MEM_INFO_EMAIL"))
				.memCareer(rs.getString("MEM_INFO_CAREER"))

				.build();
	}
}
