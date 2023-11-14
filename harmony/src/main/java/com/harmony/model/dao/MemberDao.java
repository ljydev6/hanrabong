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
	
	
	public static Member getMember(ResultSet rs) throws SQLException{
		return Member.builder()
						.memNo(rs.getString("MEM_NO"))
						.memAuthority(rs.getString("mem_authority"))
						.memKakaoNum(rs.getString("mem_kakao_num"))
						.build();
	
	
	
	}
}
